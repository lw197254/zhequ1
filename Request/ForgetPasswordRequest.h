//
//  ChangePasswordRequest.h
//  12123
//
//  Created by Mr.Yan on 16/5/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"
///修改密码
@interface ForgetPasswordRequest : FatherRequest
@property(nonatomic,copy)NSString *mobile;
@property(nonatomic,copy)NSString *pwd;
@property(nonatomic,copy)NSString *code;




@end
