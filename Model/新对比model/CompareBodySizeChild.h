//
//  CompareBodySizeChild.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
@protocol CompareBodySizeChild
@end
@interface CompareBodySizeChild : FatherModel
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *value;

@property(nonatomic,copy)NSString *confs;

@property(nonatomic,copy)NSString *is_exit;
@end
