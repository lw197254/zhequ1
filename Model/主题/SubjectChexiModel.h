//
//  SubjectChexiModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/14.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "PicModel.h"

@protocol SubjectChexiModel
@end

@interface SubjectChexiModel : FatherModel

@property(nonatomic,copy)NSString *car_brand_type_name;
@property(nonatomic,copy)NSString *car_brand_type_id;
@property(nonatomic,copy)NSString *dealer_series_price;
@property(nonatomic,copy)NSString *car_model_name;

@property(nonatomic,copy)NSString *hot;
@property(nonatomic,copy)NSString *line3str;

@property(nonatomic,copy)PicModel *picture;

@end
