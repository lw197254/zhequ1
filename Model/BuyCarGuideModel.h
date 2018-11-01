//
//  BuyCarGuideModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/12/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "PicModel.h"
#import "HomeModel.h"
@protocol BuyCarGuideModel
@end

@interface BuyCarGuideModel : FatherModel

@property(nonatomic,copy) NSString *artid;
@property(nonatomic,copy) NSString *typeName;
@property(nonatomic,copy) HomeModel *article;
 
@end
