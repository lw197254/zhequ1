//
//  UpdateUserInfoRequest.m
//  12123
//
//  Created by 琪琪雪雪 on 16/10/27.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "UpdateUserInfoRequest.h"

@implementation UpdateUserInfoRequest
-(void)loadRequest{
    [super loadRequest];
    self.withErrorAlert = YES;
    self.action = @"user/edituserinfo";
    self.uid = [UserModel shareInstance].uid;
}
@end
