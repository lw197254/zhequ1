//
//  CheckMyDynamic.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/31.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "CheckMyDynamic.h"

@implementation CheckMyDynamic

-(void)loadRequest{
    [super loadRequest];
    self.needLoadingView = NO;
    self.action = @"user/getuserloginpushdynamic";
    
}

@end
