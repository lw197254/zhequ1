//
//  KouBeiContentModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiContentModel

@end
@interface KouBeiContentModel : FatherModel
@property(nonatomic,strong)NSString *cate_menu;
@property(nonatomic,strong)NSString *cate_content;
@end
