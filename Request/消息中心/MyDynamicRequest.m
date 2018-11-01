//
//  MyDynamicRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "MyDynamicRequest.h"

@implementation MyDynamicRequest
-(void)loadRequest{
    [super loadRequest];
    self.withErrorAlert = YES;
    self.needLoadingView = NO;
    self.action = @"comment/dynamiclist";
}
@end
