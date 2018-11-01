//
//  SalesInformationModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol  SalesInformationModel
@end
@interface SalesInformationModel : FatherModel
@property(nonatomic,copy)NSString *newsid;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *inputdate;
@property(nonatomic,copy)NSString *thumb;
@property(nonatomic,copy)NSString *start;
@property(nonatomic,copy)NSString *end;
@property(nonatomic,copy)NSString *days;
@end
