//
//  UMSAgentInfo.h
//  cobub
//
//  Created by 严琪 on 2017/7/10.
//  Copyright © 2017年 严琪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UMSAgentInfo : NSObject
///ClientData
+ (NSMutableArray *)getArchiveClientData:(NSString*)appKey;
///ActivityData
+ (NSMutableArray *)getArchiveActivityLog;
+ (NSString *)getArchiveActivityLogString:(NSString*)appKey;

@end
