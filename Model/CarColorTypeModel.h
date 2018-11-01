//
//  CarColorTypeModel.h
//  chechengwang
//
//  Created by 严琪 on 17/2/21.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarColorTypeModel
@end
@interface CarColorTypeModel : FatherModel

@property(nonatomic,strong)NSString *color_id;
@property(nonatomic,strong)NSString *value;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *name;

@end
