//
//  RegTag.h
//  chechengwang
//
//  Created by 严琪 on 2017/10/20.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol  RegTag
@end
@interface RegTag : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *num;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sentiment_type;


@end
