//
//  FindCarModel.m
//  chechengwang
//
//  Created by 刘伟 on 2016/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FindCarBrandListModel.h"

@implementation FindCarBrandListModel
+(JSONKeyMapper*)keyMapper{
     return [[JSONKeyMapper alloc]initWithDictionary:@{@"pinpaiList":@"brandList",@"hotPinpai":@"hotBrandList",@"chexingNum":@"carSeriesNumber",@"findLevels":@"condtionList"}];
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
//    NSString*hotFirstChar =@"热门品牌";
//    if (!_sectionHeaderTitleArray) {
//        _sectionHeaderTitleArray = [NSMutableArray arrayWithObjects:hotFirstChar, nil];
//        _sectionIndexTitleArray = [NSMutableArray arrayWithObjects:@"#", nil];
//        FindCarBrandSectionListModel*sectionModel = [[FindCarBrandSectionListModel alloc]init];
//        sectionModel.firstChar = hotFirstChar;
//        sectionModel.array = self.hotBrandList;
//        
//        
//        [array addObject:sectionModel];
//    }
    _sectionHeaderTitleArray = [NSMutableArray arrayWithObjects:@"A", nil];
    _sectionIndexTitleArray = [NSMutableArray arrayWithObjects:@"#",@"A", nil];
    __block  NSMutableArray*listArray = [NSMutableArray array];
    
    [self.brandList enumerateObjectsUsingBlock:^(BrandModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString*firstChar= [_sectionHeaderTitleArray lastObject];
        if ([firstChar isEqualToString:obj.firstChar]) {
            [listArray addObject:obj];
        }else{
//            NSDictionary*dict = [NSDictionary dictionaryWithObjectsAndKeys:firstChar,@"firstChar",listArray,@"array", nil];
//            [array addObject:dict];
//            if (![firstChar isEqual:hotFirstChar]) {
                FindCarBrandSectionListModel*sectionModel = [[FindCarBrandSectionListModel alloc]init];
                sectionModel.firstChar = firstChar;
                sectionModel.array = listArray;
                [array addObject:sectionModel];
                
//            }
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

-(void)reChangeLevel{
    [self.condtionList enumerateObjectsUsingBlock:^(FindCarCondtionModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.parentLevel;
    }];
}

@end
