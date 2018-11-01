//
//  UserModel.h
//  Qumaipiao
//
//  Created by 刘伟 on 15/6/17.
//  Copyright (c) 2015年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
typedef NS_ENUM(NSInteger,Gender){
    GenderMan = 1,
    GenderWomen = 2
};
typedef NS_ENUM(NSInteger,LoginType){
    LoginTypeCheChengWang = 0,
    LoginTypeThirdSource = 1,
//    LoginTypeSina = 2,
//    LoginTypeWeChat = 3
};
@interface UserModel : FatherModel
///必填 用户id
@property(nonatomic,copy)NSString*uid;
///昵称
@property(nonatomic,copy)NSString*nickname;
///手机号
@property(nonatomic,copy)NSString*mobile;
///性别	1男 2女
@property(nonatomic,assign)Gender sex;
///省code
@property(nonatomic,copy)NSString*province;
///市code
@property(nonatomic,copy)NSString*city;
///区code
@property(nonatomic,copy)NSString*area;

///省name
@property(nonatomic,copy)NSString*provincename;
///市code
@property(nonatomic,copy)NSString*cityname;
///区code
@property(nonatomic,copy)NSString*areaname;
///地址
@property(nonatomic,copy)NSString*address;
///头像地址
@property(nonatomic,copy)NSString*head;
///真实姓名
@property(nonatomic,copy)NSString*realname;
///注册时间
@property(nonatomic,copy)NSString*regtime;
//存在的数据
@property(nonatomic,copy)NSString *dynamicCount;

@property(nonatomic,assign)LoginType loginType;

+(void)loginOut;
+(instancetype)shareInstance;

@end
