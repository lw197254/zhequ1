//
//  LoginRequest.h
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/23.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"
///登录
@interface LoginRequest : FatherRequest

@property(nonatomic,copy)NSString*pwd;
@property(nonatomic,copy)NSString*mobile;



@end
