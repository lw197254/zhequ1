//
//  KouBeiArtModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/16.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol KouBeiArtModel

@end
///搜藏文章
@interface KouBeiArtModel : FatherModel

@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *colId;
@property(nonatomic,strong)NSString *artType;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *authorName;
@property(nonatomic,strong)NSString *imgurl;
@property(nonatomic,strong)NSString *click;

@property(nonatomic,strong)NSString *tag;

@end
