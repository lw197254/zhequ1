//
//  HLDoubleSlideView.h
//  DriveUserProject
//
//  Created by sd on 16/3/16.
//  Copyright © 2016年 CJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HLDoubleSlideViewSwitchStrBlock)(NSInteger leftCountValue,NSInteger rightCountValue);
typedef void (^HLDoubleSlideViewTouchEndBlock)(void);
@interface HLDoubleSlideView : UIView

@property(nonatomic,assign)NSInteger maxValue;
@property(nonatomic,assign)NSInteger minValue;
@property(nonatomic,assign)NSInteger currentLeftValue;
@property(nonatomic,assign)NSInteger currentRightValue;

//格式化显示文本
@property(nonatomic,copy)HLDoubleSlideViewSwitchStrBlock block;
@property(nonatomic,copy)HLDoubleSlideViewTouchEndBlock endBlock;
-(void)sliderChange:(HLDoubleSlideViewSwitchStrBlock)block;
-(void)sliderChange:(HLDoubleSlideViewSwitchStrBlock)block endBlock:(HLDoubleSlideViewTouchEndBlock)endBlock;
@end
