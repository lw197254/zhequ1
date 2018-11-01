//
//  RankSectionModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "RankModel.h"

@protocol RankSectionModel
@end


@interface RankSectionModel : FatherModel
@property(nonatomic,copy)NSString*firshChar;
@property(nonatomic,strong)NSMutableArray<RankModel*> *data;
@end
