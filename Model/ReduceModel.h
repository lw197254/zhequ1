//
//  ReduceModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/10/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@protocol ReduceModel
@end
@interface ReduceModel : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *dealer_id;
@property(nonatomic,copy)NSString *original_dealer_id;
@property(nonatomic,copy)NSString *car_brand_son_type_id;
@property(nonatomic,copy)NSString *car_brand_type_id;

@property(nonatomic,copy)NSString *manufacturer_price;
@property(nonatomic,copy)NSString *real_price;
@property(nonatomic,copy)NSString *last_data;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *addtime;

@property(nonatomic,copy)NSString *uptime;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *news_id;
@property(nonatomic,copy)NSString *original_id;
@property(nonatomic,copy)NSString *promotion_price;

@property(nonatomic,copy)NSString *ck_total_price;
@property(nonatomic,copy)NSString *discount_price;
@property(nonatomic,copy)NSString *promotion_info;
@property(nonatomic,copy)NSString *update_status;
@property(nonatomic,copy)NSString *city_id;

@property(nonatomic,copy)NSString *show_price;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *shortname;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *address;

@property(nonatomic,copy)NSString *phone;
@property(nonatomic,copy)NSString *phoneCode;
@property(nonatomic,copy)NSString *servicePhone;
@property(nonatomic,copy)NSString *pic_url;
@property(nonatomic,copy)NSString *orderrange;

@property(nonatomic,copy)NSString *juli;
@property(nonatomic,copy)NSString *reducPre;
@property(nonatomic,copy)NSString *CAR_BRAND_TYPE_NAME;
@property(nonatomic,copy)NSString *PIC_URL;
@property(nonatomic,copy)NSString *CAR_BRAND_SON_TYPE_NAME;


@end
