//
//  KouBeiPicModel.h
//  chechengwang
//
//  Created by 严琪 on 17/1/11.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol KouBeiPicModel

@end
@interface KouBeiPicModel : FatherModel

@property(nonatomic,strong) NSString *id;
@property(nonatomic,strong) NSString *pic_url;
// 17/6/5
/// smallpic
@property(nonatomic,strong) NSString *smallPic;
/// bigpic
@property(nonatomic,strong) NSString *bigPic;
@end
