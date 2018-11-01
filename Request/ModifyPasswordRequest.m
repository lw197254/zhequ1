//
//  ModifyPasswordRequest.m
//  TMC_lutao
//
//  Created by 刘伟 on 16/4/11.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "ModifyPasswordRequest.h"

@implementation ModifyPasswordRequest
-(void)loadRequest{
    
    [super loadRequest];
     self.withErrorAlert = YES;
    self.action = @"queryModifyPassword";
}
@end
