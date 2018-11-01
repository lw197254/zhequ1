//
//  UserSubjectDeleteRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "UserSubjectDeleteRequest.h"

@implementation UserSubjectDeleteRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"user/delsubscribe";
    self.needLoadingView = NO;
}
@end
