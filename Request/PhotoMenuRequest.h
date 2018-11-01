//
//  PhotoMenuRequest.h
//  chechengwang
//
//  Created by 严琪 on 17/1/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface PhotoMenuRequest : FatherRequest
@property(nonatomic,strong)NSString *typeId;
@property(nonatomic,strong)NSString *carId;
@property(nonatomic,strong)NSString *color;
@end
