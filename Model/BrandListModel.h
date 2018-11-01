//
//  BrandListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "FindCarBrandSectionListModel.h"
@interface BrandListModel : FatherModel
@property(nonatomic,strong)NSArray<BrandModel>*brandList;
@property(nonatomic,strong)NSArray<FindCarBrandSectionListModel*>*list;
@property(nonatomic,strong)NSMutableArray*sectionHeaderTitleArray;
@property(nonatomic,strong)NSMutableArray*sectionIndexTitleArray;
@end
