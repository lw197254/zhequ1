//
//  SubjectAuthorModel.h
//  chechengwang
//
//  Created by 严琪 on 17/4/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

///database 3.0 对象方法舍弃
@protocol SubjectAuthorModel

@end

@interface SubjectAuthorModel : FatherModel
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *pic;
@property(nonatomic,strong)NSString *name;
@end
