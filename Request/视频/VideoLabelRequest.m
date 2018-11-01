//
//  VideoLabelRequest.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "VideoLabelRequest.h"

@implementation VideoLabelRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"video/label";
    self.needLoadingView = NO;
}
@end
