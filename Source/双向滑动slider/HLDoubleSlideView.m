//
//  HLDoubleSlideView.m
//  DriveUserProject
//
//  Created by sd on 16/3/16.
//  Copyright © 2016年 CJ. All rights reserved.
//

#import "HLDoubleSlideView.h"
#import "UIView+Add.h"
#define viewHeight 40
#define buttonWidth 40
#define buttonHeight 40
#define buttonImageWidth 20


@interface HLDoubleSlideView ()<UIGestureRecognizerDelegate>

//@property(nonatomic,strong)UIImageView *leftImageView;
//@property(nonatomic,strong)UIImageView *rightImageView;
//@property(nonatomic,strong)UILabel *leftLabel;
//@property(nonatomic,strong)UILabel *rightLabel;

@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;

@property(nonatomic,assign)CGFloat leftBtnOrgx;
@property(nonatomic,assign)CGFloat rightBtnOrgx;
@property(nonatomic,assign)CGFloat scrollWidth;
@end

@implementation HLDoubleSlideView

-(id)init
{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}
- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupUI];
    // Initialization code
}
-(CGFloat)scrollWidth{
    return self.bounds.size.width - buttonWidth;
}
-(void)setupUI
{
    
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftBtn setImage:[UIImage imageNamed:@"doubleSlider"] forState:UIControlStateNormal];
    _leftBtn.backgroundColor = [UIColor clearColor];
    _leftBtn.frame = CGRectMake(0,(viewHeight-buttonHeight)/2, buttonWidth,buttonHeight);
//    _leftBtn.backgroundColor = [UIColor clearColor];
//    _leftBtn.layer.cornerRadius = 10;
    [self addSubview:_leftBtn];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    panGesture.delegate = self;
    [_leftBtn addGestureRecognizer:panGesture];
    
//    _leftImageView.centerX = _leftBtn.centerX;
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.backgroundColor = [UIColor clearColor];
     [_rightBtn setImage:[UIImage imageNamed:@"doubleSlider"] forState:UIControlStateNormal];
    
    
//    _rightBtn.backgroundColor = [UIColor clearColor];
    _rightBtn.frame = CGRectMake(self.bounds.size.width-buttonWidth+buttonImageWidth, (viewHeight-buttonHeight)/2, buttonWidth, buttonHeight);
//    _rightBtn.layer.cornerRadius = 10;
    panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    panGesture.delegate = self;
    [_rightBtn addGestureRecognizer:panGesture];
//    _rightImageView.centerX = _rightBtn.centerX;


    [self addSubview:_rightBtn];
    self.backgroundColor = [UIColor clearColor];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //NSLog(@"doubleView hitTest");
    return [super hitTest:point withEvent:event];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"began");
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   // NSLog(@"move");
    [super touchesMoved:touches withEvent:event];
}


-(void)layoutSubviews
{
    
    CGFloat originX =log2((_currentLeftValue - _minValue)*1.0 / (_maxValue - _minValue)+1) *(self.scrollWidth-buttonImageWidth) ;
    _leftBtn.centerX = originX + buttonWidth/2 ;
    
    if (_currentRightValue >= _minValue) {
        CGFloat originX = log2((_currentRightValue - _minValue)*1.0/ (_maxValue - _minValue) + 1) *(self.scrollWidth) ;
        _rightBtn.centerX = originX+buttonWidth/2;
//_currentRightValue = _minValue + (_maxValue - _minValue) * (pow(2,(_rightBtn.orgX ) / (self.scrollWidth))-1);

    }
    else
    {
        _rightBtn.centerX = self.bounds.size.width - buttonWidth/2;

    }
   
    
//    _leftImageView.centerX = _leftBtn.centerX;
//    _rightImageView.centerX = _rightBtn.centerX;
    if (_block) {
        _block(_currentLeftValue,_currentRightValue);
        
    }
//    if (_block) {
//        _leftLabel.text = _block(_currentLeftValue);
//        _rightLabel.text = _block(_currentRightValue);
//    }
}

