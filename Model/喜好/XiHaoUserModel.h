//
//  XiHaoUserModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/14.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

#import "TagsModel.h"

@interface XiHaoUserModel : FatherModel

@property(nonatomic,strong)NSMutableArray<TagsModel> *searchtags;
@property(nonatomic,strong)NSMutableArray<TagsModel> *checkedtags;
@property(nonatomic,strong)NSMutableArray<TagsModel> *group1tags;
@property(nonatomic,strong)NSMutableArray<TagsModel> *group2tags;

@end
