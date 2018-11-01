//
//  SubscribeDetailRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/4/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "SubscribeDetailRequest.h"

@implementation SubscribeDetailRequest

-(void)loadRequest{
    [super loadRequest];
    self.action = @"wemedia/wemedialist";
    self.limit = 10;
    self.needLoadingView = NO;
    self.withErrorAlert = NO;
    
}
-(NSInteger)page{
    if (_page  < 1) {
        _page = 1;
    }
    return _page;
}
@end
