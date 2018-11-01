//
//  PhotoMenuRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PhotoMenuRequest.h"

@implementation PhotoMenuRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"picture/getImgCateCount";
    self.needLoadingView = NO;
}
@end
