//
//  PublicPraiseCheXingRequest.h
//  chechengwang
//
//  Created by 严琪 on 17/1/19.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@interface PublicPraiseCheXingRequest : FatherRequest
@property(nonatomic,strong)NSString *chexingId;
@property(nonatomic,strong)NSString *s;
@property(nonatomic,assign)NSInteger page;
@end
