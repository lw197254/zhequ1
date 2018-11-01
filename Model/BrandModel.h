//
//  HotBrandModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol BrandModel
@end
@interface BrandModel : FatherModel
//[id] => 3
//[name] => 丰田
//[pic_url] => http://img.mianfeiapp.net/logo/57bc0a4da855b.jpg
//[first_num] => F
@property(nonatomic,copy)NSString*id;
@property(nonatomic,copy)NSString*url;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*firstChar;
@end
