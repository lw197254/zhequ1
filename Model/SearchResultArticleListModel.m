//
//  SearchResultArticleListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "SearchResultArticleListModel.h"

@implementation SearchResultArticleListModel

-(NSMutableArray<InfoArticleModel*>*)showList{
    if (!_showList) {
        _showList = [NSMutableArray<InfoArticleModel*> array];
    }
    return _showList;
}
@end
