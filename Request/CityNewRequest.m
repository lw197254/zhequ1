//
//  CityNewRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/5/15.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CityNewRequest.h"

@implementation CityNewRequest
-(void)loadRequest{
    [super loadRequest];
    self.needLoadingView = NO;
    self.action = @"area/getareadata";
}
@end
