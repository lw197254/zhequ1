//
//  DealerColorModel.h
//  chechengwang
//
//  Created by 严琪 on 17/3/9.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
@protocol DealerColorModel
@end
@interface DealerColorModel : FatherModel
@property(nonatomic,strong)NSString *colorid;
@property(nonatomic,strong)NSString *value;
@end
