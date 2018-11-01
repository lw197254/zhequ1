//
//  KouBeiDetailBaseModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "KouBeiDetail.h"
#import "KouBeiDetailPicModel.h"
#import "KouBeiDetailContentModel.h"

@protocol KouBeiDetailBaseModel

@end
@interface KouBeiDetailBaseModel : FatherModel

@property(nonatomic,strong)KouBeiDetail *info;
@property(nonatomic,copy)NSString *oilType;
@property(nonatomic,copy)NSString *arcurl;
@property(nonatomic,strong)NSArray<KouBeiDetailPicModel> *pic;
@property(nonatomic,strong)NSArray<KouBeiDetailContentModel> *contents;
@end
