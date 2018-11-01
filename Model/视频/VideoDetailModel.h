//
//  ViewDetailModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "VideoModel.h"

@interface VideoDetailModel : FatherModel

@property(nonatomic,strong) VideoModel *info;

@property(nonatomic,strong) NSArray<VideoModel> *aboutList;

@end
