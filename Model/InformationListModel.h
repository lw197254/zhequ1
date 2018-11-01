//
//  InformationListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/17.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "InformationModel.h"
@interface InformationListModel : FatherModel
@property(nonatomic,strong)NSArray<InformationModel>*list;
@end
