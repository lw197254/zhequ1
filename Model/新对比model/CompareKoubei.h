//
//  CompareKoubei.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol CompareKoubei
@end
@interface CompareKoubei : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *car_brand_type_name;
@property(nonatomic,copy)NSString *car_brand_type_id;
@property(nonatomic,copy)NSString *car_brand_son_type_id;
@property(nonatomic,copy)NSString *car_brand_son_type_name;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *oil;
@property(nonatomic,copy)NSString *mileage;

@property(nonatomic,copy)NSString *original_user_name;
@property(nonatomic,copy)NSString *consumptionscore;
@property(nonatomic,copy)NSString *space;
@property(nonatomic,copy)NSString *power;
@property(nonatomic,copy)NSString *comfortabelness;
@property(nonatomic,copy)NSString *apperance;
@property(nonatomic,copy)NSString *costerfficient;


@property(nonatomic,copy)NSString *internals;
@property(nonatomic,copy)NSString *maneuverability;
@property(nonatomic,copy)NSString *publish_time;
@property(nonatomic,copy)NSString *star;
@property(nonatomic,copy)NSString *scontent;
@property(nonatomic,copy)NSString *nscontent;

@end
