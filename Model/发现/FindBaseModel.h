//
//  FindBaseModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/12.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol FindBaseModel
@end

@interface FindBaseModel : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *img_url;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *click;
@property(nonatomic,copy)NSString *addtime;
@property(nonatomic,copy)NSString *updatetime;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,copy)NSString *sort;
@end
