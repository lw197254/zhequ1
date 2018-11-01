//
//  MyDynamicModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/8/24.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@protocol MyDynamicModel

@end

@interface MyDynamicModel : FatherModel


@property(nonatomic,copy)NSString*msg_id;

@property(nonatomic,copy)NSString*token;

@property(nonatomic,copy)NSString*type;

@property(nonatomic,copy)NSString*sended;

@property(nonatomic,copy)NSString*viewed;

@property(nonatomic,copy)NSString*addtime;

@property(nonatomic,copy)NSString*title;

@property(nonatomic,copy)NSString*content;

@property(nonatomic,copy)NSString*btype;

@property(nonatomic,copy)NSString*art_id;

@property(nonatomic,copy)NSString*url;

@end
