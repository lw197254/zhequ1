//
//  XiHaoSubjectModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/12.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

#import "SubjectChexiModel.h"


@protocol XiHaoSubjectModel
@end
@interface XiHaoSubjectModel : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *zhutiimg;
@property(nonatomic,copy)NSArray<SubjectChexiModel> *chexiitems;
@end
