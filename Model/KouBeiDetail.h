//
//  KouBeiDetail.h
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiDetail

@end

@interface KouBeiDetail : FatherModel

@property(nonatomic,copy)NSString *click_count;
@property(nonatomic,copy)NSString *publish_time;
@property(nonatomic,copy)NSString *original_user_name;
@property(nonatomic,copy)NSString *original_user_pic;
@property(nonatomic,copy)NSString *car_brand_son_type_id;
@property(nonatomic,copy)NSString *car_brand_son_type_name;
@property(nonatomic,copy)NSString *car_brand_type_id;
@property(nonatomic,copy)NSString *car_brand_type_name;
@property(nonatomic,copy)NSString *CAR_BRAND_TYPE_NAME;
@property(nonatomic,copy)NSString *oil;
@property(nonatomic,copy)NSString *price;


@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *buytime;
@property(nonatomic,copy)NSString *mileage;
@property(nonatomic,copy)NSString *support_count;
@property(nonatomic,copy)NSString *consumptionscore;
@property(nonatomic,copy)NSString *space;
@property(nonatomic,copy)NSString *power;
@property(nonatomic,copy)NSString *maneuverability;

@property(nonatomic,copy)NSString *comfortableness;
@property(nonatomic,copy)NSString *apperance;
@property(nonatomic,copy)NSString *internals;
@property(nonatomic,copy)NSString *costefficient;

@end
