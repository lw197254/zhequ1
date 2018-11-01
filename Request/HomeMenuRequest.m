//
//  HomeMenuRequest.m
//  chechengwang
//
//  Created by 严琪 on 16/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HomeMenuRequest.h"

@implementation HomeMenuRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"site/menu";
    self.needLoadingView = NO;
}
@end
