//
//  HomelistMoreRequest.m
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HomelistMoreRequest.h"

@implementation HomelistMoreRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"site/newMore";
    self.needLoadingView = NO;
}
@end
