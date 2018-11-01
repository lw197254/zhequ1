//
//  RankModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol RankModel
@end
@interface RankModel : FatherModel
@property(nonatomic,copy)NSString *munid;
@property(nonatomic,copy)NSString *cate_id;
@property(nonatomic,copy)NSString *structure_id;
@property(nonatomic,copy)NSString *cxID;
@property(nonatomic,copy)NSString *order_sort;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sort;
@property(nonatomic,copy)NSString *pic_url;
@property(nonatomic,copy)NSString *zhidaoPrice;
@property(nonatomic,copy)NSString<Ignore> *addtime;
@property(nonatomic,copy)NSString<Ignore> *updatetime;
///紧凑型
@property(nonatomic,copy)NSString *structure_name;

///3.5.0以上
@property(nonatomic,copy)NSString *CAR_BRAND_TYPE_ID;
@property(nonatomic,copy)NSString *CAR_BRAND_TYPE_NAME;
@property(nonatomic,copy)NSString *PIC_URL;
@property(nonatomic,copy)NSString *car_model;
@property(nonatomic,copy)NSString *hot;
@property(nonatomic,copy)NSString *car_model_id;
@property(nonatomic,copy)NSString *sales;
@property(nonatomic,copy)NSString *month;
@end
