//
//  UserCollectionRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface UserCollectionAddRequest : FatherRequest
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *colId;
@property(nonatomic,copy)NSString *type;
@end
