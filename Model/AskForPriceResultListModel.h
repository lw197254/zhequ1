//
//  AskForPriceResultListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/6/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "AskForPriceResultModel.h"
@interface AskForPriceResultListModel : FatherModel
///": "48287"
@property(nonatomic,copy)NSString *id;
@property(nonatomic,strong)NSArray<AskForPriceResultModel> *list;

@end
