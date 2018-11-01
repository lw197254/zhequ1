//
//  MyDynamicRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface MyDynamicRequest : FatherRequest

@property(nonatomic,assign)NSInteger page;

@property(nonatomic,copy)NSString*token;

@property(nonatomic,copy)NSString*uid;

@end
