//
//  VideoListRequest.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherRequest.h"

@interface VideoListRequest : FatherRequest

@property(nonatomic,assign) NSInteger page;
@property(nonatomic,copy) NSString* cate;
@end
