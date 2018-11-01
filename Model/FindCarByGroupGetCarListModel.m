//
//  FindCarByGroupGetCarListModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/3.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FindCarByGroupGetCarListModel.h"

@implementation FindCarByGroupGetCarListModel
-(NSMutableArray *)success:(NSMutableArray *)originArray
                  newArray:(NSArray *)newArray{
    ///第一页
    if (self.curPage == 1) {
        [originArray removeAllObjects];
        originArray = [NSMutableArray array];
    }
    if([newArray count]>0){
        [originArray addObjectsFromArray:newArray];
    }
    return originArray;
}

@end
