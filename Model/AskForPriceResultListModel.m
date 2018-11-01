//
//  AskForPriceResultListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/6/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "AskForPriceResultListModel.h"

@implementation AskForPriceResultListModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"relatetypes":@"list"}];
}
@end
