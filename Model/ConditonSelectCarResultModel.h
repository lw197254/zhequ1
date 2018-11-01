//
//  ConditonSelectCarResultModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/1.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"


@protocol ConditonSelectCarResultModel
@end
@interface ConditonSelectCarResultModel : FatherModel
/////  data.CAR_BRAND_TYPE_ID	string	车系ID
@property(nonatomic,copy)NSString* carSeriesId;
@property(nonatomic,copy)NSString* name;
///data.zhidaoPrice	string	车系指导价 价格区间

@property(nonatomic,copy)NSString*guidePrice;
///data.num	string	车系下符合条件的车型数目
@property(nonatomic,copy)NSString*num;

///data.PIC_URL	string	汽车图片URL
///条件找车的属性
@property(nonatomic,copy)NSString* id;
@property(nonatomic,copy)NSString*pic_url;
@end
