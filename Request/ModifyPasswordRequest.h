//
//  ModifyPasswordRequest.h
//  TMC_lutao
//
//  Created by 刘伟 on 16/4/11.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface ModifyPasswordRequest : FatherRequest
@property(nonatomic,copy)NSString*mobile;
@property(nonatomic,copy)NSString*password;
//@property(nonatomic,copy)NSString*newPwd;
@end
