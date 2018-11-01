//
//  VideoDetailRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/4.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "VideoDetailRequest.h"

@implementation VideoDetailRequest

-(void)loadRequest{
    [super loadRequest];
    self.action =@"video/detailinfo";
    self.needLoadingView = YES;
}

@end
