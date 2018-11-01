//
//  CommiteModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/18.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@protocol CommiteModel
@end

@interface CommiteModel : FatherModel

@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *pid;
@property(nonatomic,copy) NSString *aid;
@property(nonatomic,copy) NSString *reuid;
@property(nonatomic,copy) NSString *relate;
@property(nonatomic,copy) NSString *content;
@property(nonatomic,copy) NSString *recontent;
@property(nonatomic,copy) NSString *addtime;
@property(nonatomic,copy) NSString *status;
@property(nonatomic,assign) NSInteger maxnum;
@property(nonatomic,copy) NSString *username;
@property(nonatomic,copy) NSString *reusername;
@property(nonatomic,copy) NSString *formataddtime;


@property(nonatomic,copy) NSString *head;
@property(nonatomic,copy) NSString *rehead;
@property(nonatomic,copy) NSString *position;

@property(nonatomic,copy) NSString *type;

@end
