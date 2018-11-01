//
//  HomelistMoreRequest.h
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface HomelistMoreRequest : FatherRequest
@property(nonatomic,assign)NSUInteger  page;
@property(nonatomic,copy) NSString  *uid;
@property(nonatomic,copy) NSString  *tags;
@property(nonatomic,assign)NSString  *keywords;
@end
