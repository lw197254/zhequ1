//
//  NewCarForSaleSectionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/9/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "NewCarForSaleModel.h"
@protocol NewCarForSaleSectionModel
@end
@interface NewCarForSaleSectionModel : FatherModel
@property(nonatomic,strong)NSMutableArray<NewCarForSaleModel>*list;
@property(nonatomic,copy)NSString*title;
@end
