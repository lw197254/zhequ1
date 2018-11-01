//
//  SearchResultArticleListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "InfoArticleModel.h"
@protocol SearchResultArticleListModel
@end
@interface SearchResultArticleListModel : FatherModel
@property(nonatomic,assign)NSInteger total;
@property(nonatomic,strong)NSArray<InfoArticleModel>*list;
@property(nonatomic,strong)NSMutableArray<InfoArticleModel*>*showList;
@end