-(void)tapGestureAction:(UIPanGestureRecognizer*)panGesture
{
    UIView *vw = panGesture.view;
    
    CGPoint transPoint = [panGesture translationInView:self];
    NSLog(@"x:%lf,y:%lf",transPoint.x,transPoint.y);
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            if ([vw isEqual:_leftBtn])
            {
                [self bringSubviewToFront:self.leftBtn];
                _leftBtnOrgx = _leftBtn.orgX;
                NSLog(@"拖拽左边按钮");
                
            }
            else if([vw isEqual:_rightBtn])
            {
                 [self bringSubviewToFront:self.rightBtn];
                _rightBtnOrgx = _rightBtn.orgX;
                NSLog(@"拖拽右边按钮");
            }

        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
            if ([vw isEqual:_leftBtn])
            {
                
                CGFloat orginX = _leftBtn.orgX;
                _leftBtn.orgX = _leftBtnOrgx + transPoint.x;
                if (_leftBtn.orgX < 0) {
                    _leftBtn.orgX = 0;
                }
                else if(_leftBtn.orgX+buttonImageWidth  >= _rightBtn.orgX)
                {
                    
                    _rightBtn.orgX = _leftBtn.orgX  + buttonImageWidth ;
                    if (_rightBtn.orgX >self.bounds.size.width - buttonWidth) {
                        _rightBtn.orgX = self.bounds.size.width - buttonWidth;
                        _leftBtn.orgX = _rightBtn.orgX - buttonImageWidth   ;
                    }
                }
//                 _leftImageView.centerX = _leftBtn.centerX;
            }
            else if([vw isEqual:_rightBtn])
            {
               
                _rightBtn.orgX = _rightBtnOrgx + transPoint.x;
                if (_rightBtn.orgX >= self.bounds.size.width - buttonWidth) {
                    _rightBtn.orgX = self.bounds.size.width - buttonWidth;
                }
                else if(_rightBtn.orgX <= _leftBtn.orgX + buttonImageWidth )
                {
                    _leftBtn.orgX = _rightBtn.orgX -buttonImageWidth;
                    if (_leftBtn.orgX < 0) {
                        _leftBtn.orgX = 0;
                        _rightBtn.orgX = _leftBtn.orgX +buttonImageWidth  ;
                    }
                    
                }
//                 _rightImageView.centerX = _rightBtn.centerX;
            }
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            
        }
            break;
            
        default:
            break;
    }
    _currentLeftValue = _minValue + (_maxValue - _minValue) * (pow(2,  ( _leftBtn.orgX) / (self.scrollWidth-buttonImageWidth)) -1);
    NSLog(@"%f,%f,%f",_leftBtn.orgX, _leftBtn.orgX / (self.scrollWidth-buttonImageWidth),pow(2, ( _leftBtn.orgX) / (self.scrollWidth-buttonImageWidth) ));
    if (_currentLeftValue ==_maxValue) {
        _currentLeftValue = _maxValue - 1;
    }
    _currentRightValue = _minValue + (_maxValue - _minValue) * (pow(2,(_rightBtn.orgX ) / (self.scrollWidth))-1);
    
    if (_block) {
        _block(_currentLeftValue,_currentRightValue);
        
    }
    if (panGesture.state == UIGestureRecognizerStateEnded&&self.endBlock) {
        self.endBlock();
    }
    
    NSLog(@"leftValue:%ld,rightValue:%ld",_currentLeftValue,_currentRightValue);
    
    [self setNeedsDisplay];
}
-(void)sliderChange:(HLDoubleSlideViewSwitchStrBlock)block{
    if (_block!=block) {
        _block = block;
    }
}
-(void)sliderChange:(HLDoubleSlideViewSwitchStrBlock)block endBlock:(HLDoubleSlideViewTouchEndBlock)endBlock{
    if (_block!=block) {
        _block = block;
    }
    if (self.endBlock!=endBlock) {
        self.endBlock = endBlock;
    }
}
-(void)setCurrentLeftValue:(NSInteger)currentLeftValue
{
  
    


    _currentLeftValue = currentLeftValue;
    CGFloat originX =(self.scrollWidth-buttonImageWidth)*log2((_currentLeftValue - _minValue)/(_maxValue - _minValue) + 1) ;
    _leftBtn.centerX = originX + buttonWidth/2 ;
    [self setNeedsDisplay];
}

-(void)setCurrentRightValue:(NSInteger)currentRightValue
{
    _currentRightValue = currentRightValue;
    
        CGFloat originX =  self.scrollWidth*log2((_currentRightValue - _minValue) / (_maxValue - _minValue)+1) ;
        _rightBtn.centerX = originX+buttonWidth/2;
        //_currentRightValue = _minValue + (_maxValue - _minValue) * (pow(2,(_rightBtn.orgX ) / (self.scrollWidth))-1);
        
   
    [self setNeedsDisplay];

    
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 8);
    [BlackColorECECEC setStroke];
    CGContextMoveToPoint(context, buttonWidth- buttonImageWidth + 5, viewHeight/2);
    CGContextAddLineToPoint(context, self.bounds.size.width- buttonWidth +buttonImageWidth - 5, viewHeight/2);
    CGContextStrokePath(context);
    
    [BlueColorA9C6FF setStroke];
    CGContextMoveToPoint(context, _leftBtn.orgX + buttonWidth/2 , viewHeight/2);
    CGContextAddLineToPoint(context, _rightBtn.orgX +buttonWidth/2 ,viewHeight/2);
    CGContextStrokePath(context);
    
}

@end






















