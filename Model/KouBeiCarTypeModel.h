//
//  KouBeiCarTypeModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/16.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiCarTypeModel

@end
@interface KouBeiCarTypeModel : FatherModel
///搜藏车型
@property(nonatomic,strong)NSString *imgurl;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *typeId;
@property(nonatomic,strong)NSString *typeName;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *colId;
@property(nonatomic,strong)NSString *zhidaoPrice;
//tag ==2
@property(nonatomic,strong)NSString *tag;
@end
