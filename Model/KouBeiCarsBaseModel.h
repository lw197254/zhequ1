//
//  KouBeiCarsBaseModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "KouBeiCarsModel.h"
@protocol KouBeiCarsBaseModel

@end
@interface KouBeiCarsBaseModel : FatherModel
@property(nonatomic,strong)NSArray<KouBeiCarsModel> *cars;
@end
