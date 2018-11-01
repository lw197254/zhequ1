//
//  UserPushCountRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/10/27.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "UserPushCountRequest.h"

@implementation UserPushCountRequest

-(void)loadRequest{
    [super loadRequest];
    self.needLoadingView = NO;
    self.action = @"user/getuserloginpushdynamic";
}

@end
