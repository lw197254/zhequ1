//
//  ConditionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol ConditionModel
@end
@interface ConditionModel : FatherModel
//"title": "级别",
//"key": "level",
//
//"list": [
//         {
//             "value": "轿车(全部)",
//             "key": 10,
//             "list": [
//                      
//                      {
//                          "index": 1,
//                          "key": 1,
//                          "value": "微型车"

@property(nonatomic,copy)NSString*sectionKey;
@property(nonatomic,copy)NSString*rowKey;

@property(nonatomic,copy)NSString*index;
//@property(nonatomic,copy)NSString*key;
@property(nonatomic,copy)NSString*value;

@end
