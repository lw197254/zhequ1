//
//  PromotionSaleCarModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "PromotionTypeInfoModel.h"
@protocol  PromotionSaleCarModel
@end
@interface PromotionSaleCarModel : FatherModel
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSArray<PromotionTypeInfoModel> *typeinfo;
@end
