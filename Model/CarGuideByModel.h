//
//  CarGuideByModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "BuyCarGuideModel.h"

@interface CarGuideByModel : FatherModel

@property(nonatomic,copy)NSArray<BuyCarGuideModel> *data;
@end
