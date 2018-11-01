//
//  CommiteListModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/8/18.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "CommiteListModel.h"

@implementation CommiteListModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"count": @"page_count"
                                                       }];
}

@end
