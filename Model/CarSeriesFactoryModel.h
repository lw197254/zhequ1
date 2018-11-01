//
//  CarSeriesFactoryModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/28.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarSeriesFactoryModel
@end
@interface CarSeriesFactoryModel : FatherModel
@property(nonatomic,copy)NSString*typeid;
@property(nonatomic,copy)NSString*typename;
@property(nonatomic,copy)NSString*price;
@property(nonatomic,copy)NSString*picurl;

@end
