//
//  BuyCarListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "BuyCarCalculatorSectionModel.h"
@interface BuyCarCalculatorListModel : FatherModel
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*subTitle;
@property(nonatomic,copy)NSString*price;
@property(nonatomic,strong)NSArray<BuyCarCalculatorSectionModel>*list;

@end
