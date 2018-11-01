//
//  CarSeriesFactoryListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/28.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarSeriesFactoryModel.h"
#import "CarSeriesFactoryBrandModel.h"
@interface CarSeriesFactoryListModel : FatherModel
@property(nonatomic,strong)CarSeriesFactoryBrandModel*brand;
@property(nonatomic,strong)NSArray<CarSeriesFactoryModel>*list;
@end
