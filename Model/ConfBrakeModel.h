//
//  ConfBrakeModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface ConfBrakeModel : FatherModel
@property(nonatomic,copy) NSString *CAR_ID;/// "24969",
@property(nonatomic,copy) NSString *FRONT_BRAKE_TYPE;/// "通风盘式",
@property(nonatomic,copy) NSString *REAR_BRAKE_TYPE;/// "通风盘式",
@property(nonatomic,copy) NSString *PARK_BRAKE_TYPE;/// "电子驻车",
@property(nonatomic,copy) NSString *FRONT_TIRE_TYPE;/// "245/45 R18 ",
@property(nonatomic,copy) NSString *REAR_TIRE_TYPE;/// "245/45 R18 ",
@property(nonatomic,copy) NSString *SPARE_TIRE_TYPE;/// "非全尺寸"
@end
