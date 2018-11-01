//
//  HomeMenuModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "MenuModel.h"

@protocol HomeMenuModel
@end

@interface HomeMenuModel : FatherModel

@property(nonatomic,strong)NSArray<MenuModel> *menu;
@end
