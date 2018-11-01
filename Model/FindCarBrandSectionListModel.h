//
//  FindCarBrandSectionListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/29.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "BrandModel.h"
@protocol FindCarBrandSectionListModel
@end
@interface FindCarBrandSectionListModel : FatherModel
@property(nonatomic,strong)NSArray<BrandModel*>*array;
@property(nonatomic,copy)NSString*firstChar;
@end
