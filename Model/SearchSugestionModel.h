//
//  SearchSugestionModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/27.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

typedef NS_ENUM(NSInteger,SearchType){
    SearchTypeNone = 0,///无类型
    SearchTypeBrand = 1,///品牌
    SearchTypeFactory,///厂商
    SearchTypeCarSearies///车系
};
@protocol SearchSugestionModel
@end
@interface SearchSugestionModel : FatherModel
///":3,
@property(nonatomic,assign)SearchType type;
///":"2213",
@property(nonatomic,copy)NSString*id;
///":"宝马X1",
@property(nonatomic,copy)NSString*name;
///type=品牌 时 返回品牌图标
@property(nonatomic,copy)NSString*picurl;

///需要跳转指定页面 news：资讯页 koubei:口碑页 photo:图片页 param：参配页 price:报价页（app无
@property(nonatomic,copy)NSString*page;
///": "5.48-6.98万",(车系才有的属性)
@property(nonatomic,copy)NSString*price;
@end
