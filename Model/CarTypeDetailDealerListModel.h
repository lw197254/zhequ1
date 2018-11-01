//
//  CarTypeDetailDealerListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "CarTypeDetailDealerModel.h"
@protocol CarTypeDetailDealerListModel
@end
@interface CarTypeDetailDealerListModel : FatherModel
///所有的店
@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel>*list;
///授权店
@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel*>*normalList;
///综合店
@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel*>*unixList;
///授权店
@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel*>*normalDistanceList;
///综合店
@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel*>*unixDistanceList;
///展示用数组
@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel>*listbydis;

@property(nonatomic,strong)NSArray<CarTypeDetailDealerModel*>*showList;
@property(nonatomic,assign)NSInteger count;
@end
