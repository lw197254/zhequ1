//
//  AuthorModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/4/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol AuthorModel
@end
@interface AuthorModel : FatherModel
@property(nonatomic,copy)NSString* imgurl;
@property(nonatomic,copy)NSString* id;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* ename;

@end
