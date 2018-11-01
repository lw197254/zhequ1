//
//  UpDateRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/5/15.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "UpDateRequest.h"

@implementation UpDateRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"app/appUpdate";
    self.needLoadingView = NO;
    
}
@end
