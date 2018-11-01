//
//  HomelistRequest.h
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"
#import "HomeTagsListModel.h"
#import "TagsListModel.h"

@interface HomelistRequest : FatherRequest
@property (nonatomic,copy)  NSString *tags;
@property (nonatomic,copy) NSString *keywords;
@property (nonatomic,copy) NSString *uid;
@end
