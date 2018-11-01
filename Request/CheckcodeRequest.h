//
//  CheckcodeRequest.h
//  chechengwang
//
//  Created by 刘伟 on 2017/5/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface CheckcodeRequest : FatherRequest
///mobile	string	必填 手机号
@property(nonatomic,copy)NSString*mobile;

///string	必填 短信类型 reg_vcode-注册 pwd_vcode-找回密码 mbe_vcode-修改手机号
@property(nonatomic,copy)NSString*msgtype;
///string	必填 短信验证码
@property(nonatomic,copy)NSString*code;
@end
