//
//  FindCarCondtionModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/6/29.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FindCarCondtionModel.h"

@implementation FindCarCondtionModel

-(NSString *)parentLevel{
    if ([_parentLevel isEqualToString:@"zws"]) {
        self.type = CondtionTypeZuowei;
        return  @"座位数";
    }else if ([_parentLevel isEqualToString:@"shushi"]) {
        self.type = CondtionTypeShushi;
        return  @"舒适度";
    }else{
        return _parentLevel;
    }
}

@end
