//
//  KouBeiCarsModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiCarsModel

@end
@interface KouBeiCarsModel : FatherModel

@property(nonatomic,strong)NSString *car_id;
@property(nonatomic,strong)NSString *car_name;
@property(nonatomic,strong)NSString *koubei_num;
@end
