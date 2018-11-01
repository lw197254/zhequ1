//
//  ShadowFastLoginRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/2.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface ShadowFastLoginRequest : FatherRequest
@property(nonatomic,copy)NSString *mobile;
@property(nonatomic,copy)NSString *msgtype;
@property(nonatomic,copy)NSString *code;
@end
