//
//  ShadowFastLoginRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/2.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "ShadowFastLoginRequest.h"

@implementation ShadowFastLoginRequest

-(void)loadRequest{
    [super loadRequest];
    self.action = @"user/fastlogincheckcode";
    
    self.withErrorAlert = YES;
}
@end
