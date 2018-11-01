//
//  PromotionListModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "PromotionSaleCarModel.h"

@interface PromotionListModel : FatherModel
@property(nonatomic,strong)NSArray<PromotionSaleCarModel> *data;
@end
