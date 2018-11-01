//
//  ThirdLoginRequest.m
//  12123
//
//  Created by 刘伟 on 2016/11/7.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "ThirdLoginRequest.h"
NSString * const thirdLoginTypeQQ = @"qq";
NSString * const thirdLoginTypeWechat = @"wechat";
NSString * const thirdLoginTypeWeibo = @"sina";
@implementation ThirdLoginRequest
-(void)loadRequest{
    [super loadRequest];
     self.withErrorAlert = YES;
    self.action = @"user/login";
}
@end
