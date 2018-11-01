//
//  CarTypeModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarTypeModel
@end
@interface CarTypeModel : FatherModel

@property(nonatomic,copy)NSString*car_name;
@property(nonatomic,copy)NSString*car_id;
@end
