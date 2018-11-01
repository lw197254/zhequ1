//
//  UserModel.m
//  Qumaipiao
//
//  Created by 刘伟 on 15/6/17.
//  Copyright (c) 2015年 江苏十分便民. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
//+(JSONKeyMapper*)keyMapper{
//    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"userId"}];
//}

-(instancetype)init{
    if (self = [super init]) {
        //        _platform = @"0";
    }
    return self;
}
+(instancetype)shareInstance{
    static UserModel*shareInstance;
    static dispatch_once_t pre;
    dispatch_once(&pre, ^{
        shareInstance = [[UserModel alloc]init];
        NSArray*array =[shareInstance getAllProperties];
        for (NSString*properity in array) {
            id value=  [[NSUserDefaults standardUserDefaults]objectForKey:[NSStringFromClass([self class]) stringByAppendingString:properity]];
            if (value) {
                [shareInstance setValue:value forKey:properity];
            }
            
        }
       
        
    });
    return shareInstance;
}
//-(NSDictionary*)getAllPropertiesAndValues{
//    NSMutableDictionary*props = [NSMutableDictionary dictionary];
//    unsigned int outCount;
//    objc_property_t*properties = class_copyPropertyList([self class], &outCount);
//    for (NSInteger i = 0; i < outCount; i++) {
//        objc_property_t prop = properties[i];
//        const char*char_f = property_getName(prop);
//        NSString*propertyName = [NSString stringWithUTF8String:char_f];
//        id proPertyValue = [self valueForKey:propertyName];
//        if (proPertyValue) {
//            [props setObject:proPertyValue forKey:propertyName];
//        }
//    }
//    free(properties);
//    return props;
//}
-(void)mergeFromDictionary:(NSDictionary *)dict useKeyMapping:(BOOL)useKeyMapping{
     [super mergeFromDictionary:dict useKeyMapping:useKeyMapping];
    
   
    if ([self isEqual:[UserModel shareInstance]]) {
        
        [self updateToUserdefault];
    }
    
}

//- (NSArray *)getAllProperties
//{
//    u_int count;
//
//    objc_property_t *properties  =class_copyPropertyList([self class], &count);
//
//    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
//
//    for (int i = 0; i < count ; i++)
//    {
//        const char* propertyName =property_getName(properties[i]);
//        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
//    }
//
//    free(properties);
//
//    return propertiesArray;
//}
-(Gender)sex{
    if (_sex!=GenderMan&&_sex!=GenderWomen) {
        _sex = GenderMan;
    }
    return _sex;
}
+(void)loginOut{
    
    NSArray*array =[[UserModel shareInstance] getAllProperties];
    for (NSString*properity in array) {
        if ([properity isEqualToString:@"mobile"]) {
            continue;
        }
        id proPertyValue = [[UserModel shareInstance] valueForKey:properity];
        if ([proPertyValue isKindOfClass:[NSNumber class]]) {
            [[UserModel shareInstance] setValue:[NSNumber numberWithInteger:0] forKey:properity];
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:0] forKey:[NSStringFromClass([[UserModel shareInstance] class]) stringByAppendingString:properity]];
        }else{
            [[UserModel shareInstance] setValue:nil forKey:properity];
            [[NSUserDefaults standardUserDefaults] setObject:nil forKey:[NSStringFromClass([self class]) stringByAppendingString:properity]];
        }
        
    }
}
-(NSString*)app_user_id{
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return identifierForVendor;
}
@end
