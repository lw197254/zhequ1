//
//  DealerModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/5.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "DealerTheMainModel.h"
#import "CarTypeDetailDealerModel.h"
@protocol DealerModel
@end
@interface DealerModel : FatherModel
@property(nonatomic,copy)NSString*id;///] => 311   {经销商id}
@property(nonatomic,copy)NSString*name;///] => 北京运通兴恩汽车销售服务有限公司 {经销商名}
@property(nonatomic,copy)NSString*pic_url;///] => http://dealer2.autoimg.cn/dealerdfs/g22/M01/7F/98/280x210_0_q87_autohomedealer__wKgFW1dWddSASEmMAAIzb3UzQoY765.jpg
@property(nonatomic,copy)NSString*address;///] => 北京市大兴区西红门镇中鼎路11号
@property(nonatomic,copy)NSString*price;
////[id] => 1
//[name] => 大众
@property(nonatomic,strong)DealerTheMainModel*the_main;


///":"南京江北协众",
@property(nonatomic,copy)NSString*shortname;
///":"025-52209388",
@property(nonatomic,copy)NSString*service_phone;
///":"32.144273",
@property(nonatomic,copy)NSString*lat;
////":"118.705194",
@property(nonatomic,copy)NSString*lon;
///":"售本省",
@property(nonatomic,copy)NSString*orderrange;
///":"1",
@property(nonatomic,assign)CarTypeDetailDealerScope scopestatus;
///":"4s",
@property(nonatomic,copy)NSString*scopename;
///":"大众"
@property(nonatomic,copy)NSString*mainbrand;
//	string	距离
@property(nonatomic,copy)NSString*distance;
/// 主营品牌图片
@property(nonatomic,copy)NSString*brandpic;

@end
