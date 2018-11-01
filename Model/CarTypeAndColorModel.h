//
//  CarTypeAndColorModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarTypeSectionModel.h"
#import "CarColorTypeModel.h"
@interface CarTypeAndColorModel : FatherModel
@property(nonatomic,strong)NSArray<CarTypeSectionModel>*cars;

@property(nonatomic,strong)NSArray<CarColorTypeModel>*out_colors;
@property(nonatomic,strong)NSArray<CarColorTypeModel>*in_colors;
@end
