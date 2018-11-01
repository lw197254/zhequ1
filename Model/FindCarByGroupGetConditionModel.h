//
//  FindCarByGroupGetConditionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol FindCarByGroupGetConditionModel
@end
//typedef NS_ENUM(NSInteger,FindCarByGroupGetConditionType){
//    ///1:职场菜鸟
//    FindCarByGroupGetConditionTypeYongGuy = 1,
//    ///2新婚燕尔
//    FindCarByGroupGetConditionTypeNewMarried = 2,
//    ///3奶爸奶妈
//    FindCarByGroupGetConditionTypeMatherAndFather = 3,
/////    4多子女家庭
//    FindCarByGroupGetConditionTypeManyChildFamily = 4,
/////    5事业有成
//    FindCarByGroupGetConditionTypeCareerSuccess = 5
//};

@interface FindCarByGroupGetConditionModel : FatherModel
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,copy)NSString* typeName;
@property(nonatomic,assign)NSInteger minPrice;
@property(nonatomic,assign)NSInteger maxPrice;
@property(nonatomic,strong)NSArray<NSNumber*>* level;
@end
