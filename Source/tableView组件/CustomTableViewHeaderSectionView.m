//
//  CustomTableViewHeaderSectionView.m
//  chechengwang
//
//  Created by 刘伟 on 2016/12/23.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "CustomTableViewHeaderSectionView.h"

@implementation CustomTableViewHeaderSectionView

{
    CustomTableViewHeaderSectionViewClickedBlock _block;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self creatUI];
    }
    return self;
}


-(void)setTitle:(NSString *)title subTitle:(NSString *)subTitle section:(NSInteger)section SelectedBlock:(CustomTableViewHeaderSectionViewClickedBlock)block{
    if (title.isNotEmpty) {
        _titleLabel.text = title;
    }else{
        _titleLabel.text = @"";
    }
    if (subTitle.isNotEmpty) {
        _subTitleLabel.text = subTitle;
    }else{
        _subTitleLabel.text = @"";
    }
    self.section = section;
    if (_block!=block) {
        _block = block;
    }
    
}

-(void)selfClicked:(UIGestureRecognizer*)ges{
    if(_block){
        _block(self.section);
    }
}
- (void)creatUI {
    
    UITapGestureRecognizer*tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selfClicked:)];
    [self addGestureRecognizer:tap];
    self.textLabel.hidden = YES;
    self.detailTextLabel.text = @"";
    _titleLabel.textColor = BlackColor999999;
    //    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = FontOfSize(12);
    self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.top.bottom.equalTo(self.contentView);
    }];
    //副标题
    _subTitleLabel = [[UILabel alloc] init];
    _subTitleLabel.font = FontOfSize(12);
    
    [self.contentView addSubview:_subTitleLabel];
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-10);
        make.top.bottom.equalTo(self.contentView);
    }];
    //线
    _middleLine = [Tool createLine];
    [self.contentView addSubview:_middleLine];
    [_middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(lineHeight);
        make.left.equalTo(_titleLabel.mas_right).with.offset(2);
        make.centerY.equalTo(_titleLabel);
    }];
    _topLine = [Tool createLine];
    [self.contentView addSubview:_topLine];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(lineHeight);
        
    }];
    
    _bottomLine = [Tool createLine];
    [self.contentView addSubview:_bottomLine];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.mas_equalTo(lineHeight);
        
    }];
}
@end
