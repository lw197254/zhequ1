//
//  MyAction.m
//  12123
//
//  Created by 刘伟 on 2016/9/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//




//
//  Action.m
//  article
//
//  Created by EasyIOS on 14-4-8.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "MyAction.h"
#import "RACEXTScope.h"
#import "TMCache.h"
#import "NSString+Base64.h"
#import "NSString+AES128.h"

@interface MyAction()
@property(nonatomic,assign)BOOL cacheEnable;
@property(nonatomic,assign)BOOL dataFromCache;

@property(nonatomic,retain)NSString *HOST_URL;//服务端域名:端口
@property(nonatomic,retain)NSString *CLIENT;//自定义客户端识别
@property(nonatomic,retain)NSString *CODE_KEY;//错误码key,支持路径 如 data/code
@property(nonatomic,assign)NSUInteger RIGHT_CODE;//正确校验码
@property(nonatomic,retain)NSString *MSG_KEY;//消息提示msg,支持路径 如 data/msg
@end
@implementation MyAction

DEF_SINGLETON(MyAction)
+(void)actionConfigHost:(NSString *)host client:(NSString *)client codeKey:(NSString *)codeKey rightCode:(NSInteger)rightCode msgKey:(NSString *)msgKey{
    [MyAction sharedInstance].HOST_URL = host;
    [MyAction sharedInstance].CLIENT = client;
    [MyAction sharedInstance].CODE_KEY = codeKey;
    [MyAction sharedInstance].RIGHT_CODE = rightCode;
    [MyAction sharedInstance].MSG_KEY = msgKey;
}

+(id)Action{
    return [[[self class] alloc] init];
}
- (id)init
{
    self = [super init];
    if(self){
        _cacheEnable = NO;
        _dataFromCache = NO;
    }
    
    return self;
}

- (id)initWithCache
{
    self = [self init];
    _cacheEnable = YES;
    return self;
}

-(void)useCache{
    _cacheEnable = YES;
}

-(void)readFromCache{
    _dataFromCache = YES;
}
-(void)notReadFromCache{
    _dataFromCache = NO;
}

-(NSURLSessionDownloadTask *)Download:(FatherRequest *)msg{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:msg.downloadUrl]];
    if (msg.timeoutInterval != 0) {
        request.timeoutInterval = msg.timeoutInterval;
    }
    if(msg.httpHeaderFields.isNotEmpty){
        [msg.httpHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            [request setValue:value forHTTPHeaderField:key];
        }];
    }
    [self sending:msg];
    @weakify(msg,self);
    
    NSURLSessionDownloadTask *op = [manager downloadTaskWithRequest:request progress:^(NSProgress * downloadProgress) {
        @strongify(msg,self);
        msg.progress = downloadProgress;
        [self progressing:msg];
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [NSURL URLWithString:msg.targetPath];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        @strongify(msg,self);
        msg.error = error;
        [self failed:msg];
    }];
    
    msg.url = op.currentRequest.URL;
    msg.op = op;
    
    [op resume];
    return op;
}


-(NSURLSessionDataTask *) Send:(FatherRequest *)msg
{
    NSString *url = @"";
    NSDictionary *requestParams = nil;
    if(msg.STATICPATH.isNotEmpty){
        url = msg.STATICPATH;
    }else if(msg.SCHEME.isNotEmpty && msg.HOST.isNotEmpty){
        url = [NSString stringWithFormat:@"%@://%@%@",msg.SCHEME,msg.HOST,msg.PATH];
    }else{
        url = [NSString stringWithFormat:@"http://%@%@",[MyAction sharedInstance].HOST_URL,msg.PATH];
    }
    if(msg.appendPathInfo.isNotEmpty){
        url = [url stringByAppendingString:msg.appendPathInfo];
    }else{
        requestParams = msg.requestParams;
    }
    
    //    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:msg.METHOD URLString:url parameters:requestParams error:nil];
    
    
    if(msg.httpHeaderFields.isNotEmpty){
        [msg.httpHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            [request setValue:value forHTTPHeaderField:key];
           
        }];
    }
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    if (msg.timeoutInterval != 0) {
        request.timeoutInterval = msg.timeoutInterval;
    }
