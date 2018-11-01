//
//  DealerDetailModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/8.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

#import "PromotionDearInfoModel.h"
#import "PromotionArtInfoModel.h"
#import "PromotionCarModel.h"

@interface DealerDetailModel : FatherModel
@property(nonatomic,copy)PromotionDearInfoModel *dealerinfo;
@property(nonatomic,copy)NSArray<PromotionArtInfoModel> *article;
@property(nonatomic,copy)NSArray<PromotionCarModel> *carlist;
@property(nonatomic,copy)NSString *share_link;
@end
