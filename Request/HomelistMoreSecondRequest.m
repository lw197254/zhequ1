//
//  HomelistMoreSecondRequest.m
//  chechengwang
//
//  Created by 严琪 on 16/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HomelistMoreSecondRequest.h"

@implementation HomelistMoreSecondRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"site/listMore";
    self.needLoadingView = NO;
}
@end
