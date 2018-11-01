//
//  InfoBaseModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "InfoNewSonModel.h"
#import "InfoArticleModel.h"
#import "InfoContentModel.h"
#import "InfoRelateTypesModel.h"
#import "MatchModel.h"

@interface InfoBaseModel : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *catid;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *auther;

@property(nonatomic,copy)NSString *inputtime;
@property(nonatomic,copy)NSString *click;
@property(nonatomic,copy)NSString *brandTypeId;
@property(nonatomic,copy)NSString *arcurl;

@property(nonatomic,strong)NSArray<InfoContentModel> *content;

@property(nonatomic,strong)NSArray<InfoNewSonModel> *carRecommedList;
@property(nonatomic,strong)NSArray<InfoArticleModel> *articleList;
@property(nonatomic,strong)NSArray<InfoRelateTypesModel> *relatetypes;

@property(nonatomic,strong)NSMutableArray<MatchModel> *match;

@property(nonatomic,copy)NSString *authorPic;
@property(nonatomic,copy)NSString *authorName;
@property(nonatomic,copy)NSString *authorId;

 
///分享用的图片
@property(nonatomic,copy)NSString *thumb;

@end
