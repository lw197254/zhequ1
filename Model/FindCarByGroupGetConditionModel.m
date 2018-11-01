//
//  FindCarByGroupGetConditionModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FindCarByGroupGetConditionModel.h"

@implementation FindCarByGroupGetConditionModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"name":@"typeName"}];
}
//-(NSString*)typeName{
//    switch (self.type) {
//        case FindCarByGroupGetConditionTypeYongGuy:
//            
//            return @"职场菜鸟";
//            break;
//        case FindCarByGroupGetConditionTypeNewMarried:
//            
//            return @"新婚燕尔";
//            break;
//        case FindCarByGroupGetConditionTypeMatherAndFather:
//            
//            return @"奶爸奶妈";
//            break;
//        case FindCarByGroupGetConditionTypeManyChildFamily:
//            
//            return @"多子女家庭";
//            break;
//        case FindCarByGroupGetConditionTypeCareerSuccess:
//            
//            return @"事业有成";
//            break;
//            
//        default:
//            return @"职场菜鸟";
//            break;
//    }
//}
@end
