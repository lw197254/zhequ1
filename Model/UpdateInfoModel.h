//
//  UpdateInfoModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/5/15.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@interface UpdateInfoModel : FatherModel
@property(nonatomic,copy)NSString<Ignore> *id;
@property(nonatomic,copy)NSString<Ignore> *title;
@property(nonatomic,copy)NSString<Ignore> *versionCode;
@property(nonatomic,copy)NSString<Ignore> *versionName;
@property(nonatomic,copy)NSString<Ignore> *status;
@property(nonatomic,copy)NSString *des;
@end
