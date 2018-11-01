//
//  BrandListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "BrandListModel.h"

@implementation BrandListModel

+(JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"data":@"brandList"}];
}
-(NSArray<FindCarBrandSectionListModel*>*)list{
    if (!_list) {
        [self configList];
    }
    return _list;
}
-(NSMutableArray*)sectionHeaderTitleArray{
    if (!_sectionHeaderTitleArray) {
        [self configList];
    }
    return _sectionHeaderTitleArray;
}
-(NSMutableArray*)sectionIndexTitleArray{
    if (!_sectionIndexTitleArray) {
        [self configList];
    }
    return _sectionIndexTitleArray;
}
-(void)configList{
    NSMutableArray<FindCarBrandSectionListModel*>*array = [NSMutableArray<FindCarBrandSectionListModel*> array];
    
    __block  NSMutableArray*listArray;
    
    if (!_sectionIndexTitleArray) {
        _sectionIndexTitleArray = [NSMutableArray array];
    }else{
        [_sectionIndexTitleArray removeAllObjects];
    }
    if (!_sectionHeaderTitleArray) {
        _sectionHeaderTitleArray = [NSMutableArray array];
    }else{
        [_sectionHeaderTitleArray removeAllObjects];
    }
    
    [self.brandList enumerateObjectsUsingBlock:^(BrandModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString*firstChar;
        if (_sectionHeaderTitleArray.count == 0) {
            firstChar = obj.firstChar;
             listArray = [NSMutableArray array];
            [_sectionHeaderTitleArray addObject:obj.firstChar];
            [_sectionIndexTitleArray addObject:obj.firstChar];
        }else{
            firstChar= [_sectionHeaderTitleArray lastObject];
        }
        
        
       
        if ([firstChar isEqualToString:obj.firstChar]) {
            [listArray addObject:obj];
        }else{
            //            NSDictionary*dict = [NSDictionary dictionaryWithObjectsAndKeys:firstChar,@"firstChar",listArray,@"array", nil];
            //            [array addObject:dict];
            
                FindCarBrandSectionListModel*sectionModel = [[FindCarBrandSectionListModel alloc]init];
                sectionModel.firstChar = firstChar;
                sectionModel.array = listArray;
                [array addObject:sectionModel];
            
            
            [_sectionHeaderTitleArray addObject:obj.firstChar];
            [_sectionIndexTitleArray addObject:obj.firstChar];
            listArray = [NSMutableArray array];
            [listArray addObject:obj];
        }
        
        
        
    }];
    NSString*firstChar= [_sectionHeaderTitleArray lastObject];
    FindCarBrandSectionListModel*sectionModel = [[FindCarBrandSectionListModel alloc]init];
    sectionModel.firstChar = firstChar;
    sectionModel.array = listArray;
    [array addObject:sectionModel];
    _list =array;
    
}
@end


