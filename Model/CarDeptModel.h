//
//  CarDeptModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarOnOffSale.h"
#import "SeeOthers.h"
#import "PicModel.h"
#import "RegTag.h"

@interface CarDeptModel : FatherModel

@property(nonatomic,copy)NSString *car_brand_type_id;
@property(nonatomic,copy)NSString *car_brand_type_name;
@property(nonatomic,copy)NSString *zhidaoPrice;
@property(nonatomic,copy)NSString *car_model_name;
@property(nonatomic,copy)NSString *engine;
@property(nonatomic,copy)NSString *pic_count;
@property(nonatomic,copy)NSString *share_link;
///是否存在口碑
@property(nonatomic,assign)BOOL hasKoubei;
///是否存在咨询
@property(nonatomic,assign)BOOL hasArt;
///是否存在图片
@property(nonatomic,assign)BOOL hasPic;
///是否存在配置
@property(nonatomic,assign)BOOL hasParam;
///是否存在经销商
@property(nonatomic,assign)BOOL hasDealer;

@property(nonatomic,copy)NSArray<CarOnOffSale> *carOnSale;
@property(nonatomic,copy)NSArray<CarOnOffSale> *carOffSale;
@property(nonatomic,copy)NSArray<SeeOthers> *seeOthers;
@property(nonatomic,copy)NSArray<PicModel> *pictures;
@property(nonatomic,copy)PicModel *picture;
@property(nonatomic,assign)BOOL carOffSaleSorted;


@property(nonatomic,copy)NSArray<RegTag> *repTag;

@property(nonatomic,copy)NSString *hot;
@end
