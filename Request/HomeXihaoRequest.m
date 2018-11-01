//
//  HomeXihaoRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/12.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "HomeXihaoRequest.h"

@implementation HomeXihaoRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"xihao/subjects";
    self.needLoadingView = YES;
    self.withErrorAlert = YES;
}
@end
