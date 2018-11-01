//
//  DealerCarModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "PromotionDearInfoModel.h"
#import "DealerColorModel.h"
#import "PromotionCarList.h"


@interface DealerCarModel : FatherModel

@property(nonatomic,copy)PromotionDearInfoModel *dealerinfo;

@property(nonatomic,copy)NSString *typeId;
@property(nonatomic,copy)NSString *picurl;

@property(nonatomic,copy)NSString *carId;
@property(nonatomic,copy)NSString *carname;
@property(nonatomic,copy)NSString *brandId;
@property(nonatomic,copy)NSString *brandName;

@property(nonatomic,copy)NSString *realPrice;
@property(nonatomic,copy)NSString *facPrice;
@property(nonatomic,copy)NSString *showPrice;
@property(nonatomic,copy)NSString *reducePrice;
@property(nonatomic,copy)NSString *reduceRate;
@property(nonatomic,copy)NSString *proinfo;

@property(nonatomic,copy)NSArray<DealerColorModel> *carcolor;
@property(nonatomic,copy)NSArray<PromotionCarList> *carinfo;
@end
