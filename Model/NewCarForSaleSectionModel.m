//
//  NewCarForSaleSectionModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/9/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "NewCarForSaleSectionModel.h"

@implementation NewCarForSaleSectionModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"data":@"list"}];
}
@end
