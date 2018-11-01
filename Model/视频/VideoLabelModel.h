//
//  VideoLabelModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol VideoLabelModel
@end
@interface VideoLabelModel : FatherModel

@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *label_name;
@property (nonatomic,copy) NSString *img_url;
@property (nonatomic,copy) NSString *describe;

@end
