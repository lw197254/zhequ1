//
//  ConfChassisModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface ConfChassisModel : FatherModel
@property(nonatomic,copy) NSString *CAR_ID;///"24969",
@property(nonatomic,copy) NSString *DRIVING_MODE;///"前置前驱",
@property(nonatomic,copy) NSString *FRONT_SU_TYPE;///"五连杆式独立悬架",
@property(nonatomic,copy) NSString *REAR_SU_TYPE;///"梯形连杆式独立悬架",
@property(nonatomic,copy) NSString *HELP_POWER_TYPE;///"电动助力",
@property(nonatomic,copy) NSString *BODY_STRUCTURE;///"承载式",
@property(nonatomic,copy) NSString *FOUR_DRIVE_TYPE;///"-",
@property(nonatomic,copy) NSString *DIFFERENTIAL;///"-"
@end
