//
//  MediaDetailRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/4/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "MediaDetailRequest.h"

@implementation MediaDetailRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"wemedia/wemediadetail";
    self.needLoadingView = YES;
  
}
@end
