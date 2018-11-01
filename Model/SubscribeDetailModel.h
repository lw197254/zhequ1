//
//  SubscribeDetailModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/4/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "AuthorModel.h"
#import "SubscribeDetailArticleModel.h"
@interface SubscribeDetailModel : FatherModel
@property(nonatomic,assign)NSInteger page_count;
@property(nonatomic,strong)AuthorModel*author;
@property(nonatomic,strong)NSArray<SubscribeDetailArticleModel>*list;

@end
