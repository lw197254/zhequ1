//
//  UIButton+EasyExtend.h
//  leway
//
//  Created by 朱潮 on 14-6-7.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EzSystemInfo.h"
@interface UIButton (EasyExtend)
-(UIButton *)initNavigationButton:(UIImage *)image;
-(UIButton *)initNavigationButton:(UIImage *)image with:(float) with;
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color;
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color height:(float) height;
@end
