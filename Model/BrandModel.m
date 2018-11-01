//
//  HotBrandModel.m
//  chechengwang
//
//  Created by 刘伟 on 2016/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "BrandModel.h"

@implementation BrandModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"pic_url":@"url",@"first_num":@"firstChar"}];
}
@end
