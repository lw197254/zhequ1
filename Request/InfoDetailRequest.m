//
//  InfoDetailRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "InfoDetailRequest.h"

@implementation InfoDetailRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"site/detail";
    self.needLoadingView = YES;
}@end
