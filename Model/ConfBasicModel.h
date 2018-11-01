//
//  ConfBasicModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface ConfBasicModel : FatherModel
@property(nonatomic,copy) NSString *CAR_ID;/// "24969",
@property(nonatomic,copy) NSString *FACTORY_NAME;/// "一汽-大众奥迪",
@property(nonatomic,copy) NSString *CAR_MODEL;/// "中大型车",
@property(nonatomic,copy) NSString *ENGINE;/// "1.8T 190马力 L4",
@property(nonatomic,copy) NSString *GEARBOX;/// "7挡双离合",
@property(nonatomic,copy) NSString *LWH;/// "5036*1874*1466",
@property(nonatomic,copy) NSString *BODY_STRUCTURE;/// "4门5座三厢车",
@property(nonatomic,copy) NSString *CREATOR_ID;/// "-",
@property(nonatomic,copy) NSString *MAX_SPEED;/// "235",
@property(nonatomic,copy) NSString *HK_ACC_FA;/// "8.5",
@property(nonatomic,copy) NSString *HK_ACC_ME;/// "-",
@property(nonatomic,copy) NSString *HK_BRA_ME;/// "-",
@property(nonatomic,copy) NSString *HK_CON_ME;/// "-",
@property(nonatomic,copy) NSString *HK_CON_GOV;/// "6.5",
@property(nonatomic,copy) NSString *GROUND_CL_ME;/// "-",
@property(nonatomic,copy) NSString *VEHICLE_WARRANTY;/// "三年或10万公里",
@property(nonatomic,copy) NSString *PRICE;/// "46.12"
@end
