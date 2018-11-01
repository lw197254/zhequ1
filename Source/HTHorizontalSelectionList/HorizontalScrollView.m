//
//  HorizontalScrollView.m
//  12123
//
//  Created by 刘伟 on 2016/9/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HorizontalScrollView.h"
#import "HorizontalScrollViewCell.h"

#import "Timer.h"
#import "UIView+UIScreenDisplaying.h"
@interface HorizontalScrollView()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign)NSInteger numberOfItem;
@property(nonatomic,assign)NSInteger realNumberOfItem;
@property(nonatomic,strong)UICollectionView*collectionView;
@property(nonatomic,assign)BOOL needResetCircleScrollOff;
@property(nonatomic,strong)NSTimer*timer;
@property(nonatomic,assign)CGRect lastRect;


//控制小屏幕下的文字展示
@property(nonatomic,strong)CustomPageControl *pageControl;

@end
@implementation HorizontalScrollView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self config];
    // Initialization code
}
-(void)config{
    @weakify(self);
    [[RACSignal combineLatest:@[RACObserve(self, autoScroll),RACObserve(self, realNumberOfItem)] reduce:^(NSNumber*autoScroll,NSNumber*realCount){
        return @([autoScroll boolValue]&&[realCount integerValue]> 0);
        
    }]subscribeNext:^(NSNumber *x) {
        @strongify(self);
        if ([x boolValue]) {
            if (!self.timer) {
                 self.timer  = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scroll) userInfo:nil repeats:YES];
                          
            }
            
        }else{
            [self.timer invalidate];
            self.timer = nil;
        }
    }];
    UICollectionViewFlowLayout*layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.size.width, 200) collectionViewLayout:layout];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    layout.minimumInteritemSpacing = 0;
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        
    }];
    self.collectionView.delegate = self;
    self.collectionView.dataSource  = self;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    
    self.lastRect = CGRectMake(self.size.width*(self.numberOfItem-1), 0, 0, 0);


}
-(instancetype)initWithCircleScrolled:(BOOL)isCircleScrolled showPageControl:(BOOL)isShowPageControl {
    if (self = [[self class]init]) {
        
        self.isCircleScrolled = isCircleScrolled;
        self.isShowPageControl = isShowPageControl;
       [self config];
    }
    
    return self;
    
}

-(void)scroll{
    if(![self isDisplayedInScreen]){
        
        return;
    }
    
 
    if (self.numberOfItem >=2) {
         [self.collectionView setContentOffset:CGPointMake((self.collectionView.contentOffset.x+self.size.width), self.collectionView.contentOffset.y) animated:YES];
    }
   
}

-(void)resetWithCircleScrolled:(BOOL)isCircleScrolled showPageControl:(BOOL)isShowPageControl {
    
    self.isCircleScrolled = isCircleScrolled;
    
    self.isShowPageControl = isShowPageControl;
    [self reloadData];
    
//    if (self.needResetCircleScrollOff&&self.realNumberOfItem >1) {
//        [self.collectionView setContentOffset:CGPointMake(self.size.width, self.size.height)];
//    }
}
-(instancetype)init{
    if ( self = [super init]) {
        UICollectionViewFlowLayout*layout = [[UICollectionViewFlowLayout alloc]init];
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.size.width, 200) collectionViewLayout:layout];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.edges.equalTo(self);
            
        }];
        self.collectionView.delegate = self;
        self.collectionView.dataSource  = self;
        self.collectionView.pagingEnabled = YES;
        [self.collectionView registerNib:[UINib nibWithNibName:@"HorizontalScrollViewCell" bundle:nil] forCellWithReuseIdentifier:@"HorizontalScrollViewCell"];
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.showsHorizontalScrollIndicator = NO;
        
        
        self.lastRect = CGRectMake(self.size.width*(self.numberOfItem-1), 0, 0, 0);
        
//        [[RACSignal combineLatest:@[RACObserve(self, isCircleScrolled),RACObserve(self, originalDataArray)]reduce:^id{
//            return @(YES);
//        }] subscribeNext:^(id x) {
//            [self refreshDataArray];
//        
//         }];
//         self.originalDataArray = @[@"新增车辆",@"第三辆车",@"第二辆车",@"第一辆车",@"新增车辆",@"第三辆车"];
    }
    return self;
}
-(void)setIsShowPageControl:(BOOL)isShowPageControl{
    if (_isShowPageControl != isShowPageControl) {
        _isShowPageControl = isShowPageControl;
        if (_isShowPageControl) {
            if (!self.pageControl) {
                self.pageControl = [[CustomPageControl alloc]initWithFrame:CGRectZero pageStyle:CustomPageControlStyleSquare withImageArray:nil];
                
                [self.pageControl.layer setCornerRadius:0];
              
            }
            [self addSubview:self.pageControl];
            [self bringSubviewToFront:self.pageControl];
            [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self).with.offset(-11);
//                make.size.mas_equalTo(CGSizeMake(100, 100));
                make.right.equalTo(self).offset(-15);
                        }];
        }else{
            if (self.pageControl) {
                [self.pageControl removeFromSuperview];
                self.pageControl=nil;
            }
            
        }
        
    }
}


