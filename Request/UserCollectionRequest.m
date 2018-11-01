//
//  UserCollectionRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "UserCollectionRequest.h"

@implementation UserCollectionRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"user/getcollection";
}
@end
