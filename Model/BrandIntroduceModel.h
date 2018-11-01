//
//  BrandIntroduceModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/17.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "SeeOthers.h"
@interface BrandIntroduceModel : FatherModel
///] => 12
@property(nonatomic,copy)NSString*id;
///] => 现代
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*brand_story;
@property(nonatomic,copy)NSArray<SeeOthers>*brand_cars;

@end
