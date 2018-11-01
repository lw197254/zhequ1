//
//  KouBeiDBModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/16.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"


@protocol KouBeiDBModel

@end
///搜藏口碑
@interface KouBeiDBModel : FatherModel
@property(nonatomic,strong)NSString *addtime;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *click;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *colId;
//tag  为3是口碑
@property(nonatomic,strong)NSString *tag;
@end
