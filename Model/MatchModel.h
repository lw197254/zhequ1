//
//  MatchModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/4/20.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol  MatchModel
@end

@interface MatchModel : FatherModel
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *str;

@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *hot;
@property(nonatomic,strong)NSString *count;

@property(nonatomic,strong)NSString *isfind;
@end
