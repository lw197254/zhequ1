//
//  VideoModel.m
//  chechengwang
//
//  Created by 严琪 on 2017/12/1.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"description": @"des"
                                                       }];
}

-(CGFloat)despritionHeight{
    CGSize desSize = [self getSizeByString:self.des AndFontSize:14];
    if (desSize.width < kwidth) {
        return desSize.height;
    }else{
        return (desSize.width/kwidth+1)*desSize.height;
    }
}

-(NSString *)picType{
   return  self.picType = @"5";
}

//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font
{

    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:FontOfSize(font)} context:nil].size;
    return size;
}

@end
