//
//  VideoLabelListModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "VideoLabelModel.h"

@interface VideoLabelListModel : FatherModel

@property (nonatomic,copy) NSArray<VideoLabelModel> *info;

@end
