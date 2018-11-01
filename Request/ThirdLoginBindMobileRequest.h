//
//  ThirdLoginBindMobileRequest.h
//  12123
//
//  Created by 刘伟 on 2016/11/7.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"
///第三方登录绑定手机
@interface ThirdLoginBindMobileRequest : FatherRequest
///varchar	手机号码 13814503433
@property(nonatomic,copy)NSString*mobile;
///	varchar	验证码 123456
@property(nonatomic,copy)NSString*code;
///varchar	第三方类型：qq,wechat,weibo
@property(nonatomic,copy)NSString*thirdType	;
///varchar	第三方用户ID标识
@property(nonatomic,copy)NSString*signUserId;
//	array	返回数据，打包传过来
@property(nonatomic,strong)id data;

@end
