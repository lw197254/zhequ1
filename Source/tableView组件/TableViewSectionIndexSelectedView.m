//
//  TableViewSectionIndexSelectedView.m
//  12123
//
//  Created by 刘伟 on 2016/11/24.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "TableViewSectionIndexSelectedView.h"

@implementation TableViewSectionIndexSelectedView
{
    UILabel*_label;
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    if (self = [super init]) {
        
       
        self.backgroundColor = [UIColor clearColor];
        UIImageView*imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"字母背景色"]];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _label = [Tool createLabelWithTitle:@""];
        _label.font = FontOfSize(60);
        _label.textColor = BlueColor447FF5;
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).with.offset(10);
//            make.right.equalTo(self).with.offset(-10);
            
            make.centerX.centerY.equalTo(self);
            
        }];
        
    }
    return self;
}
-(void)showWithTitle:(NSString*)title onView:(UIView*)view{
    _label.text = title;
   
    
    if (self.superview !=view) {
        [view addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(view);
//            make.height.equalTo(self.mas_width);
//            make.width.mas_equalTo(100);
        }];
    }
    self.alpha = 1;
//    [UIView animateWithDuration:0.5 animations:^{
//        self.alpha = 0;
//    }];
    
}
-(void)hide{
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0;
        }];
}
@end
