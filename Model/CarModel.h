//
//  CarModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
typedef NS_ENUM(NSInteger,CarModelType){
    CarModelTypeSaleable = 0,
    CarModelTypeCanNotSale = 1,
    CarModelTypeWillSaleable =2
};
@protocol CarModel
@end
@interface CarModel : FatherModel
///] => 27747
@property(nonatomic,copy)NSString*brand_son_type_id;
///] => 2017款 330i M运动型
@property(nonatomic,copy)NSString*brand_son_type_name;
///] => 0    // 0.在售 1.停售 2.即将上市
@property(nonatomic,assign)CarModelType type;

@property(nonatomic,copy)NSString *pic_url;
@end
