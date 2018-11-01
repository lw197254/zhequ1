//
//  PromotionCarModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol  PromotionCarModel
@end
@interface PromotionCarModel : FatherModel
@property(nonatomic,copy)NSString *carid;
@property(nonatomic,copy)NSString *carname;
@property(nonatomic,copy)NSString *realprice;
@property(nonatomic,copy)NSString *facprice;
@property(nonatomic,copy)NSString *showprice;
@property(nonatomic,copy)NSString *reduceprice;
@property(nonatomic,copy)NSString *proinfo;


@property(nonatomic,copy)NSString *picurl;
@property(nonatomic,copy)NSString *brandid;
@property(nonatomic,copy)NSString *brandname;
@property(nonatomic,copy)NSString *typename;
@property(nonatomic,copy)NSString *typeid;

@end
