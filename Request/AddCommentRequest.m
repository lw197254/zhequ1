//
//  AddCommentRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/21.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "AddCommentRequest.h"

@implementation AddCommentRequest

-(void)loadRequest{
    [super loadRequest];
    self.action = @"comment/add";
    self.needLoadingView = YES;
    self.withErrorAlert = YES;
}

@end
