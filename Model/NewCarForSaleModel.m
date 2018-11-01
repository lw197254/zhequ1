//
//  NewCarForSaleModel.m
//  chechengwang
//
//  Created by 刘伟 on 2016/12/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "NewCarForSaleModel.h"

@implementation NewCarForSaleModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"title":@"name",@"zhidaoprice":@"price",@"pic":@"picUrl"}];
}

@end
