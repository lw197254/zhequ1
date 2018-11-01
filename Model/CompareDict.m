//
//  CompareDict.m
//  chechengwang
//
//  Created by 刘伟 on 2017/2/21.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "CompareDict.h"
#import "FindCarByGroupByCarTypeGetCarModel.h"
@interface CompareDict()
@property(nonatomic,strong)NSMutableDictionary*dict;
@property(nonatomic,strong)NSMutableArray<FindCarByGroupByCarTypeGetCarModel*>*array;
@end
@implementation CompareDict
+(instancetype)shareInstance{
   static CompareDict*instance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[CompareDict alloc]init];
       NSArray*array = [FindCarByGroupByCarTypeGetCarModel findAll];
        instance.array = [NSMutableArray<FindCarByGroupByCarTypeGetCarModel*> array];
        [array enumerateObjectsUsingBlock:^(FindCarByGroupByCarTypeGetCarModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [instance.dict setObject:obj forKey:obj.car_id];
            [instance.array insertObject:obj atIndex:0];
        }];
        instance.count = instance.dict.count;
    });
    return instance;
}

-(NSMutableDictionary*)dict{
    if (!_dict) {
        _dict = [[NSMutableDictionary alloc]init];
    }
    return _dict;
}
-(void)setObject:(id)object forKey:(id)key{
    if (object==nil||key==nil) {
        return;
    }
    if (self.dict[key]&&![self.dict[key] isEqual:object] ) {
        [self.dict setObject:object forKey:key];
        [self.array enumerateObjectsUsingBlock:^(FindCarByGroupByCarTypeGetCarModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([key isEqual:obj.car_id ]) {
                [self.array replaceObjectAtIndex:idx withObject:object];
                *stop = YES;
            }
        }];
        
        return;
    }else if(self.dict[key]&&[self.dict[key] isEqual:object]){
        return;
    }else{
         [self.dict setObject:object forKey:key];
        [self.array insertObject:object atIndex:0];
    }
    self.count = self.dict.count;
    
}
-(id)objectForKey:(id)key{
    if (key==nil) {
        return nil;
    }
    return [self.dict objectForKey:key];
    

}
-(void)removreObjectForKey:(id)key{
    if (key==nil) {
        return;
    }
    if (self.dict[key] ==nil) {
        return;
    }else{
        [self.dict removeObjectForKey:key];
        [self.array enumerateObjectsUsingBlock:^(FindCarByGroupByCarTypeGetCarModel* obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.car_id isEqual:key]) {
                [self.array removeObject:obj];
            }
        }];
       
    }

    self.count = self.dict.count;
}
-(NSArray*)allObjects{
    return self.array;
}
@end
