//
//  NewCompareCarListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "NewCompareCarModel.h"
@protocol NewCompareCarListModel

@end
@interface NewCompareCarListModel : FatherModel
@property (nonatomic,copy)NSArray<NewCompareCarModel> *data;

@end
