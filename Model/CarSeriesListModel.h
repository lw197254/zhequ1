//
//  CarSeriesListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarSeriesSectionModel.h"
@interface CarSeriesListModel : FatherModel
@property(nonatomic,strong)NSArray<CarSeriesSectionModel>*data;
@end
