//
//  ConditonSelectCarResultModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/3/1.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "ConditonSelectCarResultModel.h"

@implementation ConditonSelectCarResultModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"zhidaoPrice":@"guidePrice"}];
    
}
@end
