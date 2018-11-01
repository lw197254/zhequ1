//
//  AskForPriceResultModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/6/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol AskForPriceResultModel
@end
@interface AskForPriceResultModel : FatherModel
///": "1070",
@property(nonatomic,copy)NSString *typeid;
///": "思域",
@property(nonatomic,copy)NSString *name;
///": "11.59-16.99万"
@property(nonatomic,copy)NSString *zhidaoprice;
///": "http://cdn.car.checheng.com/1/14/135/28541/1487317981357559.jpg?x-oss-process=image/resize,m_lfit,h_90,w_120/format,png"
@property(nonatomic,copy)NSString *picurl;
@end
