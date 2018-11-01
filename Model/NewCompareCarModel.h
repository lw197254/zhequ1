//
//  NewCompareCarModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "CompareCar.h"
#import "CompareBudget.h"
#import "CompareConfig.h"
#import "CompareKoubei.h"
@protocol NewCompareCarModel

@end

@interface NewCompareCarModel : FatherModel

@property(nonatomic,strong)CompareCar *cars;
@property(nonatomic,strong)CompareBudget *budget;

@property(nonatomic,strong)CompareConfig *config;

@property(nonatomic,strong)CompareKoubei *koubei;


@end
