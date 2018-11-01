//
//  BSNumbersView.m
//  BSNumbersSample
//
//  Created by 张亚东 on 16/4/6.
//  Copyright © 2016年 blurryssky. All rights reserved.
//

#import "BSNumbersView.h"
#import "BSNumbersCollectionCell.h"
#import "BSNumbersCollectionFooterView.h"
#import "NSObject+BSNumbersExtension.h"
#import "BSNumbersDataManager.h"
#import "JHHeaderFlowLayout.h"
#import "BSCollectionHeaderView.h"
///为了产生联动，需要在leftCollectionCell中修改label的superView宽度为BSNumberLeftCellWidth

NSString * const CellReuseIdentifer = @"BSNumbersCollectionCell";
NSString * const FooterReuseIdentifer = @"BSNumbersCollectionFooterView";
NSString * const HeaderReuseIdentifer = @"BSCollectionHeaderView";
#define  BSNumberLeftCellWidth 150/2
#define   BSNumberCellWidth 240/2
#define   BSNumberHeadCollectionCellHeight 70
#define  BSNumberSectionHeaderHeight 30
@interface BSNumbersView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate,UIGestureRecognizerDelegate>

//@property (strong, nonatomic) BSNumbersDataManager *dataManager;
@property (copy, nonatomic) BSNumbersViewMoveBlockFinished block;
@property (assign, nonatomic) NSInteger listCount;
@property (strong, nonatomic) CAShapeLayer* topLeftLabelSeparatorLayer;
@property (assign, nonatomic) NSInteger sectionCount;
@property (assign, nonatomic) NSInteger spaceCellCount;
@property (strong, nonatomic) UILabel *topLeftLabel;

//整个滚动页面，上面有headerSlideCollectionView跟slideCollectionView
@property (strong, nonatomic) UIScrollView *slideScrollView;

@property (strong, nonatomic) CAShapeLayer *horizontalDivideShadowLayer;
@property (strong, nonatomic) CAShapeLayer *verticalDivideShadowLayer;

- (void)setup;
- (void)setupVars;
- (void)setupViews;

- (void)handleNotification:(NSNotification *)noti;

- (void)updateFrame;

//- (void)showHorizontalDivideShadowLayer;
//- (void)dismissHorizontalDivideShadowLayer;
//
//- (void)showVerticalDivideShadowLayer;
//- (void)dismissVerticalDivideShadowLayer;

- (UICollectionView *)initializeCollectionView;
- (CAShapeLayer *)initializeLayer;

@end

@implementation BSNumbersView
#pragma mark - Override


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self setup];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
                [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
       
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrame];
    [self reloadData];
}
#pragma mark - Notification

- (void)handleNotification:(NSNotification *)noti {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    
    if (orientation != UIDeviceOrientationPortraitUpsideDown) {
        [UIView animateWithDuration:0.3 animations:^{
            [self updateFrame];
        }];
    }
    
}

#pragma mark - Private

- (void)setup {
    [self setupVars];
    [self setupViews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:UIDeviceOrientationDidChangeNotification object:nil];
   
}

- (void)setupVars {
    self.minItemWidth = 100;
    self.maxItemWidth = 150;
    self.itemHeight = 50;
    self.itemTextHorizontalMargin = 10;
    self.freezeColumn = 1;
    self.headerFont = FontOfSize(17);
    self.headerTextColor = [UIColor whiteColor];
    self.headerBackgroundColor = BlackColorCCCCCC;
    self.slideBodyFont = self.headerFont;
    self.slideBodyTextColor = [UIColor blackColor];
    self.slideBodyBackgroundColor = [UIColor whiteColor];
    self.freezeBodyFont = self.headerFont;
    self.freezeBodyTextColor = [UIColor whiteColor];
    self.freezeBodyBackgroundColor = BlackColorCCCCCC;
}

