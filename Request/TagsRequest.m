//
//  TagsRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/11.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "TagsRequest.h"

@implementation TagsRequest

-(void)loadRequest{
    [super loadRequest];
    self.action = @"xihao/list";
    self.needLoadingView = NO;
    self.withErrorAlert = NO;
}

@end
