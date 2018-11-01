//
//  ChangePasswordRequest.m
//  12123
//
//  Created by Mr.Yan on 16/5/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "ForgetPasswordRequest.h"

@implementation ForgetPasswordRequest
-(void)loadRequest
{
    [super loadRequest];
     self.withErrorAlert = YES;
    self.needLoadingView = YES;
    self.action = @"user/resetpwd";
}

@end
