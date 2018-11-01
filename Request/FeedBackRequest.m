//
//  FeedBackRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/2/22.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FeedBackRequest.h"

@implementation FeedBackRequest
-(void)loadRequest{
    [super loadRequest];
    self.needLoadingView = NO;
    self.action = @"feedback/addfeedback";
    self.withErrorAlert = YES;
}
@end
