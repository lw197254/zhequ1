//
//  SubmitSearchResultRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/4/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "SubmitSearchResultRequest.h"

@implementation SubmitSearchResultRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"search/addkeywords";
    self.needLoadingView = NO;
    self.withErrorAlert = NO;
}
@end
