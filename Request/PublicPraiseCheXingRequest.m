//
//  PublicPraiseCheXingRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/19.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PublicPraiseCheXingRequest.h"

@implementation PublicPraiseCheXingRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"koubei/chexingMore";
    self.needLoadingView = NO;
}

@end
