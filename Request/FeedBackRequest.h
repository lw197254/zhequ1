//
//  FeedBackRequest.h
//  chechengwang
//
//  Created by 严琪 on 17/2/22.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface FeedBackRequest : FatherRequest

@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *contact;
@property(nonatomic,strong)NSString *name;

@end
