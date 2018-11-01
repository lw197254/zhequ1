//
//  ReduceListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/10/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

#import "ReduceModel.h"

@protocol ReduceListModel
@end

@interface ReduceListModel : FatherModel

@property(nonatomic,copy)NSArray<ReduceModel> *list;

@end
