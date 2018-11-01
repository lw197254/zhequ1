//
//  ReadRecordModel.h
//  chechengwang
//
//  Created by 严琪 on 2017/4/20.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

@interface ReadRecordModel : FatherModel

@property(nonatomic,strong)NSString *id;

//备用 车系id

@property(nonatomic,strong)NSString *carid;

//备用 车型id
@property(nonatomic,strong)NSString *carTypeid;



@end
