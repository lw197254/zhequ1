//
//  AdModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/6/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
///广告模型
@interface AdModel : FatherModel
//adId = 2;
//begintime = "2017-05-10 16:04:18";
//delay = 4;
//endtime = "2017-07-07 16:04:21";
//img = "http://cdn.img.checheng.com/upload/20170527/1495865173565429.png";
//title = "\U6e7f\U54d2\U54d21";
//url = "http://www.baidu.com";
///广告id
@property(nonatomic,copy)NSString*adId;
///广告活动开始时间
@property(nonatomic,copy)NSString*begintime;
///广告活动结束时间
@property(nonatomic,copy)NSString*endtime;
///图片
@property(nonatomic,copy)NSString*img;
///延时时间
@property(nonatomic,assign)double delay;
///提示title
@property(nonatomic,copy)NSString*title;
///跳转url
@property(nonatomic,copy)NSString*url;
@end
