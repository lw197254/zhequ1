//
//  CheckcodeRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/5/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CheckcodeRequest.h"

@implementation CheckcodeRequest

-(void)loadRequest{
    
    [super loadRequest];
    self.needLoadingView = YES;
    self.withErrorAlert = YES;
    self.action = @"user/checkcode";
}
@end
