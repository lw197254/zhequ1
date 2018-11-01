//
//  KouBeiDetailContentModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/12.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiDetailContentModel

@end
@interface KouBeiDetailContentModel : FatherModel
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *category_name;
@end
