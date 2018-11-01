//
//  CarSeriesFactoryBrandModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/28.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarSeriesFactoryBrandModel
@end
@interface CarSeriesFactoryBrandModel : FatherModel
@property(nonatomic,copy)NSString*brandid;
@property(nonatomic,copy)NSString*brandname;
@property(nonatomic,copy)NSString*picurl;
@end
