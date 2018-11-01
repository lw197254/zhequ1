//
//  CarAllListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/10/26.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "CarCheXingModel.h"

@protocol CarAllListModel
@end

@interface CarAllListModel : FatherModel

@property(nonatomic,copy)NSArray<CarCheXingModel> *data;

@end
