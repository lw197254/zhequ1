//
//  CarTypeSectionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarTypeModel.h"

@protocol CarTypeSectionModel
@end
@interface CarTypeSectionModel : FatherModel
@property(nonatomic,copy)NSString*name;
@property(nonatomic,strong)NSArray<CarTypeModel>*list;
@end
