//
//  FindCarByGroupByCarTypeGetCarListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FindCarByGroupByCarTypeGetCarListModel.h"

@implementation FindCarByGroupByCarTypeGetCarListModel
//+(JSONKeyMapper*)keyMapper{
//    return [[JSONKeyMapper alloc]initWithDictionary:@{@"data":@"list"}];
//}
-(NSArray<FindCarByGroupByCarTypeYearModel*>*)list{
    if (!_list.isNotEmpty&&self.data.isNotEmpty) {
        _list = [self.data sortedArrayUsingComparator:^NSComparisonResult(FindCarByGroupByCarTypeYearModel* obj1, FindCarByGroupByCarTypeYearModel* obj2) {
            if (obj1.title.integerValue == 0) {
                return NSOrderedDescending;
            }
            if (obj2.title.integerValue == 0) {
                return NSOrderedAscending;
            }
            if (obj1.title.integerValue > obj2.title.integerValue) {
               
                 return NSOrderedAscending;
            }else{
                 return NSOrderedDescending;
            }
            
        }];
       
    }
    return _list;
}

//        NSMutableArray<FindCarByGroupByCarTypeSectionModel*>*array = [NSMutableArray<FindCarByGroupByCarTypeSectionModel*> array];
//        __block  NSMutableArray<FindCarByGroupByCarTypeGetCarModel*>*listArray;
//        __block NSString*firstChar;
//        [self.data enumerateObjectsUsingBlock:^(FindCarByGroupByCarTypeGetCarModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            
//            if (!firstChar.isNotEmpty) {
//                firstChar = obj.desc;
//            }
//            
//            
//            if ([firstChar isEqualToString:obj.desc]) {
//                if (!listArray) {
//                    listArray = [NSMutableArray<FindCarByGroupByCarTypeGetCarModel*> array];
//                }
//                [listArray addObject:obj];
//            }else{
//               
//                FindCarByGroupByCarTypeSectionModel*model =[[FindCarByGroupByCarTypeSectionModel alloc]init];
//                model.firstChar = firstChar;
//                model.array = listArray;
//                
//                [array addObject:model];
//                listArray = [NSMutableArray<FindCarByGroupByCarTypeGetCarModel*> array];
//                [listArray addObject:obj];
//                firstChar = obj.desc;
//            }
//            
//            
//            
//        }];
//       
//        FindCarByGroupByCarTypeSectionModel*model =[[FindCarByGroupByCarTypeSectionModel alloc]init];
//        model.firstChar = firstChar;
//        model.array = listArray;
//        
//        [array addObject:model];
//        
//        _list = array;
//    }
//    
//    return _list;
//}
@end
