//
//  HomeModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

#import "BannerModel.h"
#import "PicShowModel.h"
#import "Brand.h"

@protocol HomeModel

@end
@interface HomeModel : FatherModel
@property(nonatomic,strong)NSMutableArray<Brand> *brand;
@property (nonatomic, strong) NSMutableArray<PicShowModel> *list;
@property (nonatomic, strong) NSMutableArray<BannerModel> *picShow;
@end
