//
//  FindCarByGroupGetCarModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FindCarByGroupGetCarModel.h"

@implementation FindCarByGroupGetCarModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"PIC_URL":@"picUrl",@"CAR_BRAND_TYPE_NAME":@"name",@"CAR_BRAND_TYPE_ID":@"carSeriesId",@"zhidaoPrice":@"guidePrice"}];
    
}
@end
