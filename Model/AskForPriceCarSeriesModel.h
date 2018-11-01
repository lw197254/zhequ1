//
//  AskForPriceCarSeriesModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "AskForPriceCarTypeModel.h"
@protocol AskForPriceCarSeriesModel
@end
@interface AskForPriceCarSeriesModel : FatherModel
///"":"奥迪A6L"
@property(nonatomic,copy)NSString*typename;

///":"18"
@property(nonatomic,copy)NSString*typeid;
@property(nonatomic,strong)NSArray<AskForPriceCarTypeModel>*carlist;
@end
