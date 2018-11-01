//
//  InfoRelateTypesModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/13.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol  InfoRelateTypesModel
@end
@interface InfoRelateTypesModel : FatherModel
@property(nonatomic,copy)NSString *score;
@property(nonatomic,copy)NSString *typeid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *zhidaoprice;
@property(nonatomic,copy)NSString *picurl;
@end
