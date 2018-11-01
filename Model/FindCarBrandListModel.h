//
//  FindCarModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "FindCarBrandSectionListModel.h"
#import "FindCarCondtionModel.h"
@interface FindCarBrandListModel : FatherModel
@property(nonatomic,strong)NSArray<BrandModel>*hotBrandList;
@property(nonatomic,strong)NSArray<BrandModel>*brandList;
@property(nonatomic,strong)NSArray<FindCarCondtionModel>*condtionList;
@property(nonatomic,strong)NSArray<FindCarBrandSectionListModel*>*list;
@property(nonatomic,assign)NSInteger carSeriesNumber;
@property(nonatomic,strong)NSMutableArray*sectionHeaderTitleArray;
@property(nonatomic,strong)NSMutableArray*sectionIndexTitleArray;

-(void)reChangeLevel;
@end
