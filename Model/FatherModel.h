//
//  FatherModel.h
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/8.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "Model.h"

@interface FatherModel : Model
-(NSString*)toJSONStringWithOutKeys:(NSArray*)withoutProperties;
-(NSDictionary*)toDictionaryWithOutKeys:(NSArray*)withOutProperties;
-(void)updateToUserdefault;
- (NSArray *)getAllProperties;
-(NSDictionary*)getAllPropertiesAndValues;

@end
