//
//  PublicPraiseTopRequest.m
//  chechengwang
//
//  Created by 严琪 on 17/1/16.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "PublicPraiseTopRequest.h"

@implementation PublicPraiseTopRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"koubei/chexi";
    self.needLoadingView = NO;
}
@end
