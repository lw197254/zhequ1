//
//  UserSubjectAddRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "UserSubjectAddRequest.h"

@implementation UserSubjectAddRequest

-(void)loadRequest{
    [super loadRequest];
    self.action = @"user/subscribe";
    self.needLoadingView = NO;
}

@end
