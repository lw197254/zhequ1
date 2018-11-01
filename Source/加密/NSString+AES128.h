//
//  NSString+AES128.h
//  12123
//
//  Created by 刘伟 on 2016/9/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AES128)
+ (NSString *)AES128Encrypt:(NSString *)content key:(NSString *)key;

+ (NSString *)AES128Convert:(NSString *)aes128 ;
+ (NSData *)AES128Decrypt:(NSString *)content WithKey:(NSString *)key;
@end
