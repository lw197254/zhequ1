//
//  PromotionArtInfoModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/8.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol PromotionArtInfoModel
@end
@interface PromotionArtInfoModel : FatherModel

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *newsid;
@property(nonatomic,strong)NSString *thumb;
@property(nonatomic,strong)NSString *start;
@property(nonatomic,strong)NSString *end;
@property(nonatomic,strong)NSString *days;
@property(nonatomic,strong)NSString *inputdate;
@property(nonatomic,strong)NSString *des;

@end
