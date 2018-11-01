//
//  HorizontalScrollViewCell.m
//  12123
//
//  Created by 刘伟 on 2016/9/22.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "HorizontalScrollViewCell.h"

@implementation HorizontalScrollViewCell
-(UIImageView*)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode =  UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return _imageView;
}

-(UILabel*)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        
//        _bgBanner = [[UIImageView alloc]init];
//        [self.contentView addSubview:_bgBanner];
//        [self.contentView sendSubviewToBack:_bgBanner];
//        [_bgBanner mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(self);
//            make.bottom.equalTo(_imageView.mas_bottom);
//        }];
//        _bgBanner.image = [UIImage imageNamed:@"bg_banner"];

        
//        _bgBanner = [[UIImageView alloc]init];
//        [self.contentView addSubview:_bgBanner];
//        [_bgBanner mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(self);
//            make.bottom.equalTo(_imageView.mas_bottom);
//        }];
        
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.bottom.equalTo(_imageView.mas_bottom).offset(-10);
        }];
        _title.font =FontOfSize(12);
        _title.textColor = [UIColor whiteColor];
        _title.numberOfLines = 1;

    }
    return _title;
}

-(UIImageView*)bgBanner{
    if (!_bgBanner) {
        _bgBanner = [[UIImageView alloc]init];
        [self.contentView addSubview:_bgBanner];
        [self.contentView sendSubviewToBack:_bgBanner];
        [_bgBanner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(_imageView.mas_bottom);
        }];
        _bgBanner.image = [UIImage imageNamed:@"bg_banner"];
    }
    return _bgBanner;
}

@end
