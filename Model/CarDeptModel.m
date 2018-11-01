//
//  CarDeptModel.m
//  chechengwang
//
//  Created by 严琪 on 17/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CarDeptModel.h"

@implementation CarDeptModel
+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"cars_onsale":@"carOnSale",
                                                      @"cars_offsale":@"carOffSale",
                                                      @"see_others":@"seeOthers"}];
}
-(NSArray<CarOnOffSale>*)carOffSale{
    if (!self.carOffSaleSorted) {
        NSArray*array =  [ _carOffSale sortedArrayUsingComparator:^NSComparisonResult(CarOnOffSale* obj1, CarOnOffSale* obj2) {
            if ([obj1.title integerValue] < [obj2.title integerValue]) {
                return NSOrderedDescending;
            }else{
                return NSOrderedAscending;
            }
        }];
        self.carOffSaleSorted = YES;
        _carOffSale = (NSArray<CarOnOffSale>*)array;
    }
 
    return _carOffSale;
}
@end
