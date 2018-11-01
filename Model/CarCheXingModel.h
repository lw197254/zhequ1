//
//  CarCheXingModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/10/26.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@protocol CarCheXingModel
@end

@interface CarCheXingModel : FatherModel

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *pic_url;
@property(nonatomic,copy)NSString *sale_state;
@property(nonatomic,copy)NSString *son_type;
@end