-(void)reloadData{
//    [self layoutIfNeeded];
//    if (self.realNumberOfItem >1&&self.isCircleScrolled&&self.collectionView.contentOffset.x==0) {
//        [self.collectionView setContentOffset:CGPointMake(self.size.width, self.collectionView.contentOffset.y)];
//    }
    ///激活一下键值监听
    [self resetNumberOfItem];
    self.realNumberOfItem = 0;
    if (self.realNumberOfItem >1&&self.isCircleScrolled) {
        if(self.collectionView.contentOffset.x==0){
            NSLog(@"kuan%f",self.size.width);
            [self.collectionView setContentOffset:CGPointMake(self.size.width, self.collectionView.contentOffset.y)];
        }else{
//             [self.collectionView setContentOffset:CGPointMake(0, self.collectionView.contentOffset.y)];
        }
        
    }
    self.pageControl.pageNumber = self.realNumberOfItem;
    
   [self.collectionView reloadData];
}
//-(void)layoutSubviews{
//    [super layoutSubviews];
//    if (self.realNumberOfItem >1&&self.isCircleScrolled&&self.collectionView.contentOffset.x==0) {
//        [self.collectionView setContentOffset:CGPointMake(self.size.width, self.collectionView.contentOffset.y)];
//    }
//
//}
-(CGSize)size{
    if (_size.height==0&&_size.width==0) {
        [self layoutIfNeeded];
        CGSize size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        if (size.height==0&&size.width==0) {
            _size = CGSizeMake(kwidth, self.bounds.size.height);
        }else{
            _size = size;
        }

    }
    
    
    return _size;

}
-(NSInteger)realNumberOfItem{
    if (self.isCircleScrolled&&self.numberOfItem >= 2) {
        _realNumberOfItem = self.numberOfItem -2;
    }else{
        _realNumberOfItem = self.numberOfItem;
    }
    return _realNumberOfItem;

}
-(CGRect)lastRect{
    return CGRectMake(self.size.width*(self.numberOfItem-1), 0, 0, 0);
}
-(NSInteger)resetNumberOfItem{
    if ([self.dataSource respondsToSelector:@selector(HorizontalScrollViewnumberOfItems:)]) {
        _numberOfItem = [self.dataSource HorizontalScrollViewnumberOfItems:self];
        if (self.isCircleScrolled&&_numberOfItem >= 2) {
            _numberOfItem += 2;
        }
        
        
        
        return _numberOfItem;
    }else{
        return 0;
    }

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.pageControl) {
       
        self.pageControl.pageNumber = self.realNumberOfItem;
    }
    return  self.numberOfItem;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (self.isCircleScrolled&&self.numberOfItem >=2) {
        if (scrollView.contentOffset.x < 0&&self.collectionView == scrollView) {
            [self.collectionView setContentOffset:CGPointMake(self.lastRect.origin.x - self.size.width, 0)];
        }else if (self.collectionView.contentOffset.x >= self.lastRect.origin.x&&self.collectionView == scrollView)
        {
            self.collectionView.contentOffset = CGPointMake(self.size.width, 0);
        }
    }
    NSInteger current= ((NSInteger) self.collectionView.contentOffset.x)/((NSInteger)self.size.width);
    
    
    if (self.pageControl && self.timer) {
        self.pageControl.currentPageNumber = (current-1+self.pageControl.pageNumber)%self.realNumberOfItem;
    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    if (self.isCircleScrolled&&self.numberOfItem >= 2) {
        if (index==0) {
            index = self.numberOfItem - 2-1;
        }else if (index== self.numberOfItem-1){
            index = 0;
        }else if(index > self.numberOfItem){
            index = index%self.numberOfItem;
        }else{
            index -= 1;
        }
    }
   
    if ([self.delegate respondsToSelector:@selector(HorizontalScrollView:cellForItemAtIndexPath:forRealIndex:)]) {
        UICollectionViewCell* cell = [self.delegate HorizontalScrollView:self cellForItemAtIndexPath:indexPath forRealIndex:index];
        
        return cell;
    }else{
        return nil;
    }

    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    if (self.isCircleScrolled&&self.numberOfItem >= 2) {
        if (index==0) {
            index = self.numberOfItem - 2-1;
        }else if (index== self.numberOfItem-1){
            index = 0;
        }else{
            index -= 1;
        }
    }
    
//    if ([self.delegate respondsToSelector:@selector(HorizontalScrollView:cellForItemAtIndexPath:forRealIndex:)]) {
//        UICollectionViewCell* cell = [self.delegate HorizontalScrollView:self cellForItemAtIndexPath:indexPath forRealIndex:index];
//        
//        return cell;
//    }else{
//        return nil;
//    }

    if ([self.delegate respondsToSelector:@selector(HorizontalScrollView:didSelectItemAtIndexPath:)]) {
        [self.delegate HorizontalScrollView:self didSelectItemAtIndexPath:index];
    }
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(self.size.width, self.size.height);
}

- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier{
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}
- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier{
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
}
-(UICollectionViewCell*)dequeueReusableCellWithReuseIdentifier:(NSString*)identifier forIndexPath:(NSIndexPath*)indexPath{
   
   return  [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}
-(void)pageControlValueChange:(UIPageControl*)pageControl{
    [self.collectionView setContentOffset:CGPointMake(self.size.width*(pageControl.currentPage+1), self.collectionView.contentOffset.y) animated:YES];
}




-(void)dealloc{
     [self.timer invalidate];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

