//
//  AskForPriceModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "DealerModel.h"
#import "CarModel.h"
@interface AskForPriceModel : FatherModel
@property(nonatomic,strong)NSArray<CarModel>*cars;
@property(nonatomic,strong)NSArray<DealerModel>*dealer_list;

@end
