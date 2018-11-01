//
//  VideoListRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "VideoListRequest.h"

@implementation VideoListRequest

-(void)loadRequest{
    [super loadRequest];
    self.action =@"video/list";
    self.needLoadingView = NO;
}

@end
