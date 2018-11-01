//
//  CollectionUserModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

#import "KouBeiCarDeptModel.h"
#import "KouBeiCarTypeModel.h"
#import "KouBeiDBModel.h"
#import "KouBeiArtModel.h"

@protocol CollectionUserModel

@end

@interface CollectionUserModel : FatherModel
@property(nonatomic,strong)NSArray<KouBeiCarDeptModel> *series;
@property(nonatomic,strong)NSArray<KouBeiCarTypeModel> *car;
@property(nonatomic,strong)NSArray<KouBeiArtModel> *art;
@property(nonatomic,strong)NSArray<KouBeiDBModel> *repution;
@end
