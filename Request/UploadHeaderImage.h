//
//  UploadHeaderImage.h
//  12123
//
//  Created by 刘伟 on 2016/10/27.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^UploadHeaderImageSuccessBlock)(UIImage*image,NSString*imageDataString);
@interface UploadHeaderImage : NSObject
+(instancetype)shareInstanceWithSuccessBlock:(UploadHeaderImageSuccessBlock)uploadSuccess;
@end
