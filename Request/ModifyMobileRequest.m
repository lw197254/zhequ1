//
//  ModifyMobileRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "ModifyMobileRequest.h"

@implementation ModifyMobileRequest
-(void)loadRequest{
    
    [super loadRequest];
     self.withErrorAlert = YES;
    self.uid = [UserModel shareInstance].uid;
    self.action = @"user/editmobile";
}
@end
