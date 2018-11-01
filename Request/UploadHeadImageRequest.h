//
//  UploadHeadImageRequest.h
//  chechengwang
//
//  Created by 刘伟 on 2017/5/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface UploadHeadImageRequest : FatherRequest
///POST图片二进制流
@property(nonatomic,copy)NSString*headdata;
@end
