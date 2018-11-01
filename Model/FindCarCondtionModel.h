//
//  FindCarCondtionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
typedef NS_ENUM(NSInteger,CondtionType){
    ///价格
    CondtionTypePrice = 1,
    ///级别
    CondtionTypeLevel = 2,
    ///舒适度
    CondtionTypeShushi = 3,
    ///座位
    CondtionTypeZuowei = 4
};
@protocol FindCarCondtionModel
@end
@interface FindCarCondtionModel : FatherModel

@property(nonatomic,copy)NSString*parentLevel;
///级别中才有的index
@property(nonatomic,copy)NSString*index;
@property(nonatomic,assign)NSInteger min;
@property(nonatomic,assign)NSInteger max;
///级别id
@property(nonatomic,copy)NSString*key;
///string	5万以下
@property(nonatomic,copy)NSString*value;
///1是价格 2是级别
@property(nonatomic,assign)CondtionType type;
@end
