//
//  CompareBodySize.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "CompareBodySizeChild.h"
@protocol CompareBodySize
@end
@interface CompareBodySize : FatherModel
@property(nonatomic,copy)NSString *value;
@property(nonatomic,copy)NSArray<CompareBodySizeChild> *confs;
@end
