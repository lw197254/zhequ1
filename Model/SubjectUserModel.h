//
//  SubjectUserModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/5/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"


@protocol SubjectUserModel

@end

//网络拉取订阅数据
@interface SubjectUserModel : FatherModel

@property(nonatomic,strong)NSString *subId;
@property(nonatomic,strong)NSString *authorId;
@property(nonatomic,strong)NSString *authorName;
@property(nonatomic,strong)NSString *authorEname;
@property(nonatomic,strong)NSString *imgurl;


@end
