//
//  InfoContentModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@protocol  InfoContentModel
@end

@interface InfoContentModel : FatherModel

@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *value;
@property(nonatomic,strong) NSString *high;
@property(nonatomic,strong) NSString *width;

//富文本 
@property(nonatomic,strong) NSAttributedString *valueString;
@end
