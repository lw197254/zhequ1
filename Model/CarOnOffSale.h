//
//  CarOnSale.h
//  chechengwang
//
//  Created by 严琪 on 17/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarOnOffTypeModel.h"
@protocol CarOnOffSale
@end

@interface CarOnOffSale : FatherModel
///":"3.0T 333马力 V6",
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray<CarOnOffTypeModel> *carlist;


//"carlist":[
//           {
//               "id":"27961",
//               "name":"2017款 50 TFSI quattro 尊享型",
//               "factory_price":"74.60",
//               "engine":"3.0T 333马力 V6",
//               "year":"2017",
//               "dealer_price":"58.19"
//           },




@end
