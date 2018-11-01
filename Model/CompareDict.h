//
//  CompareDict.h
//  chechengwang
//
//  Created by 刘伟 on 2017/2/21.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompareDict : NSObject


+(instancetype)shareInstance;
-(void)setObject:(id)object forKey:(id)key;
-(id)objectForKey:(id)key;
-(void)removreObjectForKey:(id)key;
-(NSArray*)allObjects;
@property(nonatomic,assign)NSInteger count;
@end
