//
//  TagsListModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/11.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "TagsListModel.h"

#define hot @"1"
#define car @"2"

@implementation TagsListModel

-(void)sethotandcar{
    [self.data enumerateObjectsUsingBlock:^(TagsModel*obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.type isEqualToString:hot]) {
            [self.hotdata addObject:obj];
        }else if([obj.type isEqualToString:car]){
            [self.cardata addObject:obj];
        }
    }];
}

-(NSMutableArray<TagsModel> *)userdata{
    if (!_userdata) {
        _userdata = [NSMutableArray arrayWithCapacity:1];
    }
    return _userdata;
}

-(NSMutableArray<TagsModel> *)hotdata{
    if (!_hotdata) {
        _hotdata = [NSMutableArray arrayWithCapacity:1];
    }
    return _hotdata;
}


-(NSMutableArray<TagsModel> *)cardata{
    if (!_cardata) {
        _cardata = [NSMutableArray arrayWithCapacity:1];
    }
    return _cardata;
}

@end
