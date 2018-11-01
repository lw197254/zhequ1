//
//  LocationModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface LocationModel : FatherModel
@property(nonatomic,copy)NSString*city;
@property(nonatomic,copy)NSString*cityId;
@property(nonatomic,copy)NSString*address;
@property(nonatomic,assign)float lat;
@property(nonatomic,assign)float lon;
@end
