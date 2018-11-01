//
//  FastLoginRequest.m
//  12123
//
//  Created by 刘伟 on 2016/10/25.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FastLoginRequest.h"

@implementation FastLoginRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"queryFastLogin";
}
@end
