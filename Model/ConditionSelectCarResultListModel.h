//
//  ConditionSearchCarResultListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/17.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "ConditonSelectCarResultModel.h"
@interface ConditionSelectCarResultListModel : FatherModel
@property(nonatomic,assign)NSInteger total;///	int	当前请求第几页数据
@property(nonatomic,strong)NSArray<ConditonSelectCarResultModel>* list;

@end
