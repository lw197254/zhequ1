//
//  SearchResultRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "SearchResultRequest.h"

@implementation SearchResultRequest
-(void)loadRequest{
    [super loadRequest];
    self.action = @"search/resultsearch";
    self.limit = 10;
}
@end
