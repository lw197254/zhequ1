//
//  FastLoginCodeRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/2.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface FastLoginCodeRequest : FatherRequest
@property(nonatomic,copy) NSString*mobile;
// 必填
@property(nonatomic,copy) NSString*msgtype;
@end
