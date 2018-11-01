//
//  InformationModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/17.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol InformationModel
@end
@interface InformationModel : FatherModel
///] => 1765983
@property(nonatomic,copy)NSString*id;
///] => 最大功率170马力 长安CS75将推1.5T车型
@property(nonatomic,copy)NSString*title;
///] => http://img.car.mianfeiapp.net/auto/thumb/20160504/57ad62245368e.jpg
@property(nonatomic,copy)NSString*thumb;
/// ] => 2016-05-04
@property(nonatomic,copy)NSString*inputtime;
///] => 19452
@property(nonatomic,copy)NSString*click;
@property(nonatomic,copy)NSString *authorName;

@property(nonatomic,strong)NSString *isRead;
@end
