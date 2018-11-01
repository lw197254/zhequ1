//
//  MyAction.h
//  12123
//
//  Created by 刘伟 on 2016/9/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "Action.h"
#import "FatherRequest.h"
@interface MyAction : Action

+(void)actionConfigHost:(NSString *)host client:(NSString *)client codeKey:(NSString *)codeKey rightCode:(NSInteger)rightCode msgKey:(NSString *)msgKey;
+ (id)Action;
- (id)initWithCache;
- (void)success:(FatherRequest *)msg;
- (void)error:(FatherRequest *)msg;
- (void)failed:(FatherRequest *)msg;
- (void)useCache;
- (void)readFromCache;
- (void)notReadFromCache;
- (AFHTTPSessionManager *)Send:(FatherRequest *) msg;
- (AFHTTPSessionManager *)Download:(FatherRequest *)msg;
-(AFHTTPSessionManager *)Upload:(FatherRequest *)msg;
AS_SINGLETON(MyAction)
@end
