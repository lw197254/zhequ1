//
//  SeaOthers.h
//  chechengwang
//
//  Created by 严琪 on 17/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol SeeOthers

@end

@interface SeeOthers : FatherModel
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *pic_url;
@property(nonatomic,strong)NSString *zhidaoPrice;
@property(nonatomic,strong)NSString *kb_average;
@end
