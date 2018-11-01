//
//  CompareCar.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol RanklistModel
@end
@interface CompareCar : FatherModel

@property(nonatomic,copy) NSString *cx_name;
@property(nonatomic,copy) NSString *car_id;
@property(nonatomic,copy) NSString *car_name;
@property(nonatomic,copy) NSString *pic_url;

@end
