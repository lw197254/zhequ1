//
//  DealerListModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/1/5.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"
#import "DealerModel.h"

@protocol DealerListModel
@end
@interface DealerListModel : FatherModel

@property(nonatomic,assign)NSInteger page_count;
@property(nonatomic,strong)NSArray<DealerModel>*list;
@property(nonatomic,assign)NSInteger currentPage;
-(NSMutableArray *)success:(NSMutableArray *)originArray
                  newArray:(NSArray *)newArray;
@end
