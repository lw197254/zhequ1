//
//  PicMenuModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/10.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol  PicMenuModel
@end

@interface PicMenuModel : FatherModel

@property(nonatomic,strong)NSString *num;
@property(nonatomic,strong)NSString *category_id;
@property(nonatomic,strong)NSString *category_name;

@end
