//
//  HTHorizontalSelectionButton.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/23.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "HTHorizontalSelectionButton.h"

@implementation HTHorizontalSelectionButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setContentView:(UIView *)contentView{
    
    
    if (_contentView!=contentView) {
       
       
        if (_contentView) {
            [_contentView removeFromSuperview];
        }
         _contentView = contentView;
        
       
        
       
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.centerY.equalTo(self);
            make.edges.equalTo(self);
            // make.height.lessThanOrEqualTo(self);
            //make.width.lessThanOrEqualTo(self);
        }];

      
    }
}
@end
