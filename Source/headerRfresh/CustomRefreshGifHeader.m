//
//  MJRefreshGifHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "CustomRefreshGifHeader.h"

@interface CustomRefreshGifHeader()
{
    __unsafe_unretained UIImageView *_gifView;
}
/** 所有状态对应的动画图片 */
@property (strong, nonatomic) NSMutableDictionary *stateImages;

/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;
@end

@implementation CustomRefreshGifHeader
#pragma mark - 懒加载
- (UIImageView *)gifView
{
    if (!_gifView) { 
        UIImageView *gifView = [[UIImageView alloc] init]; 
        [self addSubview:_gifView = gifView]; 
    } 
    return _gifView; 
}

- (NSMutableDictionary *)stateImages 
{ 
    if (!_stateImages) { 
        self.stateImages = [NSMutableDictionary dictionary]; 
    } 
    return _stateImages; 
}

- (NSMutableDictionary *)stateDurations 
{ 
    if (!_stateDurations) { 
        self.stateDurations = [NSMutableDictionary dictionary]; 
    } 
    return _stateDurations; 
}
+(instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    CustomRefreshGifHeader*header = [[self alloc] init];
    header.refreshingBlock = refreshingBlock;
    [header setImages:[Tool imagesWithGif:@"loading@2x"] forState:MJRefreshStateRefreshing];
    
    [header setImages:[Tool imagesWithGif:@"loading@2x"] forState:MJRefreshStatePulling];
    return  header;
}
+(instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action{
    CustomRefreshGifHeader*header = [[self alloc] init];
    [header setRefreshingTarget:target refreshingAction:action];
    [header setImages:[Tool imagesWithGif:@"loading@2x"] forState:MJRefreshStateRefreshing];
    
    [header setImages:[Tool imagesWithGif:@"loading@2x"] forState:MJRefreshStatePulling];
    return  header;
}
#pragma mark - 公共方法
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state 
{ 
    if (images == nil) return; 
    
    self.stateImages[@(state)] = images; 
    self.stateDurations[@(state)] = @(duration); 
    
    /* 根据图片设置控件的高度 */ 
    UIImage *image = [images firstObject]; 
    if (image.size.height > self.mj_h) { 
        self.mj_h = image.size.height; 
    } 
}

- (void)setImages:(NSArray *)images forState:(MJRefreshState)state 
{ 
    [self setImages:images duration:images.count * 0.1 forState:state]; 
}

#pragma mark - 实现父类的方法
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    NSArray *images = self.stateImages[@(MJRefreshStateIdle)];
    if (self.state != MJRefreshStateIdle || images.count == 0) return;
    // 停止动画
    [self.gifView stopAnimating];
    // 设置当前需要显示的图片
    NSUInteger index =  images.count * pullingPercent;
    if (index >= images.count) index = images.count - 1;
    self.gifView.image = images[index];
}

- (void)placeSubviews
{
    [super placeSubviews];
    self.lastUpdatedTimeLabel.hidden = YES;
    if (self.gifView.constraints.count) return;
    [self.stateLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-5);
        make.centerX.equalTo(self);
        
    }];
    
//    self.gifView.frame = self.bounds;
//    self.gifView.center = self.center;
    [self.gifView mas_remakeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self).with.offset(5);
          make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }];
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
//        self.gifView.contentMode = UIViewContentModeRight;
//        self.gifView.mj_w = self.mj_w * 0.5 - 90;
    }
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStatePulling || state == MJRefreshStateRefreshing) {
        NSArray *images = self.stateImages[@(state)];
        if (images.count == 0) return;
        
        [self.gifView stopAnimating];
        if (images.count == 1) { // 单张图片
            self.gifView.image = [images lastObject];
        } else { // 多张图片
            self.gifView.animationImages = images;
            self.gifView.animationDuration = [self.stateDurations[@(state)] doubleValue];
            [self.gifView startAnimating];
        }
    } else if (state == MJRefreshStateIdle) {
        [self.gifView stopAnimating];
    }
    
}
///重写父类方法
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    //[super scrollViewContentOffsetDidChange:change];
    
    // 在刷新的refreshing状态，///调用父类方法
    if (self.state == MJRefreshStateRefreshing) {
         [super scrollViewContentOffsetDidChange:change];
       
        return;
    }
    
    // 跳转到下一个控制器时，contentInset可能会变
    _scrollViewOriginalInset = self.scrollView.contentInset;
    
    // 当前的contentOffset
    CGFloat offsetY = self.scrollView.mj_offsetY;
    // 头部控件刚好出现的offsetY
    CGFloat happenOffsetY = - self.scrollViewOriginalInset.top;
    
    // 如果是向上滚动到看不见头部控件，直接返回
    // >= -> >
    if (offsetY > happenOffsetY) return;
    
    // 普通 和 即将刷新 的临界点
    CGFloat normal2pullingOffsetY = happenOffsetY - self.mj_h;
    CGFloat pullingPercent = (happenOffsetY - offsetY) / self.mj_h;
    ///为了实现连带下拉刷新效果，添加了self.isDraging属性区别是否在拖拽，因为self.scrollView.isDragging是只读属性，不可修改
    if (self.scrollView.isDragging||self.isDraging) { // 如果正在拖拽
        self.pullingPercent = pullingPercent;
        if (self.state == MJRefreshStateIdle && offsetY < normal2pullingOffsetY) {
            // 转为即将刷新状态
            self.state = MJRefreshStatePulling;
        } else if (self.state == MJRefreshStatePulling && offsetY >= normal2pullingOffsetY) {
            // 转为普通状态
            self.state = MJRefreshStateIdle;
        }
    } else if (self.state == MJRefreshStatePulling) {// 即将刷新 && 手松开
        // 开始刷新
        [self beginRefreshing];
    } else if (pullingPercent < 1) {
        self.pullingPercent = pullingPercent;
    }
}

@end
