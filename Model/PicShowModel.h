//
//  PicShowModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol PicShowModel
@end
@interface PicShowModel : FatherModel

//文章和自媒体信息 1.车城网原创 2.自媒体
@property(nonatomic,copy)NSString *artType;
@property(nonatomic,copy)NSString *authorName;

@property(nonatomic,copy) NSString *showType;
@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *thumb;
@property(nonatomic,copy) NSString *inputtime;
@property(nonatomic,copy) NSString *click;

@property(nonatomic,copy) NSArray<NSString *> *imglist;

//设置文字变灰成为已读
@property(nonatomic,strong)NSString *isRead;

@end
