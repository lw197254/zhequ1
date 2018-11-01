//
//  RegionClickRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/18.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "RegionClickRequest.h"

@implementation RegionClickRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"site/regionClick";
    self.needLoadingView = NO;
}
@end
