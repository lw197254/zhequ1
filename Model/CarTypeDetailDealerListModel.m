//
//  CarTypeDetailDealerListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CarTypeDetailDealerListModel.h"

@implementation CarTypeDetailDealerListModel
-(NSArray<CarTypeDetailDealerModel*>*)unixList{
    if (!_unixList) {
        NSMutableArray<CarTypeDetailDealerModel*>*array = [NSMutableArray<CarTypeDetailDealerModel*> array];
        [self.list enumerateObjectsUsingBlock:^(CarTypeDetailDealerModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.scope != CarTypeDetailDealerScope4s) {
                [array addObject:obj];
            }
        }];
//        if (array.count > 0) {
//            [array removeObjectAtIndex:0];
//        }
        _unixList = array;
    }
    return _unixList;
}
-(NSArray<CarTypeDetailDealerModel*>*)normalList{
    if (!_normalList) {
        NSMutableArray<CarTypeDetailDealerModel*>*array = [NSMutableArray<CarTypeDetailDealerModel*> array];
        [self.list enumerateObjectsUsingBlock:^(CarTypeDetailDealerModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.scope == CarTypeDetailDealerScope4s) {
                [array addObject:obj];
            }
        }];
        _normalList = array;
    }
    return _normalList;
}
-(NSArray<CarTypeDetailDealerModel*>*)normalDistanceList{
    if (!_normalDistanceList) {
        NSMutableArray<CarTypeDetailDealerModel*>*array = [NSMutableArray<CarTypeDetailDealerModel*> array];
        [self.listbydis enumerateObjectsUsingBlock:^(CarTypeDetailDealerModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.scope == CarTypeDetailDealerScope4s) {
                [array addObject:obj];
            }
        }];
        _normalDistanceList = array;
    }
    return _normalDistanceList;
}
-(NSArray<CarTypeDetailDealerModel*>*)unixDistanceList{
    if (!_unixDistanceList) {
        NSMutableArray<CarTypeDetailDealerModel*>*array = [NSMutableArray<CarTypeDetailDealerModel*> array];
        [self.listbydis enumerateObjectsUsingBlock:^(CarTypeDetailDealerModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.scope != CarTypeDetailDealerScope4s) {
                [array addObject:obj];
            }
        }];
        _unixDistanceList = array;
    }
    return _unixDistanceList;
}

@end
