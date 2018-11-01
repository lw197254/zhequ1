//
//  TagsModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/11.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@protocol TagsModel
@end
@interface TagsModel : FatherModel
/*
 *
 *
 [id] => 11
 [type] => 2
 [name] => 宝马3系
 [car_brand_type_ids] =>
 [orderby] => 2
 [goto] =>
 */
///":3,
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *orderby;
@property(nonatomic,copy)NSString *showintab;
//专题是一串，车系是一个
@property(nonatomic,copy)NSString *car_brand_type_ids;
@end