//    manager.requestSerializer  = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"]; // 设置content-Type为text/html
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    if (msg.acceptableContentTypes.isNotEmpty) {
        manager.responseSerializer.acceptableContentTypes = msg.acceptableContentTypes;
    }
    
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:msg.requestParams
                                                       options:kNilOptions
                                                         error:nil];
    
    NSString *bodyOriginal = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    //NSString*bodyOriginal = [NSString jsonStringWithDictionary: msg.requestParams];
//    NSString*bodyOriginal = @"{\"Wz-OsVersionCode\":\"21\",\"Wz-Mac\":\"20:82:c0:24:51:d6\"}";
//NSString*bodyOriginal = @"haode";
//    NSData*aa = [bodyOriginal dataUsingEncoding:NSUTF8StringEncoding];
//   aa = [aa AES128DecryptWithKey:APIkey ];
//    NSString *base64EncodedString = [AESCrypt encrypt:bodyOriginal password:APIkey];
    
   NSString*base64EncodedString = [NSString AES128Encrypt:bodyOriginal key:APIkey];
  base64EncodedString =  [base64EncodedString stringByReplacingOccurrencesOfString:@"\r" withString:@""];
  base64EncodedString=  [base64EncodedString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
     base64EncodedString=  [base64EncodedString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//    base64EncodedString = [NSString AES128Convert:base64EncodedString];
        request.HTTPBody =[base64EncodedString dataUsingEncoding:NSUTF8StringEncoding];
    
    [self sending:msg];
    @weakify(msg,self);
    NSURLSessionDataTask *op = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * response, id responseObject, NSError * error) {
        
      
        
        if(!error ){
            NSMutableString*str = [[NSMutableString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
            
//            str =  [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//            str=  [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//            str=  [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//          str = [str stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//            str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            if (!str.isNotEmpty) {
                
                msg.message = @"数据返回为空";
                [self failed:msg];
                return ;

            }
           
            
        NSData*data =  [NSString AES128Decrypt:str WithKey:APIkey];
            if (data.length ==0) {
                
//                [str appendString:@"="];
//                data =  [NSString AES128Decrypt:str WithKey:APIkey];
                msg.message = @"数据返回为空";
                [self failed:msg];
                return ;
            }
            
            NSDictionary*dict =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            msg.output = dict;
            if(msg.output){
                @strongify(msg,self);
                if(_cacheEnable && [self doCheckCode:msg]){
                    [[TMCache sharedCache] setObject:dict forKey:msg.cacheKey block:^(TMCache *cache, NSString *key, id object) {
                        EZLog(@"%@ has cached",url);
                    }];
                }
                [self checkCode:msg];
            }
            else if (error) {
                 @strongify(msg,self);
                msg.error = error;
                [self failed:msg];
                return;
            }
           
        }else{
            @strongify(msg,self);
            msg.error = error;
            [self failed:msg];
        }
    }];
    
    msg.url = op.currentRequest.URL;
    msg.op = op;
    NSData*data =  op.currentRequest.HTTPBody;
    
        NSLog(@"httpHead_____%@\nhttpBody______%@",msg.url,[[NSMutableString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    msg.output = [[TMCache sharedCache] objectForKey:msg.cacheKey];
    if (_dataFromCache == YES && msg.output !=nil) {
        [[GCDQueue mainQueue] queueBlock:^{
            [self checkCode:msg];
        } afterDelay:0.1f];
    }
    [op resume];
    return op;
}

-(NSURLSessionDataTask *)Upload:(FatherRequest *)msg{
    NSString *url = @"";
    NSDictionary *requestParams = nil;
    if(msg.STATICPATH.isNotEmpty){
        url = msg.STATICPATH;
    }else if(msg.SCHEME.isNotEmpty && msg.HOST.isNotEmpty){
        url = [NSString stringWithFormat:@"%@://%@%@",msg.SCHEME,msg.HOST,msg.PATH];
    }else{
        url = [NSString stringWithFormat:@"http://%@%@",[MyAction sharedInstance].HOST_URL,msg.PATH];
    }
    if(msg.appendPathInfo.isNotEmpty){
        url = [url stringByAppendingString:msg.appendPathInfo];
    }else{
        requestParams = msg.requestParams;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
    
    [self sending:msg];
    NSDictionary *file = msg.requestFiles;
    //NSData*formData =
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:requestParams constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [file enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
            if([obj isKindOfClass:[NSURL class]]){
                [formData appendPartWithFileURL:obj name:key error:nil];
            }else if([obj isKindOfClass:[NSData class]]){
                [formData appendPartWithFormData:obj name:key];
            }else if([obj isKindOfClass:[NSString class]]){
                [formData appendPartWithFileURL:[NSURL fileURLWithPath:obj] name:key error:nil];
            }
        }];
        
    } error:nil];
    
    if(msg.httpHeaderFields.isNotEmpty){
        [msg.httpHeaderFields enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            [request setValue:value forHTTPHeaderField:key];
        }];
    }
    if (msg.timeoutInterval != 0) {
        request.timeoutInterval = msg.timeoutInterval;
    }
    
    
    
    @weakify(msg,self);
    
    
    NSURLSessionDataTask *op = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * uploadProgress) {
        msg.progress = uploadProgress;
        [self progressing:msg];
    } completionHandler:^(NSURLResponse * response, NSDictionary*responseObject, NSError * error) {
        @strongify(msg,self);
        if (error == nil) {
            msg.output = responseObject;
            [self checkCode:msg];
        }else{
            msg.error = error;
            [self failed:msg];
        }
    }];
    
    
    
    msg.url = op.currentRequest.URL;
    msg.op = op;
    
    [op resume];
    return op;
}

