//
//  RanklistModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "RankModel.h"
#import "RankSectionModel.h"
@protocol RanklistModel
@end

@interface RanklistModel : FatherModel
@property(nonatomic,strong)NSArray<RankModel> *data;
@property(nonatomic,strong)NSArray<RankSectionModel*> *showList;
@end
