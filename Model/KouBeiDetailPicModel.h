//
//  KouBeiDetailPicModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiDetailPicModel

@end
@interface KouBeiDetailPicModel : FatherModel

@property(nonatomic,copy)NSString *original_small_img;
@property(nonatomic,copy)NSString *smallPic;
@property(nonatomic,copy)NSString *bigPic;
@end
