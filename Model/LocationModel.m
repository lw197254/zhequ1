//
//  LocationModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel
-(void)loadModel{
    [super loadModel];
    NSArray*array =[self getAllProperties];
    for (NSString*properity in array) {
        id value=  [[NSUserDefaults standardUserDefaults]objectForKey:[NSStringFromClass([self class]) stringByAppendingString:properity]];
        if (value) {
            [self setValue:value forKey:properity];
        }
        
    }

}
@end
