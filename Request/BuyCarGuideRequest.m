//
//  BuyCarGuideRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "BuyCarGuideRequest.h"

@implementation BuyCarGuideRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"findSpecial/baiKe";
    self.needLoadingView = YES;
    self.withErrorAlert = YES;
}
@end
