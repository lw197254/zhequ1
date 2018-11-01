//
//  SubscribeDetailModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/4/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "SubscribeDetailModel.h"

@implementation SubscribeDetailModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"count": @"page_count"
                                                       }];
}


@end
