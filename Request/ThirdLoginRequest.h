//
//  ThirdLoginRequest.h
//  12123
//
//  Created by 刘伟 on 2016/11/7.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

extern NSString * const thirdLoginTypeQQ ;
extern NSString * const thirdLoginTypeWechat ;
extern NSString * const thirdLoginTypeWeibo ;
@interface ThirdLoginRequest : FatherRequest

///	varchar	第三方类型：qq,wechat,weibo
@property(nonatomic,copy)NSString*unionTypeName;
///	varchar	第三方用户ID标识
@property(nonatomic,copy)NSString*unionId;
@property(nonatomic,copy)NSString*head;
@property(nonatomic,copy)NSString*nickname;
@property(nonatomic,copy)NSString*sex;

@end
