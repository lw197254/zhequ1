//
//  NewCarForSaleListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "NewCarForSaleSectionModel.h"
@interface NewCarForSaleListModel : FatherModel
@property(nonatomic,strong)NSMutableArray<NewCarForSaleSectionModel*>*list;
@end
