//
//  CityNewModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/5/15.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "AreaNewModel.h"
@interface CityNewModel : FatherModel
/////":"110000",//code
//@property(nonatomic,strong)NSString *id;
/////":"北京",//名称
//@property(nonatomic,strong)NSString *name;
///":"B",//firstname
@property(nonatomic,strong)NSString *firstletter;
/////":"0",//父级code
//@property(nonatomic,strong)NSString *parent_id;
/////":"beijing",//拼音
//@property(nonatomic,strong)NSString *pinyin;
/////":"1"//1-省 2-市 3-区
//@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSArray<AreaNewModel*> *array;
@end