-(void)checkCode:(FatherRequest *)msg{
    if([self doCheckCode:msg]){
        [self success:msg];
    }else{
        [self error:msg];
    }
}

-(BOOL)doCheckCode:(FatherRequest *)msg{
    if (msg.needCheckCode) {
        msg.codeKey = [msg.output objectAtPath:[MyAction sharedInstance].CODE_KEY];
        if([msg.output objectAtPath:[MyAction sharedInstance].CODE_KEY] && [[msg.output objectAtPath:[MyAction sharedInstance].CODE_KEY] intValue] == [MyAction sharedInstance].RIGHT_CODE){
            return true;
        }else{
            return false;
        }
    }else{
        return true;
    }
}

-(void)sending:(FatherRequest *)msg{
    msg.state = RequestStateSending;
    if([self.aDelegaete respondsToSelector:@selector(handleActionMsg:)]){
        [self.aDelegaete handleActionMsg:msg];
    }
}

- (void)success:(FatherRequest *)msg{
    msg.message = [msg.output objectAtPath:[MyAction sharedInstance].MSG_KEY]?:@"";
    msg.state = RequestStateSuccess;
    if([self.aDelegaete respondsToSelector:@selector(handleActionMsg:)]){
        [self.aDelegaete handleActionMsg:msg];
    }
}


- (void)failed:(FatherRequest *)msg{
    if(msg.error.userInfo!= nil && [msg.error.userInfo objectForKey:@"NSLocalizedDescription"]){
        msg.message = [msg.error.userInfo objectForKey:@"NSLocalizedDescription"];
    }
    msg.state = RequestStateFailed;
    if (msg.error.code == -1001) {
        msg.isTimeout = YES;
    }
    
    //    NSLog(@"aaaaFailed:%@",msg.error);
    if([self.aDelegaete respondsToSelector:@selector(handleActionMsg:)]){
        [self.aDelegaete handleActionMsg:msg];
        NSData*data = msg.error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSString*errorDateString =[[NSMutableString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"errorData——————————————————:%@",errorDateString);
    }else{
        NSLog(@"cancel");
    }
}

- (void)error:(FatherRequest *)msg{
    if([msg.output objectAtPath:[MyAction sharedInstance].MSG_KEY]){
        msg.message = [msg.output objectAtPath:[MyAction sharedInstance].MSG_KEY];
        NSLog(@"Error:%@",msg.message);
    }
    msg.state = RequestStateError;
    if([self.aDelegaete respondsToSelector:@selector(handleActionMsg:)]){
        [self.aDelegaete handleActionMsg:msg];
    }
}

-(void)progressing:(FatherRequest *)msg{
    if([self.aDelegaete respondsToSelector:@selector(handleProgressMsg:)]){
        [self.aDelegaete handleProgressMsg:msg];
    }
}

@end


