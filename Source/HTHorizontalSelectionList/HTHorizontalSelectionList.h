//
//  HTHorizontalSelectionList.h
//  Hightower
//
//  Created by Erik Ackermann on 7/31/14.
//  Copyright (c) 2014 Hightower Inc. All rights reserved.
//

@import UIKit;

@protocol HTHorizontalSelectionListDataSource;
@protocol HTHorizontalSelectionListDelegate;

typedef NS_ENUM(NSInteger, HTHorizontalSelectionIndicatorStyle) {
    HTHorizontalSelectionIndicatorStyleBottomBar,           // Default
    HTHorizontalSelectionIndicatorStyleButtonBorder,
    HTHorizontalSelectionIndicatorStyleNone
};

@interface HTHorizontalSelectionList : UIView

@property (nonatomic) NSInteger selectedButtonIndex;        // returns selected button index. -1 if nothing selected
                                                            // to animate this change, use `-setSelectedButtonIndex:animated:`
                                                            // NOTE: this value will persist between calls to `-reloadData`

@property (nonatomic, weak) id<HTHorizontalSelectionListDataSource> dataSource;
@property (nonatomic, weak) id<HTHorizontalSelectionListDelegate> delegate;
///选中的底部的线
@property (nonatomic, strong) UIColor *selectionIndicatorColor;

///底部的线
@property (nonatomic, strong) UIColor *bottomTrimColor;
@property (nonatomic) BOOL showRightMaskView;
@property (nonatomic) BOOL bottomTrimHidden;                // Default is NO
///10 一般用10
@property (nonatomic) CGFloat leftSpace;
///20 一般用20
@property (nonatomic) CGFloat seperateSpace;
@property (nonatomic) CGFloat rightSpace;
@property (nonatomic) CGFloat topSpace;
@property (nonatomic) CGFloat bottomSpace;

//@property (nonatomic,assign) BOOL selectionIndicatorBarHidden;
///自定义视图是否可以响应事件，默认为NO，如果可以响应，则selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index; 不响应
@property(nonatomic,assign)BOOL contentViewUserInteractionEnabled;
@property (nonatomic) UIEdgeInsets buttonInsets;
///一屏最多显示个数,
@property(nonatomic,assign)NSInteger maxShowCount;
///default is 0,0的话会尽可能多的显示
@property(nonatomic,assign)NSInteger minShowCount;
@property(nonatomic,strong)UIFont* titleFont;
@property (nonatomic) HTHorizontalSelectionIndicatorStyle selectionIndicatorStyle;



//2017年9月18日
@property(nonatomic,strong) UIImageView *searchImageView;
@property(nonatomic,strong) UIView *searchView;


- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

- (void)reloadData;

- (void)setSelectedButtonIndex:(NSInteger)selectedButtonIndex animated:(BOOL)animated;

//设置红点标志
@property (nonatomic,assign) bool isShowColorRight;
@property (nonatomic,assign) NSInteger isShowColorRightCount;
//- (void)setNumTitleWithColor:(UIColor *)color Num:(NSInteger) count;
@property (nonatomic,strong) UIView * redUiView;
@end

@protocol HTHorizontalSelectionListDataSource <NSObject>

- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList;

@optional
- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index;
- (UIView *)selectionList:(HTHorizontalSelectionList *)selectionList viewForItemWithIndex:(NSInteger)index;

@end

@protocol HTHorizontalSelectionListDelegate <NSObject>

- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index;



@end
