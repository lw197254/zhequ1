//
//  UserCollectionDeleteViewModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "UserCollectionDeleteRequest.h"

@implementation UserCollectionDeleteRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"user/delcollection";
    self.needLoadingView = NO;
}
@end
