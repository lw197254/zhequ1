//
//  CarTypeDetailDealerModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/5.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol CarTypeDetailDealerModel
@end
typedef NS_ENUM(NSInteger,CarTypeDetailDealerScope){
    ///全部
    CarTypeDetailDealerScopeAll = 0,
     ///4s店
    CarTypeDetailDealerScope4s = 1,
    ///综合店
    CarTypeDetailDealerScopeUnix = 2
};
@interface CarTypeDetailDealerModel : FatherModel
@property(nonatomic,copy)NSString*dealer_id;///] => 7333
@property(nonatomic,copy)NSString*dealer_name;///] => 南京协奥汽车销售服务有限公司
@property(nonatomic,copy)NSString*price;///] => 45.65
@property(nonatomic,copy)NSString*address;///] => 南京市江宁区汤山街道122省道西侧
@property(nonatomic,copy)NSString*phone;///] => 4009305581
@property(nonatomic,assign)float lat;/// = "32.024716";
@property(nonatomic,assign)float lon; ///= "119.077554";
@property(nonatomic,assign)CarTypeDetailDealerScope scope;///] => 1    // 1.4s店 2.综合店
///":7766
@property(nonatomic,copy)NSString*distance;
@end
