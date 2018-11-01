//
//  AreaNewModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/5/15.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "AreaNewModel.h"

@implementation AreaNewModel
+(instancetype)shareInstanceSelectedInstance{
    static AreaNewModel*instance;
   static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        
        NSString*path =[NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/%@",classNameFromClass([self class])];
        NSDictionary*dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
        instance = [[AreaNewModel alloc]initWithDictionary:dict error:nil];
        if (!instance) {
            instance = [[AreaNewModel alloc]init];
            instance.id =   @"110100";
            instance.name = @"北京";

        }
    });
    return instance;
}
///保存到文件
-(void)saveToFile{
    NSDictionary*dict = [self getAllPropertiesAndValues];
   NSString*path =[NSHomeDirectory() stringByAppendingFormat:@"/Library/Caches/%@",classNameFromClass([self class])];
    [dict writeToFile:path atomically:YES ];
    
}

//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    NSArray*array =[[UserModel shareInstance] getAllProperties];
//    for (NSString*properity in array) {
//       
//        id proPertyValue = [[UserModel shareInstance] valueForKey:properity];
//         [aCoder encodeObject:proPertyValue forKey:properity];
//        
//    }
//
//    
//  
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        NSArray*array =[[UserModel shareInstance] getAllProperties];
//        for (NSString*properity in array) {
//            
//           
//         id value =   [aDecoder decodeObjectForKey:properity];
//            [self setValue:value forKey:properity];
//        }
//
//        
//      
//    }
//    return self;
//}
//-(void)saveToArchiver{
//    NSMutableData *data = [[NSMutableData alloc] init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    
//    [archiver encodeObject:self forKey:classNameFromClass([self class])]; // archivingDate的encodeWithCoder
//   /// 方法被调用
//    [archiver finishEncoding];
//    //写入文件
//    [data writeToFile:self.archivingFilePath atomically:YES];
//}
-(void)mergeFromModel:(AreaNewModel*)model{
   NSDictionary*dict = [model getAllPropertiesAndValues];
    [self mergeFromDictionary:dict useKeyMapping:YES];
}
#pragma mark - NSCoping
@end
