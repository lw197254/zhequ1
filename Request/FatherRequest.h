//
//  FatherRequest.h
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "Request.h"
typedef enum {
    HostTypeWanShengWeiYe = 0,
    HostTypeTrain = 1
    
}HostType;

@interface FatherRequest : Request
@property(nonatomic,copy)NSString*urlBottomString;
-(NSString*)sign;
+(NSString*)requestTime;

@property(nonatomic,copy)NSString*action;
@property(nonatomic,assign)BOOL startRequest;
///用与保存本地的url；调用之前，需要先给request的属性赋值之后在对model进行监听，才能正确的读到cacheURL的值，否则会使cacheURL不正确从而读到错误的值
@property(nonatomic,copy)NSString*cacheURL;
@property(nonatomic,assign)BOOL needLoadingView;
@property(nonatomic,assign)BOOL isHalfClearColor;
@property(nonatomic,assign)HostType hostType;
@property(nonatomic,assign)BOOL withErrorAlert;
- (NSArray *)getAllProperties;

@end
