//
//  AskForPriceCarTypeModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/6.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol AskForPriceCarTypeModel
@end
@interface AskForPriceCarTypeModel : FatherModel
///":"25902",
@property(nonatomic,copy)NSString*carid;
///":"2016款 Sportback 40 TFSI 豪华型",
@property(nonatomic,copy)NSString*carname;
///1,
@property(nonatomic,copy)NSString*state;
///车系Id
@property(nonatomic,copy)NSString*typeid;




@end
