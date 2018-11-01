//
//  PromotionCarList.h
//  chechengwang
//
//  Created by 严琪 on 17/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "PromotionCarModel.h"

@protocol  PromotionCarList
@end
@interface PromotionCarList : FatherModel
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSArray<PromotionCarModel> *carlist;
@end
