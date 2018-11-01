//
//  LaunchSreenRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/21.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "LaunchSreenRequest.h"

@implementation LaunchSreenRequest
-(void)loadRequest{
    [super loadRequest];
    self.needLoadingView = NO;
    self.action = @"app/screen";
    self.withErrorAlert = NO;
}
@end
