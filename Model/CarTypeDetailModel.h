//
//  CarTypeDetailModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/5.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarTypeDetailDealerListModel.h"
#import "CarTypeDetailPictureModel.h"

#import "CarTypeDetailSeeOtherModel.h"
@interface CarTypeDetailModel : FatherModel

///] => 27955                       //车型id
@property(nonatomic,copy)NSString*car_id;
///] => 2017款 TFSI 舒适型        //款式名
@property(nonatomic,copy)NSString*car_name;
///] => 45.65
@property(nonatomic,copy)NSString*factory_price;
///品牌类型名字（奥迪）
@property(nonatomic,copy)NSString*car_brand_type_name;
///城市id
@property(nonatomic,copy)NSString*city_id;
///城市
@property(nonatomic,copy)NSString*city_name;
///车系id（）
@property(nonatomic,copy)NSString*car_brand_type_id;
///分享链接
@property(nonatomic,copy)NSString*share_link;

///是否存在口碑
@property(nonatomic,assign)BOOL hasKoubei;
///是否存在咨询
@property(nonatomic,assign)BOOL hasArt;
///是否存在图片
@property(nonatomic,assign)BOOL hasPic;
///是否存在配置
@property(nonatomic,assign)BOOL hasParam;

@property(nonatomic,strong)NSArray<CarTypeDetailSeeOtherModel>*see_others;///] => 45.65

@property(nonatomic,strong)CarTypeDetailDealerListModel*dealers;///] => 45.65

@property(nonatomic,strong)CarTypeDetailPictureModel*picture;///] => 45.65

@property(nonatomic,copy)NSString *zws;

@property(nonatomic,copy)NSString *engine_capacity;
@end
