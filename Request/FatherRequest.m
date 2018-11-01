//
//  FatherRequest.m
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/21.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "FatherRequest.h"

@implementation FatherRequest
-(instancetype)init{
    if (self = [super init]) {
        self.hostType = HostTypeWanShengWeiYe;
        self.needLoadingView = YES;
    }
    return self;
}
-(void)loadRequest{
    [super loadRequest];
    self.METHOD = @"POST";
    self.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    
    
//    NSString* urlString = [self.action stringByAppendingFormat:@"&sign=%@&requestTime=%@&merchantID=%@",[FatherRequest sign],[FatherRequest requestTime],[FatherRequest merchantID]];
   
//    [self.params setObject:[FatherRequest requestTime] forKey:@"requestTime"];
//      [self.params setObject:[FatherRequest merchantID] forKey:@"merchantID"];
//     [self.params setObject:[FatherRequest sign] forKey:@"sign"];
    self.PATH = self.action;
       @weakify(self);
    [[  RACObserve(self,requestNeedActive )
    filter:^BOOL(id value) {
        @strongify(self);
        return !self.requestNeedActive;
    }]
   subscribeNext:^(id x) {
       @strongify(self);
       self.startRequest=NO;
      
   }];
    


  }
-(void)setStartRequest:(BOOL)startRequest{
    if (_startRequest!=startRequest) {
        _startRequest = startRequest;
        
    }
    if (startRequest) {
        [self beforeStartRequest];
//        self.output = [NSDictionary dictionaryWithContentsOfFile:self.cacheURL];
//        if (self.output!=nil) {
//            self.state = RequestStateSuccess;
//        }else{
            if (self.needLoadingView) {
                
                [LoadingView shareInstance].isHalfClearColor = self.isHalfClearColor;
                [LoadingView show];
            }
        
        self.requestNeedActive = YES;
//        }
    }
    
    
}
-(void)beforeStartRequest{
    
    self.PATH = [NSString stringWithFormat:@"/%@",self.action];
    switch (self.hostType) {
        case HostTypeWanShengWeiYe:
        {
//            [Action actionConfigHost:Host client:nil codeKey:@"rc" rightCode:0 msgKey:nil];
             self.httpHeaderFields  = [NSDictionary dictionaryWithObjectsAndKeys:[Tool urlHeader] ,@"Wz-Head", nil];
            
            
        }
            break;
        case HostTypeTrain:
        {
            NSString*reqtime =[NSString stringWithFormat:@"%ld", (long)[[NSDate new] timeIntervalSince1970]];
            
           
            NSString*token =  [Tool md5:[NSString stringWithFormat:@"%@%@%@%@",APIuser,APIsource,APIkey,reqtime]];
            
           
//            NSString*urlbottom = [NSString stringWithFormat:@"&user=%@&reqtime=%@&token=%@&source=%@",APIuser,reqtime,token,APIsource];
            NSDictionary*dict = [NSDictionary dictionaryWithObjectsAndKeys:reqtime,@"reqtime",token,@"token",APIuser,@"user",APIsource,@"source", nil];
            [self.params setValuesForKeysWithDictionary:dict];
            
        }
            break;
        default:
            break;
    }
    
    
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
-(NSString*)sign{
    NSDictionary*dict = [self getAllPropertiesAndValues];
    [self.params setValuesForKeysWithDictionary:dict];
    [self.params removeObjectForKey:@"sign"];
        NSMutableArray*keyArray = [[NSMutableArray alloc]initWithArray:[self.params allKeys]];
    
    
        NSArray*newKeyArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(NSString* _Nonnull obj1, NSString*  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        NSString*sign=@"";
        for (NSInteger i = 0; i<newKeyArray.count; i++) {
            NSString*s=@"";
            if (i!=0) {
                s=@"&";
            }
            
            sign = [sign stringByAppendingFormat:@"%@%@=%@",s,newKeyArray[i],self.params[newKeyArray[i]]];
        }
//        sign = [sign stringByAppendingFormat:@"&%@",airplaneKey];
    
        return [Tool md5:sign];



}
+(NSString*)UrlBottom{
    
    
    
    
    
    NSString*reqtime =[NSString stringWithFormat:@"%ld", (long)[[NSDate new] timeIntervalSince1970]];
    
    
    NSString*token =  [Tool md5:[NSString stringWithFormat:@"%@%@%@%@",APIuser,APIsource,APIkey,reqtime]];
    
   
    NSString*urlbottom = [NSString stringWithFormat:@"&user=%@&reqtime=%@&token=%@&source=%@",APIuser,reqtime,token,APIsource];
    return urlbottom;
}



//+(NSString*)signWithDict:(NSDictionary*)dict{
//    NSMutableArray*keyArray = [[NSMutableArray alloc]initWithArray:[dict allKeys]];
//    
//    NSMutableDictionary*newDict = [[NSMutableDictionary alloc]initWithDictionary:dict];
//    [newDict setObject:[FatherRequest requestTime] forKey:@"requestTime"];
//    [newDict setObject:[FatherRequest merchantID] forKey:@"merchantID"];
//    
//    NSArray*newKeyArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(NSString* _Nonnull obj1, NSString*  _Nonnull obj2) {
//        return [obj1 compare:obj2];
//    }];
//    NSString*sign=@"";
//    for (NSInteger i = 0; i<newKeyArray.count; i++) {
//        NSString*s=@"";
//        if (i!=0) {
//            s=@"&";
//        }
//        
//        sign = [sign stringByAppendingFormat:@"%@%@=%@",s,newKeyArray[i],newDict[newKeyArray[i]]];
//    }
//    sign = [sign stringByAppendingFormat:@"&%@",key];
//    NSLog(@"sign---%@      md5sign_____%@",sign,[Tool md5:sign]);
//    return [Tool md5:sign];
//    
//}

+(NSString*)requestTime{
    NSString*reqtime =[NSString stringWithFormat:@"%ld", (long)[[NSDate new] timeIntervalSince1970]];
    
   
    return reqtime;
    
}

-(NSString*)cacheURL{
   
    NSString *cachesDir =[NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/"];
    
    if (self.action.isNotEmpty) {
        NSMutableDictionary*dict = [NSMutableDictionary dictionaryWithDictionary:self.requestParams];
        [dict setObject:self.action forKey:@"action"];
        NSError*error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:kNilOptions
                                                             error:&error];
        
        NSString *bodyOriginal = [[NSString alloc] initWithData:jsonData
                                                       encoding:NSUTF8StringEncoding];
        NSLog(@"_____________%@",bodyOriginal);
        return [cachesDir stringByAppendingString:[Tool md5:bodyOriginal]];
    }else{
        return nil;
    }
    
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

@end
