//
//  GetVerificationCodeRequest.h
//  TMC_convenientTravel
//
//  Created by Mr.Yan on 16/5/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"
///注册获取验证码
static NSString* const msgTypeRegist = @"reg_vcode";
///找回密码
static NSString* const msgTypeFindPasswordBack = @"pwd_vcode";
///修改手机号
static NSString* const msgTypeModifyMobile = @"mbe_vcode";
///一键登录 号码
static NSString* const msgTypeFastLogin = @"fast_vcode";


@interface GetVerificationCodeRequest : FatherRequest
@property(nonatomic,copy)NSString *mobile;
@property(nonatomic,copy)NSString *msgtype;


@end
