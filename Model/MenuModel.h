//
//  MenuModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol  MenuModel
@end

@interface MenuModel : FatherModel
@property(nonatomic,copy) NSString *typename;
@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *catdir;

@end
