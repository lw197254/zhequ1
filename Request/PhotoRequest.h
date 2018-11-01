//
//  PhotoRequest.h
//  chechengwang
//
//  Created by 严琪 on 17/1/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface PhotoRequest : FatherRequest
@property(nonatomic,copy)NSString *typeId;
@property(nonatomic,copy)NSString *carId;
@property(nonatomic,copy)NSString *color;
@property(nonatomic,retain)NSString *categoryId;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger limit;
@end
