//
//  BannerModel.h
//  chechengwang
//
//  Created by 严琪 on 16/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
typedef NS_ENUM(NSInteger,BannerModelJumpType){
    ///跳转文章
    BannerModelJumpTypeArticle = 1,
    ///跳转外链

     BannerModelJumpTypeUrlWithCity = 2,
    ///跳转外链无城市
    BannerModelJumpTypeUrlWithOutCity = 3,

};
@protocol BannerModel

@end

///banner的对象
@interface BannerModel : FatherModel

@property(nonatomic,copy) NSString *id;
@property(nonatomic,copy) NSString *title;
///图片地址
@property(nonatomic,copy) NSString *thumb;
@property(nonatomic,copy) NSString *inputtime;
@property(nonatomic,copy) NSString *click;


@property(nonatomic,assign) BannerModelJumpType type;

@property(nonatomic,copy) NSString*adurl ;
@end
