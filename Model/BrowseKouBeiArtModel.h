//
//  BrowseKouBeiArtModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/18.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface BrowseKouBeiArtModel : FatherModel
@property(nonatomic,strong)NSString *pic;
//讲时间换成出处
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *views;
@property(nonatomic,strong)NSString *id;

@property(nonatomic,strong)NSString *tag;
@property(nonatomic,strong)NSString *arttype;

@property(nonatomic,strong)NSString *authorName;
@end
