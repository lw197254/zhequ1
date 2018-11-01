//
//  TagsListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/11.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "TagsModel.h"

@interface TagsListModel : FatherModel
//userdata
@property(nonatomic,strong)NSMutableArray<TagsModel> *data;

@property(nonatomic,strong)NSMutableArray<TagsModel> *hotdata;
@property(nonatomic,strong)NSMutableArray<TagsModel> *cardata;
@property(nonatomic,strong)NSMutableArray<TagsModel> *userdata;

-(void)sethotandcar;


@end
