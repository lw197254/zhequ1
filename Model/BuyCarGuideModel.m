//
//  BuyCarGuideModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "BuyCarGuideModel.h"

@implementation BuyCarGuideModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"typename": @"typeName",
                                                        @"id": @"artid"
                                                       }];
}

@end
