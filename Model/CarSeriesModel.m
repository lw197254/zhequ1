//
//  CarSeriesModel.m
//  chechengwang
//
//  Created by 刘伟 on 2016/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "CarSeriesModel.h"

@implementation CarSeriesModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"pic_url":@"picUrl",@"first_num":@"firstChar",@"sale_state":@"isSaleable",@"zhidaoPrice":@"guildPrice"}];

}
@end
