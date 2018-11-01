//
//  CheckmobileRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/5/8.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CheckMobileRequest.h"

@implementation CheckMobileRequest

-(void)loadRequest{
    
    [super loadRequest];
    self.needLoadingView = NO;
    self.withErrorAlert = YES;
    self.action = @"user/checkmobile";
}
@end
