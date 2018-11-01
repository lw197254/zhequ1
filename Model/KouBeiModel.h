//
//  KouBeiModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "KouBeiPicModel.h"
#import "KouBeiContentModel.h"

@protocol KouBeiModel

@end
@interface KouBeiModel : FatherModel

@property(nonatomic,copy)NSString *reputation_id;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *userpic;
@property(nonatomic,copy)NSString *datetime;
@property(nonatomic,copy)NSString *price;
///油耗
@property(nonatomic,copy)NSString *oil;
///车型名称
@property(nonatomic,copy)NSString *car_brand_son_type_name;
///车型id
@property(nonatomic,copy)NSString *car_brand_son_type_id;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *mileage;
@property(nonatomic,copy)NSString *click_count;
@property(nonatomic,copy)NSString *support_count;
@property(nonatomic,strong)NSArray<KouBeiPicModel > *pics;

@property(nonatomic,strong)NSArray<KouBeiContentModel>*content;

///油耗类型 3电动 4油耗
@property(nonatomic,copy)NSString*oilType;

@end
