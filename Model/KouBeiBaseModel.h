//
//  KouBeiBaseModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "KouBeiModel.h"
#import "RegTag.h"
#import "KouBeiSerieskBData.h"

@interface KouBeiBaseModel : FatherModel
@property(nonatomic,copy)NSString *car_brand_type_id;
@property(nonatomic,copy)NSString *car_brand_type_name;

@property(nonatomic,copy)NSString *brand_son_type_name;
@property(nonatomic,copy)NSString *brand_son_type_id;
///口碑评分
@property(nonatomic,copy)NSString *kb_average;
///参与用户数
@property(nonatomic,copy)NSString *user_count;
///口碑排名数
@property(nonatomic,copy)NSString* rank;
///车型数量
@property(nonatomic,copy)NSString*car_count;

@property(nonatomic,copy)NSArray<KouBeiModel> *koubei;

@property(nonatomic,copy)NSArray<RegTag> *repTag;
@property(nonatomic,copy)NSString *repCount;

@property(nonatomic,copy)KouBeiSerieskBData *seriesKbData;
@property(nonatomic,copy)KouBeiSerieskBData *seriesModelKbData;

///油耗类型 3电动 4油耗
@property(nonatomic,copy)NSString*oilType;
@end
