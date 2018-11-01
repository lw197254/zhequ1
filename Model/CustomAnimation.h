//
//  CustomAnimation.h
//  12123
//
//  Created by 刘伟 on 2016/11/2.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMKPointAnnotation.h"
@interface CustomAnimation : BMKPointAnnotation<BMKAnnotation>
@property(assign,nonatomic)BOOL isStop;
@property(copy,nonatomic)NSString *positionName;

@property(copy,nonatomic)NSString *positionDetails;
//@property(copy,nonatomic)NSString *title;
//
///**
// *获取annotation副标题
// *@return 返回annotation的副标题信息
// */
//@property(copy,nonatomic)NSString *subtitle;

@end