- (void)setupViews {

//    [self addSubview:self.headerleftCollectionView];
    
    
    [self addSubview:self.slideScrollView];
    [self addSubview:self.leftBackgroundCollectionView];
    [self addSubview:self.leftCollectionView];
    [self.slideScrollView addSubview:self.headerSlideCollectionView];
    [self.slideScrollView addSubview:self.slideCollectionView];
    
//    [self.layer addSublayer:self.horizontalDivideShadowLayer];
//    [self.slideScrollView.layer addSublayer:self.verticalDivideShadowLayer];
       [self addSubview:self.topLeftLabel];
}

- (void)updateFrame {
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    self.spaceCellCount = (width-BSNumberCellWidth*self.listCount-BSNumberLeftCellWidth)/BSNumberCellWidth+1;
    if (self.spaceCellCount < 0) {
        self.spaceCellCount = 0;
    }
    
        CGFloat headerHeight = BSNumberHeadCollectionCellHeight;
        self.topLeftLabel.frame = CGRectMake(0, 0, BSNumberLeftCellWidth, headerHeight);
    [self topLeftLabelAddSeperateLayer];
//        self.headerleftCollectionView.frame = CGRectMake(0,
//                                                           0,
//                                                           self.dataManager.freezeWidth ,
//                                                           headerHeight);
        self.leftCollectionView.frame = CGRectMake(0,
                                                     headerHeight,
                                                     width,
                                                     height - headerHeight);
        self.leftBackgroundCollectionView.frame = CGRectMake(0,
                                                   headerHeight,
                                                   BSNumberLeftCellWidth,
                                                   height - headerHeight);
        self.slideScrollView.frame = CGRectMake(0,
                                                  0,
                                                  width ,
                                                  height);
        self.slideScrollView.contentSize = CGSizeMake(BSNumberCellWidth*(self.listCount+self.spaceCellCount)+BSNumberLeftCellWidth,
                                                        height);
        
        self.headerSlideCollectionView.frame = CGRectMake(BSNumberLeftCellWidth,
                                                            0,
                                                             BSNumberCellWidth*(self.listCount+self.spaceCellCount),
                                                            headerHeight);
        self.slideCollectionView.frame = CGRectMake(BSNumberLeftCellWidth,
                                                      headerHeight,
                                                      BSNumberCellWidth*(self.listCount+self.spaceCellCount),
                                                      height - headerHeight);
    
}

//- (void)showHorizontalDivideShadowLayer {
//    if (self.horizontalDivideShadowLayer.path == nil) {
//        CGFloat width = self.bounds.size.width;
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(0, BSNumberHeadCollectionCellHeight)];
//        [path addLineToPoint:CGPointMake(width, BSNumberHeadCollectionCellHeight)];
//        path.lineWidth = 0.5;
//        
//        self.horizontalDivideShadowLayer.path = path.CGPath;
//    }
//}
//
//- (void)dismissHorizontalDivideShadowLayer {
//    self.horizontalDivideShadowLayer.path = nil;
//}
//
//- (void)showVerticalDivideShadowLayer {
//    if (self.verticalDivideShadowLayer.path == nil) {
//        
//        CGFloat height = self.leftCollectionView.contentSize.height;
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(BSNumberLeftCellWidth, self.slideScrollView.frame.origin.y)];
//        [path addLineToPoint:CGPointMake(BSNumberLeftCellWidth, height)];
//        path.lineWidth = 0.5;
//        
//        self.verticalDivideShadowLayer.path = path.CGPath;
//    }
//}
//
//- (void)dismissVerticalDivideShadowLayer {
//    self.verticalDivideShadowLayer.path = nil;
//}

#pragma mark - Public

- (void)reloadData {
    if ([self.delegate respondsToSelector:@selector(numberOfSectionInNumbersView:)]) {
        self.sectionCount = [self.delegate numberOfSectionInNumbersView:self];
    }
    
    if ([self.delegate respondsToSelector:@selector(listCountOfNumbersView:)]) {
        self.listCount = [self.delegate listCountOfNumbersView:self];
    }

    [self updateFrame];
    [self layoutIfNeeded];
//    [self.headerleftCollectionView reloadData];
    [self.headerSlideCollectionView reloadData];
    [self.leftCollectionView reloadData];
    [self.slideCollectionView reloadData];
    [self.leftBackgroundCollectionView reloadData];
  }
