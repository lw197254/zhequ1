//
//  FindCarByGroupByCarTypeYearModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/6/14.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "FindCarByGroupByCarTypeSectionModel.h"
@protocol FindCarByGroupByCarTypeYearModel
@end
@interface FindCarByGroupByCarTypeYearModel : FatherModel
@property(nonatomic,strong)NSArray<FindCarByGroupByCarTypeSectionModel>*list;
@property(nonatomic,copy)NSString* title;
@end
