//
//  ProvinceListNewModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/5/15.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "ProvinceListNewModel.h"

@implementation ProvinceListNewModel

-(NSInteger)areav{
    if (_areav<1) {
        _areav=1;
    }
    return _areav;
}
-(NSArray<CityNewModel*>*)showList{
    if (!_showList.isNotEmpty) {
        NSMutableArray<CityNewModel*>*array = [NSMutableArray<CityNewModel*> array];
        
        for (NSInteger i = 'A';i <='Z' ; i++) {
            NSMutableArray<AreaNewModel*>*listArray =[NSMutableArray<AreaNewModel*> array];
            
            char cha = i;
            NSString*firstChar = [NSString stringWithFormat:@"%c", cha];
            [self.info enumerateObjectsUsingBlock:^(AreaNewModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                
                
                if ([firstChar isEqualToString:obj.firstletter]&&[obj.type isEqual: @"2"]) {
                    
                    [listArray addObject:obj];
                }
                
                
                
            }];
            if (listArray.count > 0) {
                CityNewModel*model =[[CityNewModel alloc]init];
                model.firstletter = firstChar;
                model.array = listArray;
                
                [array addObject:model];
            }
            
            
            
        }
        _showList = array;
        
    }
    
    return _showList;
}

@end
