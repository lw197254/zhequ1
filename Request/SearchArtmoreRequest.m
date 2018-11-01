//
//  SearchArtmoreRequest.m
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "SearchArtmoreRequest.h"

@implementation SearchArtmoreRequest
-(void)loadRequest{
    [super loadRequest];
    self.limit = 10;
    self.action = @"search/artmore";
    self.needLoadingView = NO;
}
-(NSInteger)page{
    if (_page <=2) {
        _page = 2;
    }
    return _page;
}
@end
