//
//  ShareModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/6/12.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShareModel
@end

@interface ShareModel : NSObject

///类型
@property(nonatomic,copy)NSString *tag;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *imageName;

@end
