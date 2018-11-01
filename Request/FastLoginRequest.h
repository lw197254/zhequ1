//
//  FastLoginRequest.h
//  12123
//
//  Created by 刘伟 on 2016/10/25.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface FastLoginRequest : FatherRequest
@property(nonatomic,copy)NSString*mobile;
@property(nonatomic,copy)NSString*code;
@end
