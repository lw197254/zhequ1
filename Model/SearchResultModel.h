//
//  SearchResultModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "SearchSugestionModel.h"
#import "SearchResultArticleListModel.h"
@interface SearchResultModel : FatherModel
@property(nonatomic,strong)NSArray<SearchSugestionModel>*brand;
@property(nonatomic,strong)NSArray<SearchSugestionModel>*series;
@property(nonatomic,strong)SearchResultArticleListModel*article;

///":"宝马"
@property(nonatomic,copy)NSString*keywords;
@end
