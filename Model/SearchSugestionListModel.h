//
//  SearchSugestionListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "SearchSugestionModel.h"
@interface SearchSugestionListModel : FatherModel
@property(nonatomic,strong)NSArray<SearchSugestionModel>*data;
@end