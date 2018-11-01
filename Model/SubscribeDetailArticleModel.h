//
//  SubscribeDetailArticleModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/4/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol SubscribeDetailArticleModel
@end
@interface SubscribeDetailArticleModel : FatherModel
/////文章url
@property(nonatomic,copy)NSString *url;
/////文章ID
@property(nonatomic,copy)NSString *id;
///2017-01-05",//发布日期
@property(nonatomic,copy) NSString *addtime;
///1274,//点击数
@property(nonatomic,copy) NSString *click;
///"勇猛者F150对比林肯领航员",//标题
@property(nonatomic,copy) NSString *title;
///,//作者ID
@property(nonatomic,copy) NSString *authorId;
///,//作者名字
@property(nonatomic,copy) NSString *authorName;
///"http://cdn.img.checheng.com/wemedia/news/cover/58ea585b2a4d6.jpg",//文章缩略图
@property(nonatomic,copy) NSString *thumb;
///相同底盘、发动机、变数箱、甚至在国外价格都如此相近的两款车！"//文章简述
@property(nonatomic,copy) NSString *des;

@property(nonatomic,strong)NSString *isRead;

@end
