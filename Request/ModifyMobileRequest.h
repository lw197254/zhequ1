//
//  ModifyMobileRequest.h
//  chechengwang
//
//  Created by 刘伟 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface ModifyMobileRequest : FatherRequest
///	必填 会员id
@property(nonatomic,copy)NSString*uid;
///必填 新手机号
@property(nonatomic,copy)NSString*mobile;
///必填 验证码
@property(nonatomic,copy)NSString*code;



@end
