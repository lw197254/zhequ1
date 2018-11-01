//
//  LoginRequest.m
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/23.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest
-(void)loadRequest{
    
    [super loadRequest];
     self.withErrorAlert = YES;
    self.action = @"user/login";
}
@end
