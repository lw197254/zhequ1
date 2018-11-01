//
//  PromotionTypeInfoModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "PromotionCarList.h"
@protocol  PromotionTypeInfoModel
@end
@interface PromotionTypeInfoModel : FatherModel
@property(nonatomic,copy)NSString *typeId;
@property(nonatomic,copy)NSString *typename;
@property(nonatomic,copy)NSString *picurl;
@property(nonatomic,copy)NSString *carnum;
@property(nonatomic,copy)NSString *price;

@property(nonatomic,copy)NSArray<PromotionCarList> *carlist;
@end
