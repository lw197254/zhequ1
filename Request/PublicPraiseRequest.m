//
//  PublicPraiseRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PublicPraiseRequest.h"

@implementation PublicPraiseRequest

-(void)loadRequest{
    [super loadRequest];
    self.action =@"koubei/chexiMore";
    self.needLoadingView = NO;
}

@end
