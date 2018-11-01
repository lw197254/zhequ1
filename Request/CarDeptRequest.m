//
//  CarDeptRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CarDeptRequest.h"

@implementation CarDeptRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"chexi/index";
    self.needLoadingView = YES;
}

@end
