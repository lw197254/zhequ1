//
//  PhotoFatherModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "PicModel.h"
@interface PhotoFatherModel : FatherModel

@property(nonatomic,assign)NSUInteger count;
@property(nonatomic,assign)NSUInteger curPage;

@property(nonatomic,strong)NSArray<PicModel> *list;

@end