-(void)scrollToSection:(NSInteger)section animated:(BOOL)animated{
    NSIndexPath* cellIndexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    UICollectionViewLayoutAttributes* attr = [self.leftCollectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:cellIndexPath];
    UIEdgeInsets insets = self.leftCollectionView.scrollIndicatorInsets;
    
    CGRect rect = attr.frame;
    rect.size = self.leftCollectionView.frame.size;
    rect.size.height -= insets.top + insets.bottom;
    CGFloat offset = (rect.origin.y + rect.size.height) - self.leftCollectionView.contentSize.height;
    if ( offset > 0.0 ) rect = CGRectOffset(rect, 0, -offset);
    
    [self.leftCollectionView scrollRectToVisible:rect animated:animated];
}

//- (CGSize)sizeForFreezeAtColumn:(NSInteger)column {
//    
//    if ([self.delegate respondsToSelector:@selector(numbersView:sizeAtIndexPath:)]) {
//        
//    }
//    CGSize size = CGSizeFromString(self.dataManager.freezeItemSize[column]);
//    return size;
//}
//
//- (CGSize)sizeForSlideAtColumn:(NSInteger)column {
//    CGSize size = CGSizeFromString(self.dataManager.slideItemSize[column]);
//    return size;
//}

//- (NSString *)textForHeaderFreezeAtColumn:(NSInteger)column {
//    return self.dataManager.headerFreezeData[column];
//}
//
//- (NSString *)textForHeaderSlideAtColumn:(NSInteger)column {
//    return self.dataManager.headerSlideData[column];
//}
//
//- (NSString *)textForBodyFreezeAtIndexPath:(NSIndexPath *)indexPath {
//    return self.dataManager.bodyFreezeData[indexPath.section][indexPath.row];
//}
//
//- (NSString *)textForBodySlideAtIndexPath:(NSIndexPath *)indexPath {
//    return self.dataManager.bodySlideData[indexPath.section][indexPath.row];
//}

#pragma mark - Setter

//- (void)setMinItemWidth:(CGFloat)minItemWidth {
//    _minItemWidth = minItemWidth;
//    
//    self.dataManager.minItemWidth = minItemWidth;
//}
//
//- (void)setMaxItemWidth:(CGFloat)maxItemWidth {
//    _maxItemWidth = maxItemWidth;
//    
//    self.dataManager.maxItemWidth = maxItemWidth;
//}
//
//- (void)setFreezeColumn:(NSInteger)freezeColumn {
//    _freezeColumn = freezeColumn;
//    
//    self.dataManager.freezeColumn = freezeColumn;
//}
//
//- (void)setItemHeight:(CGFloat)itemHeight {
//    _itemHeight = itemHeight;
//    
//    self.dataManager.itemHeight = itemHeight;
//}

//- (void)setItemHorizontalMargin:(CGFloat)itemTextHorizontalMargin {
//    _itemTextHorizontalMargin = itemTextHorizontalMargin;
//    
//    self.dataManager.itemTextHorizontalMargin = itemTextHorizontalMargin;
//}
//
//- (void)setHeaderFont:(UIFont *)headerFont {
//    _headerFont = headerFont;
//    
//    self.dataManager.headerFont = headerFont;
//}
//
//- (void)setSlideBodyFont:(UIFont *)slideBodyFont {
//    _slideBodyFont = slideBodyFont;
//    
//    self.dataManager.slideBodyFont = slideBodyFont;
//}

//- (void)setHeaderData:(NSArray<NSString *> *)headerData {
//    _headerData = headerData;
//    
//    self.dataManager.headerData = headerData;
//}
//
//- (void)setBodyData:(NSArray<NSObject *> *)bodyData {
//    _bodyData = bodyData;
//    
//    self.dataManager.bodyData = bodyData;
//}

