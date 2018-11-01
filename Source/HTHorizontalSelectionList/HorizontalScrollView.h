//
//  HorizontalScrollView.h
//  12123
//
//  Created by 刘伟 on 2016/9/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//
@class HorizontalScrollView;

@protocol HorizontalScrollViewDelegate<NSObject>
@required
- (nullable UICollectionViewCell
   *)HorizontalScrollView:(nullable HorizontalScrollView *)horizontalScrollView cellForItemAtIndexPath:( NSIndexPath* __nonnull )indexPath forRealIndex:(NSInteger)index;
@optional

-(void)HorizontalScrollView:(nullable HorizontalScrollView *)HorizontalScrollView didSelectItemAtIndexPath:(NSInteger )index;

@end
@protocol HorizontalScrollViewDataSource<NSObject>
@required
-(NSInteger)HorizontalScrollViewnumberOfItems:(nullable HorizontalScrollView *)horizontalScrollView ;
@optional



-(void)HorizontalScrollView:(nullable HorizontalScrollView *)horizontalScrollView didSelectItemAtIndexPath:(NSInteger )index;

@end
#import <UIKit/UIKit.h>
#import "HorizontalScrollViewCell.h"
#import "CustomPageControl.h"
@interface HorizontalScrollView : UIView
-(nullable instancetype)initWithCircleScrolled:(BOOL)isCircleScrolled showPageControl:(BOOL)isShowPageControl;
-(void)resetWithCircleScrolled:(BOOL)isCircleScrolled showPageControl:(BOOL)isShowPageControl ;

@property (nonatomic,assign)BOOL isCircleScrolled;
//另加结束
@property(nonatomic,assign)BOOL isShowPageControl;
@property(nonatomic,weak,nullable) id<HorizontalScrollViewDelegate> delegate;
@property(nonatomic,weak,nullable) id<HorizontalScrollViewDataSource> dataSource;
@property(nonatomic,assign)CGSize size;
-(void)reloadData;
- (void)registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:( NSString* __nonnull)identifier;
- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:( NSString *__nonnull)identifier;

-(nullable UICollectionViewCell*)dequeueReusableCellWithReuseIdentifier:( NSString*__nonnull)identifier forIndexPath:( NSIndexPath*__nonnull)indexPath ;
@property(nonatomic,assign)BOOL autoScroll;


@end
