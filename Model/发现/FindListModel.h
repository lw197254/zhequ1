//
//  FindListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/12.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "FindBaseModel.h"

@interface FindListModel : FatherModel

@property(nonatomic,copy) NSArray<FindBaseModel> *data;
@end
