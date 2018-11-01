//
//  NewCarForSaleModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/30.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
typedef NS_ENUM(NSInteger,NewCarForSaleType){
    //已上市
    NewCarForSaleTypeOnsale = 1,
     ///即将上市
    NewCarForSaleTypeWillSale = 2
};
@protocol NewCarForSaleModel
@end
@interface NewCarForSaleModel : FatherModel
///] => 1770492
@property(nonatomic,copy)NSString*id;

////] => 2017-06-26
@property(nonatomic,copy)NSString*listTime;
///] => 06月26日
@property(nonatomic,copy)NSString*formattime;

///] => 奥迪Q7
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,copy)NSString*price;
/// => 2
@property(nonatomic,assign)NewCarForSaleType type;


@end
