//
//  CommiteListRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/18.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface CommiteListRequest : FatherRequest
@property(nonatomic,copy)NSString *aid;
@property(nonatomic,assign)NSInteger page;
@end
