//
//  DealerListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/5.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "DealerListModel.h"

@implementation DealerListModel
-(NSMutableArray *)success:(NSMutableArray *)originArray
                  newArray:(NSArray *)newArray{
    ///第一页
    if (self.currentPage == 1) {
        if (originArray) {
            [originArray removeAllObjects];
        }else{
             originArray = [NSMutableArray array];
        }
        
       
    }
    if([newArray count]>0){
        [originArray addObjectsFromArray:newArray];
    }
    return originArray;
}


+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"count": @"page_count"
                                                       }];
}


@end
