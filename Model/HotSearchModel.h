//
//  HotSearchModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "SearchSugestionModel.h"

@protocol HotSearchModel
@end
@interface HotSearchModel : FatherModel
///":3,
@property(nonatomic,assign)SearchType type;
///":"2213",
@property(nonatomic,copy)NSString*id;
///":"宝马X1",
@property(nonatomic,copy)NSString*name;
@end
