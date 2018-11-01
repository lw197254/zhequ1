//
//  HomelistRequest.m
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HomelistRequest.h"
#import "TagsModel.h"

@implementation HomelistRequest
-(void)loadRequest{
    [super loadRequest];
    self.action =@"site/newIndex";
    self.needLoadingView = NO;
}


-(NSString *)keywords{
    NSString *searchPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"PYSearchhistories.plist"];
    NSMutableArray *serach = [NSKeyedUnarchiver unarchiveObjectWithFile:searchPath];
    NSString *key = [serach componentsJoinedByString:@","];
    NSLog(@"search key:%@",key);
    return key;
}

@end
