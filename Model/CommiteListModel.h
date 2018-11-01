//
//  CommiteListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/18.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "CommiteModel.h"

@protocol CommiteListModel
@end

@interface CommiteListModel : FatherModel

@property(nonatomic,assign)NSInteger page_count;
@property(nonatomic,assign)NSInteger totalpage;
@property(nonatomic,strong)NSArray<CommiteModel> *list;
@property(nonatomic,strong)NSArray<CommiteModel> *data;

@end
