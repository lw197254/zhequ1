//
//  PromotionDearInfoModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/8.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol PromotionDearInfoModel
@end
@interface PromotionDearInfoModel : FatherModel
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *name;

@property(nonatomic,strong)NSString *shortname;
@property(nonatomic,strong)NSString *cityid;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *servicePhone;
@property(nonatomic,strong)NSString *is24hour;
@property(nonatomic,strong)NSString *lat;
@property(nonatomic,strong)NSString *lon;
@property(nonatomic,strong)NSString *orderrange;
@property(nonatomic,strong)NSString *scopestatus;
@property(nonatomic,strong)NSString *scopename;
@property(nonatomic,strong)NSString *pic_url;
///是有否公司简介
@property(nonatomic,strong)NSString *hascontent;


@end
