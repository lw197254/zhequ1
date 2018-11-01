//
//  CommiteListRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/18.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "CommiteListRequest.h"

@implementation CommiteListRequest

-(void)loadRequest{
    [super loadRequest];
    self.action = @"comment/index";
    self.needLoadingView = NO;
   
    
}

@end
