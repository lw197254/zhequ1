//
//  FindCarByGroupByCarTypeGetCarModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol FindCarByGroupByCarTypeGetCarModel
@end
@interface FindCarByGroupByCarTypeGetCarModel : FatherModel
@property(nonatomic,copy)NSString*desc;
@property(nonatomic,copy)NSString* car_id;	///int	车型ID
@property(nonatomic,copy)NSString* car_name;///	string	车型名称
@property(nonatomic,copy)NSString*engine;///	string	马力信息
@property(nonatomic,copy)NSString*driving_mode;///	string	驱动模式
@property(nonatomic,copy)NSString*gearbox;///	string	驱动类型
@property(nonatomic,copy)NSString*factory_price;///	string	厂商指导价
@property(nonatomic,copy)NSString*seatnum;///	座位数
@property(nonatomic,copy)NSString*engine_capacity;///	排量


@end
