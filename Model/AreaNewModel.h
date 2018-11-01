//
//  AreaNewModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/5/15.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol AreaNewModel
@end
@interface AreaNewModel : FatherModel
///":"110000",//code
@property(nonatomic,copy)NSString *id;
///":"北京",//名称
@property(nonatomic,copy)NSString *name;
///":"B",//firstname
@property(nonatomic,copy)NSString *firstletter;
///":"0",//父级code
@property(nonatomic,copy)NSString *parent_id;
///":"beijing",//拼音
@property(nonatomic,copy)NSString *pinyin;
///":"1"//1-省 2-市 3-区
@property(nonatomic,copy)NSString *type;
///单例，被选中的单例
+(instancetype)shareInstanceSelectedInstance;
///保存到文件
-(void)saveToFile;
-(void)mergeFromModel:(AreaNewModel*)model;
@end
