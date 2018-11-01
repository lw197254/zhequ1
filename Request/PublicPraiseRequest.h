//
//  PublicPraiseRequest.h
//  chechengwang
//
//  Created by 严琪 on 17/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface PublicPraiseRequest : FatherRequest
@property(nonatomic,strong)NSString *chexiId;
@property(nonatomic,strong)NSString *s;
@property(nonatomic,assign)NSInteger page;

@end
