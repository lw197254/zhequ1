//
//  CarSeriesModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarSeriesModel
@end
@interface CarSeriesModel : FatherModel

@property(nonatomic,copy)NSString*firstChar;
@property(nonatomic,copy)NSString*id;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,assign)BOOL isSaleable;
@property(nonatomic,copy)NSString*guildPrice;
@end
