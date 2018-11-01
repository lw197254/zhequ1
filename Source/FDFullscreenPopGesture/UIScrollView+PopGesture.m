//
//  UIScrollView+PopGesture.m
//  chechengwang
//
//  Created by 刘伟 on 2017/4/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "UIScrollView+PopGesture.h"

@implementation UIScrollView (PopGesture)


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    self.directionalLockEnabled = YES;
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            ///scrollview的左滑，并且scrollview的contentOffset.x==0的情况下，将scrollview的手势关掉，使用屏幕向左划手势
            if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]&&![gestureRecognizer.view isKindOfClass:[UITableView class]]) {
             CGPoint point =   [((UIPanGestureRecognizer*)gestureRecognizer) translationInView:gestureRecognizer.view];
                if (fabs(point.x)  >fabs(point.y)&&point.x>0) {
                    gestureRecognizer.enabled = NO;
                    gestureRecognizer.enabled = YES;
                    return YES;
                }

            }
                       return NO;
        }
    }
    return NO;
}
@end
