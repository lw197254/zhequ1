//
//  RegistRequest.m
//  12123
//
//  Created by 刘伟 on 2016/9/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "RegistRequest.h"

@implementation RegistRequest
-(void)loadRequest{
    [super loadRequest];
    self.withErrorAlert = YES;
    self.action =  @"user/register";
    
    
}
@end
