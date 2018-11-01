//
//  CarOnOffTypeModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarOnOffTypeModel
@end
@interface CarOnOffTypeModel : FatherModel
//  "id":"27961",
//"name":"2017款 50 TFSI quattro 尊享型",
//"factory_price":"74.60",
//"engine":"3.0T 333马力 V6",
//"year":"2017",
//"dealer_price":"58.19"
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *factory_price;
@property(nonatomic,copy)NSString *engine;
@property(nonatomic,copy)NSString *year;
///停售列表没有dealer_price属性
@property(nonatomic,copy)NSString *dealer_price;
///在售列表没有has_dealer属性，停售列表通过has_dealer判断是否可以询价
@property(nonatomic,assign)BOOL has_dealer;
///排量
@property(nonatomic,copy)NSString *engine_capacity;
///座位数
@property(nonatomic,copy)NSString *seatnum;
//engine = "2.0T 224\U9a6c\U529b L4";
//"engine_capacity" = "1.98";
//"factory_price" = "36.30";
//"has_dealer" = 1;
//id = 29857;
//name = "2016\U6b3e 45 TFSI \U5178\U85cf\U7248 quattro\U4e2a\U6027\U8fd0\U52a8\U578b";
//seatnum = 5;
//year = 2016;
//@property(nonatomic,copy)NSString *year;
@end
