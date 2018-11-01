//
//  PromotionInfoModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/8.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

#import "PromotionDearInfoModel.h"
#import "PromotionArtInfoModel.h"
#import "PromotionPrcinfoModel.h"
#import "PromotionInfoModel.h"

#import "PromotionCarList.h"

@interface PromotionInfoModel : FatherModel

@property(nonatomic,strong)PromotionDearInfoModel *dealerinfo;
@property(nonatomic,strong)PromotionArtInfoModel *article;
@property(nonatomic,strong)NSString *proinfo;
@property(nonatomic,strong)NSArray<PromotionCarList> *carlist;
@property(nonatomic,strong)NSArray<PromotionPrcinfoModel> *picinfo;

@end
