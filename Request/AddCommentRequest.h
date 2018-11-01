//
//  AddCommentRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/21.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface AddCommentRequest : FatherRequest

@property(nonatomic, copy)NSString *pid;
@property(nonatomic, copy)NSString *uid;
@property(nonatomic, copy)NSString *aid;
@property(nonatomic, copy)NSString *content;
@property(nonatomic, copy)NSString *type;
@end
