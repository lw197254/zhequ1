//
//  BuyCarModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol BuyCarCalculatorModel
@end
@interface BuyCarCalculatorModel : FatherModel
@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*subTitle;
@property(nonatomic,copy)NSString*rightImageName;
@property(nonatomic,copy)NSString*value;
@property(nonatomic,assign)BOOL withSelectButton;
@property(nonatomic,assign)BOOL selected;
@end
