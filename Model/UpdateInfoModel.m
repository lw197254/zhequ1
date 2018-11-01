//
//  UpdateInfoModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/5/15.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "UpdateInfoModel.h"

@implementation UpdateInfoModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"data.iosdescription": @"des"
                                                       }];
}
@end
