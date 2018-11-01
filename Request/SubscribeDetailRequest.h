//
//  SubscribeDetailRequest.h
//  chechengwang
//
//  Created by 刘伟 on 2017/4/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface SubscribeDetailRequest : FatherRequest


///字段	类型	说明
///Int	自媒体作者ID 必传
@property(nonatomic,copy)NSString*authorId;
////	Int	默认10
@property(nonatomic,assign)NSInteger limit;
///Int	默认1
@property(nonatomic,assign)NSInteger page	;

@end
