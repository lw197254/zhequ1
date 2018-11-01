//
//  GetVerificationCodeRequest.m
//  TMC_convenientTravel
//
//  Created by Mr.Yan on 16/5/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "GetVerificationCodeRequest.h"

@implementation GetVerificationCodeRequest
-(void)loadRequest
{
    [super loadRequest];
    self.withErrorAlert = YES;
    self.needLoadingView = NO;
    self.action = @"user/sendcode";
}


@end
