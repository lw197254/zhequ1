//
//  FatherModel.m
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/8.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@implementation FatherModel
+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
- (NSArray *)getAllProperties
{
    u_int count;
    
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);
    
    return propertiesArray;
}
-(NSDictionary*)getAllPropertiesAndValues{
    NSMutableDictionary*props = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t*properties = class_copyPropertyList([self class], &outCount);
    for (NSInteger i = 0; i < outCount; i++) {
        objc_property_t prop = properties[i];
        const char*char_f = property_getName(prop);
        NSString*propertyName = [NSString stringWithUTF8String:char_f];
        id proPertyValue = [self valueForKey:propertyName];
        if (proPertyValue) {
            [props setObject:proPertyValue forKey:propertyName];
        }
    }
    free(properties);
    return props;
}

-(void)updateToUserdefault{
    NSDictionary*dict =[self getAllPropertiesAndValues];
    for (NSInteger i = 0;i <dict.allKeys.count ; i++) {
        
        NSString*key = dict.allKeys[i];
        NSString*className = NSStringFromClass([self class]);
        [[NSUserDefaults standardUserDefaults] setObject:dict[key] forKey:[NSString stringWithFormat:@"%@%@",className,key]];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSDictionary*)toDictionaryWithOutKeys:(NSArray*)withOutProperties{
    NSMutableArray*array = [[NSMutableArray alloc]initWithArray:[self getAllProperties]];
    NSMutableArray*newArray = [[NSMutableArray alloc]initWithArray:array];
    for (NSString*property in array) {
        if ([withOutProperties containsObject:property]&&[newArray containsObject:property]) {
            [newArray removeObject:property];
        }
    }
    return [self toDictionaryWithKeys:newArray];
}
-(NSString*)toJSONString{
    return [self toJSONStringWithKeys:[self getAllProperties]];
}
-(NSString*)toJSONStringWithOutKeys:(NSArray*)withoutProperties{
    NSMutableArray*array = [[NSMutableArray alloc]initWithArray:[self getAllProperties]];
    NSMutableArray*newArray = [[NSMutableArray alloc]initWithArray:array];
    for (NSString*property in array) {
        if ([withoutProperties containsObject:property]&&[newArray containsObject:property]) {
            [newArray removeObject:property];
        }
    }
    return [self toJSONStringWithKeys:newArray];
   
}


@end
