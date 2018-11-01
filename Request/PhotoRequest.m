//
//  PhotoRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PhotoRequest.h"

@implementation PhotoRequest
-(void)loadRequest{
    [super loadRequest];
//    self.SCHEME = @"http";
//    self.HOST = @"www.car.com/qiche/api";
    self.action = @"picture/getImgList";
    self.needLoadingView = NO;
    
}

@end
