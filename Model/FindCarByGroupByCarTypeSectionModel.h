//
//  FindCarByGroupByCarTypeSectionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/4.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "FindCarByGroupByCarTypeGetCarModel.h"
@protocol FindCarByGroupByCarTypeSectionModel
@end
@interface FindCarByGroupByCarTypeSectionModel : FatherModel
@property(nonatomic,strong)NSArray<FindCarByGroupByCarTypeGetCarModel>*list;
@property(nonatomic,copy)NSString* title;

@end
