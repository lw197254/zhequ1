//
//  PublicPraiseCarsRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PublicPraiseCarsRequest.h"

@implementation PublicPraiseCarsRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"koubei/cars";
    self.needLoadingView = YES;
}

@end
