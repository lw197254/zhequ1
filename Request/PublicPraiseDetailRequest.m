//
//  PublicPraiseDetailRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PublicPraiseDetailRequest.h"

@implementation PublicPraiseDetailRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"koubei/detail";
    self.needLoadingView = YES;
}


@end
