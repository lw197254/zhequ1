//
//  HaveSeeRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "HaveSeeRequest.h"

@implementation HaveSeeRequest
-(void)loadRequest{
    [super loadRequest];
    self.withErrorAlert = YES;
    self.needLoadingView = NO;
    self.action = @"comment/viewdynamic";
}
@end
