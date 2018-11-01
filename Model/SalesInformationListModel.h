//
//  SalesInformationListModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "SalesInformationModel.h"

@interface SalesInformationListModel : FatherModel
@property(nonatomic,strong)NSArray<SalesInformationModel> *data;
@end
