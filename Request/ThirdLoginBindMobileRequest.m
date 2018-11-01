//
//  ThirdLoginBindMobileRequest.m
//  12123
//
//  Created by 刘伟 on 2016/11/7.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "ThirdLoginBindMobileRequest.h"

@implementation ThirdLoginBindMobileRequest
-(void)loadRequest{
    [super loadRequest];
     self.withErrorAlert = YES;
    self.action = @"queryThirdBindMobile";
}
@end
