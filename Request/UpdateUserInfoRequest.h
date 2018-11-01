//
//  UpdateUserInfoRequest.h
//  12123
//
//  Created by 琪琪雪雪 on 16/10/27.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface UpdateUserInfoRequest : FatherRequest
///昵称
@property(nonatomic,copy)NSString*nickname;
//省
@property(nonatomic,copy)NSString*province;
@property(nonatomic,copy)NSString*city;
@property(nonatomic,copy)NSString*area;
///sex	string	性别 1男 2 女
@property(nonatomic,copy)NSString* sex;

@property(nonatomic,copy)NSString*head;
@property(nonatomic,copy)NSString*uid;
@end
