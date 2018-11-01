//
//  NotificationModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/7/13.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"

@interface NotificationModel : FatherModel

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSArray *message;
@end
