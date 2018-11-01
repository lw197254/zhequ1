//
//  RanklistModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "RanklistModel.h"

@implementation RanklistModel

-(NSArray<RankSectionModel*>*)showList{
    if (!_showList) {
        NSMutableArray*array = [NSMutableArray array];
        __block  RankSectionModel*model;
        @weakify(self)
        [self.data enumerateObjectsUsingBlock:^(RankModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (model&&[model.firshChar isEqual:obj.structure_name]) {
                [model.data addObject:obj];
                if (idx == self_weak_.data.count - 1) {
                    [array addObject:model];
                }
            }else{
                if (model) {
                   [array addObject:model];
                }
                
                model = [[RankSectionModel alloc]init];
                model.firshChar = obj.structure_name;
                model.data  = [NSMutableArray array];
                [model.data addObject:obj];
            }
            
        }];
        _showList = array;
    }
    return _showList;
}

@end
