//
//  ReBackrRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "ReBackrRequest.h"

@implementation ReBackrRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"comment/rebackcomment";
    self.needLoadingView = NO;
}
@end
