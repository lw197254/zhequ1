//
//  BuyCarSectionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "BuyCarCalculatorModel.h"
@protocol BuyCarCalculatorSectionModel
@end
@interface BuyCarCalculatorSectionModel : FatherModel
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*subTitle;
@property(nonatomic,copy)NSString*id;
@property(nonatomic,strong)NSArray<BuyCarCalculatorModel>*list;

@end
