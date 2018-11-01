//
//  ProvinceListNewModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/5/15.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "ProvinceNewModel.h"
@interface ProvinceListNewModel : FatherModel
///新数据
@property(nonatomic,strong)NSArray<CityNewModel*> *showList;
///info	array	原数据数据，具体结构见json
@property(nonatomic,strong)NSArray<AreaNewModel> *info;
////areav	string	当前版本号 默认从1开始
@property(nonatomic,assign)NSInteger areav;
@end
