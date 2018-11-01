//
//  Brand.h
//  chechengwang
//
//  Created by 严琪 on 17/3/23.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol  Brand
@end
@interface Brand : FatherModel
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *pic_url;
@end
