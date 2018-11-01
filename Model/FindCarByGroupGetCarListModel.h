//
//  FindCarByGroupGetCarListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "FindCarByGroupGetCarModel.h"
@interface FindCarByGroupGetCarListModel : FatherModel
@property(nonatomic,assign)NSInteger count;///	int	当前请求返回的总记录数
@property(nonatomic,assign)NSInteger curPage;///	int	当前请求第几页数据
@property(nonatomic,strong)NSArray<FindCarByGroupGetCarModel>* data;///	array	车系相关信息
-(NSMutableArray *)success:(NSMutableArray *)originArray
                  newArray:(NSArray *)newArray;

@end
