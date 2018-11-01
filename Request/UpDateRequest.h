//
//  UpDateRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/5/15.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface UpDateRequest : FatherRequest

@property(nonatomic,copy)NSString *channel;
@property(nonatomic,copy)NSString *versionCode;

@end
