//
//  BSNumbersView.h
//  BSNumbersSample
//
//  Created by 张亚东 on 16/4/6.
//  Copyright © 2016年 blurryssky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BSNumbersView;

NS_ASSUME_NONNULL_BEGIN
typedef void(^BSNumbersViewMoveBlockFinished)(BOOL isLeftZero,BOOL isRightZero);
@protocol BSNumbersViewDelegate <NSObject>

@optional

//- (nullable NSAttributedString *)numbersView:(BSNumbersView *)numbersView
//     attributedStringForHeaderFreezeAtColumn:(NSInteger)column;
//
//- (nullable NSAttributedString *)numbersView:(BSNumbersView *)numbersView
//      attributedStringForHeaderSlideAtColumn:(NSInteger)column;
//
//- (nullable NSAttributedString *)numbersView:(BSNumbersView *)numbersView attributedStringForBodyFreezeAtIndexPath:(NSIndexPath *)indexPath;
//
//- (nullable NSAttributedString *)numbersView:(BSNumbersView *)numbersView attributedStringForBodySlideAtIndexPath:(NSIndexPath *)indexPath;

- (nullable UICollectionViewCell *)numbersView:(BSNumbersView *)numbersView viewForHeaderFreezeAtList:(NSInteger)list;
//- (nullable UICollectionViewCell *)numbersView:(BSNumbersView *)numbersView viewForHeaderSlideAtColumn:(NSInteger)column;

- (nullable UICollectionViewCell *)numbersView:(BSNumbersView *)numbersView viewForLeftFreezeAtIndexPath:(NSIndexPath *)indexPath;
- (nullable UICollectionViewCell *)numbersView:(BSNumbersView *)numbersView viewForLeftFreezeBackgroundAtIndexPath:(NSIndexPath *)indexPath;

- (nullable UICollectionViewCell *)numbersView:(BSNumbersView *)numbersView viewForBodySlideAtIndexPath:(NSIndexPath *)indexPath list:(NSInteger)list;

//- (nullable UICollectionReusableView *)numbersView:(BSNumbersView *)numbersView viewForBodyHeaderInSection:(NSInteger)section;
- (nullable NSString *)numbersView:(BSNumbersView *)numbersView titleForBodyHeaderInSection:(NSInteger)section;
-(NSInteger)numberOfSectionInNumbersView:(BSNumbersView *)numbersView;
-(NSInteger)numbersView:(BSNumbersView *)numbersView numberOfRowInSection:(NSInteger)section;
-(NSInteger)listCountOfNumbersView:(BSNumbersView *)numbersView;

- (CGSize )numbersView:(BSNumbersView *)numbersView sizeAtIndexPath:(NSIndexPath *)indexPath list:(NSInteger)list;
-(void)numbersView:(BSNumbersView*)numbersView leftItemSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BSNumbersView : UIView
///顶部的行
@property (strong, nonatomic) UICollectionView *headerSlideCollectionView;
//左侧的列
@property (strong, nonatomic) UICollectionView *leftCollectionView;
@property (strong, nonatomic) UICollectionView *leftBackgroundCollectionView;
//可以滚动的CollectionView，里面真正的内容
@property (strong, nonatomic) UICollectionView *slideCollectionView;
@property (assign, nonatomic) id<BSNumbersViewDelegate> delegate;

///min width for each square
@property (assign, nonatomic) CGFloat minItemWidth;

///max width for each square
@property (assign, nonatomic) CGFloat maxItemWidth;

///height for each square
@property (assign, nonatomic) CGFloat itemHeight;

///text horizontal margin for each item, default is 10.0
@property (assign, nonatomic) CGFloat itemTextHorizontalMargin;

///the column need to freeze
@property (assign, nonatomic) NSInteger freezeColumn;

///header font
@property (strong, nonatomic) UIFont *headerFont;

///header text color
@property (strong, nonatomic) UIColor *headerTextColor;

///header background color
@property (strong, nonatomic) UIColor *headerBackgroundColor;

///body font
@property (strong, nonatomic) UIFont *slideBodyFont;

///body text color
@property (strong, nonatomic) UIColor *slideBodyTextColor;

///body background color
@property (strong, nonatomic) UIColor *slideBodyBackgroundColor;

///body font
@property (strong, nonatomic) UIFont *freezeBodyFont;

///body text color
@property (strong, nonatomic) UIColor *freezeBodyTextColor;

///body background color
@property (strong, nonatomic) UIColor *freezeBodyBackgroundColor;

///data
//@property (strong, nonatomic) NSArray<NSString *> *headerData;
//@property (strong, nonatomic) NSArray<NSObject *> *bodyData;
-(__kindof UICollectionViewCell*) dequeueBodyColletionViewReusableCellWithReuseIdentifier:(NSString*)identifier  forIndexPath:(NSIndexPath*)indexPath list:(NSInteger)list;

- (NSString *)textForHeaderFreezeAtColumn:(NSInteger )column;
- (NSString *)textForHeaderSlideAtColumn:(NSInteger )column;

- (NSString *)textForBodyFreezeAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)textForBodySlideAtIndexPath:(NSIndexPath *)indexPath;

- (CGSize)sizeForFreezeAtColumn:(NSInteger )column;
- (CGSize)sizeForSlideAtColumn:(NSInteger )column;
-(void)scrollToSection:(NSInteger)section animated:(BOOL)animated;
- (void)reloadData;
-(void)moveWithISLeft:(BOOL)isLeft finishedBlock:(BSNumbersViewMoveBlockFinished)block;
NS_ASSUME_NONNULL_END

@end
