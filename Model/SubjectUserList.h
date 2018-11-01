//
//  SubjectUserList.h
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "SubjectUserModel.h"

@interface SubjectUserList : FatherModel
@property(nonatomic,strong)NSArray<SubjectUserModel> *data;
@end
