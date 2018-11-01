//
//  GHGuideView.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/19.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>
///隐藏block
typedef void(^DismissBlock)();
@interface GHGuideView : UIView
-(void)showWithDismissBlock:(DismissBlock)dismissBlock;
+(instancetype)shareInstance;
@end
