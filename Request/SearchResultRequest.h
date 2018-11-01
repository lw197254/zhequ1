//
//  SearchResultRequest.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface SearchResultRequest : FatherRequest
//参数	类型	说明
///	string	搜索关键字，必填
@property(nonatomic,copy)NSString* keywords;
///string	记录数，默认为10
@property(nonatomic,assign)NSInteger limit;
@end
