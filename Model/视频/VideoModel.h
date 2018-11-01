//
//  VideoModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@protocol VideoModel
@end

@interface VideoModel : FatherModel
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *label_id;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *big_img_url;
@property (nonatomic,copy) NSString *des;
@property (nonatomic,copy) NSString *sd_mp4;
@property (nonatomic,copy) NSString *series_id;
@property (nonatomic,copy) NSString *click_count;
@property (nonatomic,strong) NSString *picType;
@property (nonatomic,assign) CGFloat despritionHeight;
@end