#pragma mark - Getter

//- (BSNumbersDataManager *)dataManager {
//    if (!_dataManager) {
//        _dataManager = [BSNumbersDataManager new];
//    }
//    return _dataManager;
//}

//- (UICollectionView *)headerleftCollectionView {
//    if (!_headerleftCollectionView) {
//        _headerleftCollectionView = [self initializeCollectionView];
//    }
//    return _headerleftCollectionView;
//}

-(UILabel*)topLeftLabel{
    if (!_topLeftLabel) {
        _topLeftLabel = [[UILabel alloc]init];
        _topLeftLabel.backgroundColor = [UIColor whiteColor];
       
      
    }
    
    return _topLeftLabel;
}
-(void)topLeftLabelAddSeperateLayer{
   
    if (!self.topLeftLabelSeparatorLayer) {
        self.topLeftLabelSeparatorLayer  = [CAShapeLayer layer];
        self.topLeftLabelSeparatorLayer.strokeColor = BlackColorCCCCCC.CGColor;
        self.topLeftLabelSeparatorLayer.lineWidth = lineHeight;
       
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
  
    
    [path moveToPoint:CGPointMake(0, BSNumberHeadCollectionCellHeight-lineHeight/2)];
    
    [path addLineToPoint:CGPointMake(BSNumberLeftCellWidth - lineHeight, BSNumberHeadCollectionCellHeight-lineHeight/2)];
    //    [path moveToPoint:CGPointMake(self.bounds.size.width - 1, 0)];
    //    [path addLineToPoint:CGPointMake(self.bounds.size.width - 1, self.bounds.size.height)];
    

    [path moveToPoint:CGPointMake(BSNumberLeftCellWidth - lineHeight/2, 0)];
    [path addLineToPoint:CGPointMake(BSNumberLeftCellWidth - lineHeight/2, BSNumberHeadCollectionCellHeight)];

    self.topLeftLabelSeparatorLayer.path = path.CGPath;
    [self.topLeftLabel.layer addSublayer:self.topLeftLabelSeparatorLayer];
}
- (UICollectionView *)headerSlideCollectionView {
    if (!_headerSlideCollectionView) {
        _headerSlideCollectionView = [self initializeCollectionView];
        _headerSlideCollectionView.userInteractionEnabled = YES;
    }
    return _headerSlideCollectionView;
}

- (UICollectionView *)leftCollectionView {
    if (!_leftCollectionView) {
        _leftCollectionView = [self initializeLeftCollectionView];
       
    }
    return _leftCollectionView;
}
- (UICollectionView *)leftBackgroundCollectionView {
    if (!_leftBackgroundCollectionView) {
        _leftBackgroundCollectionView = [self initializeLeftCollectionView];
        _leftBackgroundCollectionView.backgroundColor = [UIColor whiteColor];
        _leftBackgroundCollectionView.userInteractionEnabled  = YES;
        
    }
    
    return _leftBackgroundCollectionView;
}

- (UICollectionView *)slideCollectionView {
    if (!_slideCollectionView) {
        _slideCollectionView = [self initializeSlideCollectionView];
    }
    return _slideCollectionView;
}

- (UIScrollView *)slideScrollView {
    if (!_slideScrollView) {
        _slideScrollView = [UIScrollView new];
        _slideScrollView.bounces = NO;
        _slideScrollView.showsHorizontalScrollIndicator = NO;
        _slideScrollView.delegate = self;
        
    }
    return _slideScrollView;
}

- (CAShapeLayer *)horizontalDivideShadowLayer {
    if (!_horizontalDivideShadowLayer) {
        _horizontalDivideShadowLayer = [self initializeLayer];
        _horizontalDivideShadowLayer.shadowOffset = CGSizeMake(0, 3);
    }
    return _horizontalDivideShadowLayer;
}

- (CAShapeLayer *)verticalDivideShadowLayer {
    if (!_verticalDivideShadowLayer) {
        _verticalDivideShadowLayer = [self initializeLayer];
    }
    return _verticalDivideShadowLayer;
}

#pragma mark - Helper

- (UICollectionView *)initializeCollectionView {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.footerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1);
    
    
    UICollectionView *c = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    c.dataSource = self;
    c.delegate = self;
    c.userInteractionEnabled = NO;
    [c registerClass:[BSNumbersCollectionCell class] forCellWithReuseIdentifier:CellReuseIdentifer];
    [c registerClass:[BSNumbersCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifer];
    [c registerClass:[BSNumbersCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifer];
    c.backgroundColor = [UIColor clearColor];
    c.showsVerticalScrollIndicator = NO;
    c.bounces = NO;
    c.translatesAutoresizingMaskIntoConstraints = NO;
    return c;
}

-(UICollectionView*)initializeSlideCollectionView{
    JHHeaderFlowLayout *flowLayout = [[JHHeaderFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    flowLayout.footerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1);
     flowLayout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, BSNumberSectionHeaderHeight);
    UICollectionView *c = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    
    c.dataSource = self;
    c.delegate = self;
    [c registerClass:[BSNumbersCollectionCell class] forCellWithReuseIdentifier:CellReuseIdentifer];
    [c registerClass:[BSNumbersCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifer];
    [c registerNib:[UINib nibWithNibName:HeaderReuseIdentifer bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderReuseIdentifer];
    c.backgroundColor = [UIColor clearColor];
    c.showsVerticalScrollIndicator = NO;
    c.bounces = NO;
    c.translatesAutoresizingMaskIntoConstraints = NO;
    return c;

}
-(UICollectionView*)initializeLeftCollectionView{
    
    UICollectionView *c = [self initializeSlideCollectionView];
    
    c.userInteractionEnabled = NO;
    //    c.userInteractionEnabled = NO;
//    [c.panGestureRecognizer requireGestureRecognizerToFail:self.slideCollectionView.panGestureRecognizer];
    return c;
    
}
- (CAShapeLayer *)initializeLayer {
    CAShapeLayer *s = [CAShapeLayer new];
    s.strokeColor = BlackColorCCCCCC.CGColor;
    s.shadowColor = [UIColor blackColor].CGColor;
    s.shadowOffset = CGSizeMake(2, 0);
    s.shadowOpacity = 1;
    return s;
}

- (BOOL)didImplementation:(SEL)aSelector {
    
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(BSNumbersViewDelegate)]) {
        if ([self.delegate respondsToSelector:aSelector]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

- (void)useCustomView:(UIView *)customView inCell:(BSNumbersCollectionCell *)cell {
    
   
    customView.frame = cell.bounds;
    
   
    cell.customView = customView;
}

#pragma mark - Cell Configuration


#pragma mark - UICollectionViewDataSource
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
   
    if ((collectionView==self.slideCollectionView||collectionView == self.leftCollectionView||collectionView ==self.leftBackgroundCollectionView)) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, BSNumberSectionHeaderHeight);
    }else{
        return CGSizeZero;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSIndexPath*index = [NSIndexPath indexPathForRow:indexPath.row/(self.listCount+self.spaceCellCount) inSection:indexPath.section];
    
    if (collectionView == self.leftCollectionView) {
        if ([self.delegate respondsToSelector:@selector(numbersView:sizeAtIndexPath:list:)]) {
            CGSize size = [self.delegate numbersView:self sizeAtIndexPath:indexPath list:0];
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, size.height);
        }
        
        
    }else if(collectionView == self.leftBackgroundCollectionView){
        if ([self.delegate respondsToSelector:@selector(numbersView:sizeAtIndexPath:list:)]) {
            CGSize size = [self.delegate numbersView:self sizeAtIndexPath:indexPath list:0];
            
            return CGSizeMake(BSNumberLeftCellWidth, size.height);
        }
    }
    else if(collectionView == self.headerSlideCollectionView){
        if ([self.delegate respondsToSelector:@selector(numbersView:sizeAtIndexPath:list:)]) {
            CGSize size = [self.delegate numbersView:self sizeAtIndexPath:index list:indexPath.row%(self.listCount+self.spaceCellCount)];
           
            return CGSizeMake(size.width, BSNumberHeadCollectionCellHeight);
        }

    }
    else{
        
        if ([self.delegate respondsToSelector:@selector(numbersView:sizeAtIndexPath:list:)]) {
            CGSize size = [self.delegate numbersView:self sizeAtIndexPath:index list:indexPath.row%(self.listCount+self.spaceCellCount)];
            
            return size;
        }
        
    }
    return CGSizeZero;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    //    collectionView == self.headerleftCollectionView ||
    if (
        collectionView == self.headerSlideCollectionView) {
        return 1;
    } else {
        if ([self.delegate respondsToSelector:@selector(numberOfSectionInNumbersView:)]) {
            return  self.sectionCount;
        }else{
            return 1;
        }
        //        return self.bodyData.count;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//collectionView == self.headerleftCollectionView ||
    NSInteger list = (self.listCount+self.spaceCellCount);
       NSInteger row = 0;
    if ([self.delegate respondsToSelector:@selector(numbersView:numberOfRowInSection:)]) {
        row =[self.delegate numbersView:self numberOfRowInSection:section];
        
        
    }

    if (collectionView == self.leftCollectionView||collectionView == self.leftBackgroundCollectionView) {
        return row;
    } else if(collectionView ==self.headerSlideCollectionView){
        return list;
    }else{
        
               return list*row;
        
//        NSObject *firstBodyData = self.bodyData.firstObject;
//        NSInteger slideColumn = [firstBodyData getPropertiesValues].count - self.freezeColumn;
//        return slideColumn;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BSNumbersCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentifer forIndexPath:indexPath];
    cell.horizontalMargin = self.itemTextHorizontalMargin;
    
//    if (collectionView == self.headerleftCollectionView) {
//        
//        [self configureHeaderFreezeCell:cell indexPath:indexPath];
//        
//    } else
    if (collectionView == self.headerSlideCollectionView) {
        
        if ([self.delegate respondsToSelector:@selector(numbersView:viewForHeaderFreezeAtList:)]) {
             NSInteger list =indexPath.row%(self.listCount+self.spaceCellCount);
            if (list <self.listCount) {
                return [self.delegate numbersView:self viewForHeaderFreezeAtList:list];
            }else{
                return cell;
            }
            
        }
        
    } else if (collectionView == self.leftCollectionView ) {
        
        if ([self.delegate respondsToSelector:@selector(numbersView:viewForLeftFreezeAtIndexPath:)]) {
            NSIndexPath*index = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            return [self.delegate numbersView:self viewForLeftFreezeAtIndexPath:index];
        }

      } else if ( collectionView ==self.leftBackgroundCollectionView) {
          if ([self.delegate respondsToSelector:@selector(numbersView:viewForLeftFreezeBackgroundAtIndexPath:)]) {
              NSIndexPath*index = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
              return [self.delegate numbersView:self viewForLeftFreezeBackgroundAtIndexPath:index];
          }

    } else if(collectionView == self.slideCollectionView){
        if ([self.delegate respondsToSelector:@selector(numbersView:viewForBodySlideAtIndexPath:list:)]) {
            NSIndexPath*index = [NSIndexPath indexPathForRow:indexPath.row/(self.listCount+self.spaceCellCount) inSection:indexPath.section];
            NSInteger list =indexPath.row%(self.listCount+self.spaceCellCount);
            if (list <self.listCount) {
                return [self.delegate numbersView:self viewForBodySlideAtIndexPath:index list:list];
            }else{
                return cell;
            }

            
        }

    }
    
    
    
    
    
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionFooter) {
        BSNumbersCollectionFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterReuseIdentifer forIndexPath:indexPath];
//        collectionView == self.headerleftCollectionView ||
        if (
            collectionView == self.headerSlideCollectionView) {
            footerView.lineStyle = BSNumbersLineStyleReal;
        } else {
//            if (indexPath.section != self.bodyData.count - 1) {
//                footerView.lineStyle = BSNumbersLineStyleDotted;
//            } else {
                footerView.lineStyle = BSNumbersLineStyleReal;
//            }
        }
        return footerView;
    } else {
        if (collectionView !=self.headerSlideCollectionView) {
            BSCollectionHeaderView*headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderReuseIdentifer forIndexPath:indexPath];
            if ([self.delegate respondsToSelector:@selector(numbersView:titleForBodyHeaderInSection:)]) {
                NSString*title= [self.delegate numbersView:self titleForBodyHeaderInSection:indexPath.section];
                headerView.titleLabel.text = title;
            }
           
            return headerView;
        }else{
            return nil;
        }
       
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if (collectionView== self.leftBackgroundCollectionView) {
        
      
        if ([self.delegate respondsToSelector:@selector( numbersView:leftItemSelectedAtIndexPath:)]) {
            
            [self.delegate numbersView:self leftItemSelectedAtIndexPath:indexPath];
        }
    }
    
}
#pragma mark - UICollectionViewDelegateFlowLayout


#pragma mark - UICollectionViewDelegate


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView != self.slideScrollView) {
        [self.leftCollectionView setContentOffset:scrollView.contentOffset];
        [self.leftBackgroundCollectionView setContentOffset:scrollView.contentOffset];
        [self.slideCollectionView setContentOffset:scrollView.contentOffset];
        
//        if (scrollView.contentOffset.y > 0) {
//            [self showHorizontalDivideShadowLayer];
//        } else {
//            [self dismissHorizontalDivideShadowLayer];
//        }
        
    } else {
//        if (scrollView.contentOffset.x > 0) {
//            [self showVerticalDivideShadowLayer];
//        } else {
//            [self dismissVerticalDivideShadowLayer];
//        }
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.verticalDivideShadowLayer.transform = CATransform3DMakeTranslation(scrollView.contentOffset.x, 0, 0);
        [CATransaction commit];
        if (self.block) {
            if (scrollView.contentOffset.x ==0) {
                self.block(YES,NO);
            }else if (scrollView.contentOffset.x == scrollView.contentSize.width-scrollView.frame.size.width ){
                self.block(NO,YES);
            }else {
                self.block(NO,NO);
            }
        }
        
    }
}
-(__kindof UICollectionViewCell*) dequeueBodyColletionViewReusableCellWithReuseIdentifier:(NSString*)identifier  forIndexPath:(NSIndexPath*)indexPath list:(NSInteger)list{
    NSInteger row = (self.listCount+self.spaceCellCount)*indexPath.row+list;
   return  [self.slideCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:[NSIndexPath indexPathForRow:row inSection:indexPath.section]];
}


-(void)moveWithISLeft:(BOOL)isLeft finishedBlock:(BSNumbersViewMoveBlockFinished)block{
    if (_block!=block) {
        _block = block;
    }
    if (isLeft) {
        CGFloat x = self.slideScrollView.contentOffset.x -BSNumberCellWidth;
        if (x < 0) {
            x = 0;
        }
        [self.slideScrollView setContentOffset:CGPointMake(x, self.slideScrollView.contentOffset.y) animated:YES];
        
    }else{
        CGFloat x = self.slideScrollView.contentOffset.x +BSNumberCellWidth;
        if (x > self.slideScrollView.contentSize.width-self.slideScrollView.frame.size.width ) {
            x = self.slideScrollView.contentSize.width-self.slideScrollView.frame.size.width ;
        }
        [self.slideScrollView setContentOffset:CGPointMake(x, self.slideScrollView.contentOffset.y) animated:YES];
    }
   
}
-(void)dealloc{
     [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

@end
