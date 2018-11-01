//
//  FindCarByGroupByCarTypeGetCarListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "FindCarByGroupByCarTypeGetCarModel.h"
#import "FindCarByGroupByCarTypeYearModel.h"
@interface FindCarByGroupByCarTypeGetCarListModel : FatherModel
@property(nonatomic,strong)NSArray<FindCarByGroupByCarTypeYearModel>* data;///
////使用的用这个
@property(nonatomic,strong)NSArray<FindCarByGroupByCarTypeYearModel*>* list;///

@end
