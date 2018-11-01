//
//  CompareConfig.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/22.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "CompareBodySize.h"
@protocol CompareConfig
@end

@interface CompareConfig : FatherModel
@property(nonatomic,copy)NSString *config_diff;
@property(nonatomic,copy)CompareBodySize *body_size;
@property(nonatomic,copy)CompareBodySize *dynamic_performance;

@property(nonatomic,copy)CompareBodySize *oil_wear;
@property(nonatomic,copy)CompareBodySize *configuration_difference;
 
@end
