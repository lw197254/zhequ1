//
//  KouBeiCarDeptModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/16.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol KouBeiCarDeptModel

@end

///搜藏车系
@interface KouBeiCarDeptModel : FatherModel

@property(nonatomic,strong)NSString *imgurl;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *colId;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *zhidaoPrice;
@property(nonatomic,strong)NSString *tag;

@end
