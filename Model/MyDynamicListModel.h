//
//  MyDynamicListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "MyDynamicModel.h"

@protocol MyDynamicListModel

@end
@interface MyDynamicListModel : FatherModel

@property(nonatomic,assign) NSInteger totalpage;
@property(nonatomic,assign) NSInteger count;
@property(nonatomic,copy) NSArray<MyDynamicModel> *list;
@end
