//
//  BSNumbersCollectionCell.m
//  BSNumbersSample
//
//  Created by 张亚东 on 16/4/6.
//  Copyright © 2016年 blurryssky. All rights reserved.
//

#import "BSNumbersCollectionCell.h"

@interface BSNumbersCollectionCell ()

@property (strong ,nonatomic) CAShapeLayer *HseparatorLayer;
@property (strong ,nonatomic) CAShapeLayer *VseparatorLayer;

- (void)setup;
- (void)updateFrame;

@end

@implementation BSNumbersCollectionCell

#pragma mark - Override
- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    if (self.seperateLineHidden) {
//        self.HseparatorLayer.path = nil;
//        self.VseparatorLayer.path = nil;
//    }else{
        [self updateFrame];
//    }
    
}

#pragma mark - Private
- (void)setup {
    
    [self.layer addSublayer:self.HseparatorLayer];
    [self.layer addSublayer:self.VseparatorLayer];
}

- (void)updateFrame {
//    self.label.frame = CGRectMake(self.horizontalMargin,
//                                  0,
//                                  self.bounds.size.width - 2 * self.horizontalMargin,
//                                  self.bounds.size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height-lineHeight/2)];
    
    [path addLineToPoint:CGPointMake(self.bounds.size.width - lineHeight, self.bounds.size.height-lineHeight/2)];
//    [path moveToPoint:CGPointMake(self.bounds.size.width - 1, 0)];
//    [path addLineToPoint:CGPointMake(self.bounds.size.width - 1, self.bounds.size.height)];
 
    self.HseparatorLayer.path = path.CGPath;
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
//    [path1 moveToPoint:CGPointMake(0, 0)];
//    
//    [path1 addLineToPoint:CGPointMake(self.bounds.size.width - 1, 0)];
    [path1 moveToPoint:CGPointMake(self.bounds.size.width - lineHeight/2, 0)];
    [path1 addLineToPoint:CGPointMake(self.bounds.size.width - lineHeight/2, self.bounds.size.height)];
    
    self.VseparatorLayer.path = path1.CGPath;
}

#pragma mark - Setter
- (void)setHorizontalMargin:(CGFloat)horizontalMargin {
    _horizontalMargin = horizontalMargin;
    
    [self updateFrame];
}

#pragma mark - Getter
-(CAShapeLayer*)VseparatorLayer{
    if (!_VseparatorLayer) {
        _VseparatorLayer = [CAShapeLayer layer];
        _VseparatorLayer.strokeColor = BlackColorCCCCCC.CGColor;
        _VseparatorLayer.lineWidth = lineHeight;
    }
    return _VseparatorLayer;
}
-(CAShapeLayer*)HseparatorLayer{
    if (!_HseparatorLayer) {
        _HseparatorLayer = [CAShapeLayer layer];
        _HseparatorLayer.strokeColor = BlackColorCCCCCC.CGColor;
        _HseparatorLayer.lineWidth = lineHeight;
    }
    return _HseparatorLayer;
}
//- (CAShapeLayer *)separatorLayer {
//    if (!_separatorLayer) {
//        _separatorLayer = [CAShapeLayer layer];
//        _separatorLayer.strokeColor = [UIColor redColor].CGColor;
//        _separatorLayer.lineHeight = 1;
//    }
//    return _separatorLayer;
//}

@end
