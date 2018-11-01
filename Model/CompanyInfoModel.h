//
//  CompanyInfoModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "DealerModel.h"
@interface CompanyInfoModel : FatherModel
///":"416",
@property(nonatomic,copy)NSString*id;
///":"南京江北协众汽车销售服务有限公司",
@property(nonatomic,copy)NSString*name;
///":"http://dealer2.autoimg.cn/dealerdfs/g9/M04/8F/65/280x210_0_q87_autohomedealer__wKgH0Fgb6WqAJ_JWAACsiXDFmgI710.jpg",
@property(nonatomic,copy)NSString*pic_url;
////":"南京江北协众",
@property(nonatomic,copy)NSString*shortname;
///":"南京市浦口区泰山汽车4S园沿山东路9-5号",
@property(nonatomic,copy)NSString*address;
///":"025-52209388",
@property(nonatomic,copy)NSString*service_phone;
///":"32.144273",
@property(nonatomic,copy)NSString*lat;
///":"118.705194",
@property(nonatomic,copy)NSString*lon;
///":"售本省",
@property(nonatomic,copy)NSString*orderrange;
///":"1",
@property(nonatomic,assign)CarTypeDetailDealerScope scopestatus;
///":"4s",
@property(nonatomic,copy)NSString*scopename;
///":"....."
@property(nonatomic,copy)NSString*content;
@end
