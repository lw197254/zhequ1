//
//  BrowseKouBeiDBModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/18.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface BrowseKouBeiDBModel : FatherModel

@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *views;
@property(nonatomic,strong)NSString *id;
//tag  为3是口碑
@property(nonatomic,strong)NSString *tag;
@end
