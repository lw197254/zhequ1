//
//  PicModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol  PicModel
@end
@interface PicModel : FatherModel
@property(nonatomic,strong)NSString *smallpic;
@property(nonatomic,strong)NSString *bigpic;
@property(nonatomic,strong)NSString *smallpic_source;
@property(nonatomic,strong)NSString *bigpic_source;


@property(nonatomic,strong)NSString *car_name;
@property(nonatomic,strong)NSString *price;
//车系详情
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *car_id;
@property(nonatomic,strong)NSString *category_id;
@property(nonatomic,strong)NSString *color_id;
@property(nonatomic,strong)NSString *car_brand_type_id;
//车系图片
@property(nonatomic,strong)NSString *highpic;
@property(nonatomic,strong)NSString *color;

@property(nonatomic,strong)NSString *has_dealer;
@end
