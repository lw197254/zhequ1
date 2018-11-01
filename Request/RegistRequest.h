//
//  RegistRequest.h
//  12123
//
//  Created by 刘伟 on 2016/9/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface RegistRequest : FatherRequest
@property(nonatomic,copy)NSString* mobile;
///varchar	密码 123456
@property(nonatomic,copy)NSString*pwd;
///varchar	验证码 123456
@property(nonatomic,copy)NSString*code;


@end
