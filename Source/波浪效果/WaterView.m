//
//  WaterView.m
//  WaterWave
//
//  Created by mobi on 16/1/6.
//  Copyright © 2016年 snapking. All rights reserved.
//

#import "WaterView.h"
#define waveAmplitudeDefault 3
@interface WaterView()
{
    UIColor *_waterColor;
   
//    /波浪的最高最低高度差
   CGFloat _waveHeight;
//     ///波浪的一个循环的宽度
//    CGFloat _waveWidth;
//    ///波浪的一个循环需要的时间
//    CGFloat _time;
     CGFloat _waterLineY;
     CGFloat _waterCenterY;
    CGFloat _waveAmplitude;
    CGFloat _waveCycle;
    BOOL increase;
    CADisplayLink *_waveDisplayLink;
}

@end

@implementation WaterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [super awakeFromNib];
    [self configUI];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self configUI];
           }
    return self;
}
-(void)configUI{
    [self setBackgroundColor:[UIColor clearColor]];
    _waveHeight = 30;
//    _time = 1;
//    _waveWidth = kwidth*520.0/720;
    
    _waveAmplitude=waveAmplitudeDefault;
    _waveCycle=5.0;
    increase=NO;
    _waterColor=[UIColor colorWithWhite:1 alpha:0.05];
    _waveHeight =5;
    
    _waterCenterY = 35;
    _waterLineY=_waterCenterY-_waveHeight/2;
    _waveDisplayLink=[CADisplayLink displayLinkWithTarget:self selector:@selector(runWave)];
    [_waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}
-(void)runWave
{
    
    if (increase) {
        _waveAmplitude += 0.04;
    }else{
        _waveAmplitude -= 0.04;
    }
    
    
    if (_waveAmplitude<=2+waveAmplitudeDefault) {
        increase = YES;
    }else{
         increase = NO;
    }
    
  
    
    _waveCycle+=0.03;
    
    [self setNeedsDisplay];
}

//-(NSMutableAttributedString *) formatBatteryLevel:(NSInteger)percent
//{
//    UIColor *textColor=[UIColor redColor];
//    NSMutableAttributedString *attrText;
//    
//    NSString *percentText=[NSString stringWithFormat:@"%ld%%",(long)percent];
//    
//    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragrahStyle setAlignment:NSTextAlignmentCenter];
//    if (percent<10) {
//        attrText=[[NSMutableAttributedString alloc] initWithString:percentText];
//        UIFont *capacityNumberFont=[UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
//        UIFont *capacityPercentFont=[UIFont fontWithName:@"HelveticaNeue-Thin" size:40];
//        [attrText addAttribute:NSFontAttributeName value:capacityNumberFont range:NSMakeRange(0, 1)];
//        [attrText addAttribute:NSFontAttributeName value:capacityPercentFont range:NSMakeRange(1, 1)];
//        [attrText addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, 2)];
//        [attrText  addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, 2)];
//        
//    }
//    else
//    {
//        attrText=[[NSMutableAttributedString alloc] initWithString:percentText];
//        UIFont *capacityNumberFont=[UIFont fontWithName:@"HelveticaNeue-Thin" size:80];
//        UIFont *capacityPercentFont=[UIFont fontWithName:@"HelveticaNeue-Thin" size:40];
//        
//        
//        if (percent>=100) {
//            
//            [attrText addAttribute:NSFontAttributeName value:capacityNumberFont range:NSMakeRange(0, 3)];
//            [attrText addAttribute:NSFontAttributeName value:capacityPercentFont range:NSMakeRange(3, 1)];
//            [attrText addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, 4)];
//            [attrText addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, 4)];
//        }
//        else
//        {
//            [attrText addAttribute:NSFontAttributeName value:capacityNumberFont range:NSMakeRange(0, 2)];
//            [attrText addAttribute:NSFontAttributeName value:capacityPercentFont range:NSMakeRange(2, 1)];
//            [attrText addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, 3)];
//            [attrText  addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, 3)];
//        }
//        
//    }
//    
//    
//    return attrText;
//}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //初始化画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    NSMutableAttributedString *attriButedText=[self formatBatteryLevel:50];
//    CGRect textSize = [attriButedText boundingRectWithSize:CGSizeMake(400, 10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
//    CGPoint textPoint = CGPointMake(kwidth/2-textSize.size.width/2, 70);
//    [attriButedText drawAtPoint:textPoint];
    
    //推入
    CGContextSaveGState(context);
    
    
    //定义前波浪path
    CGMutablePathRef frontPath = CGPathCreateMutable();
    
    //定义后波浪path
    CGMutablePathRef backPath=CGPathCreateMutable();
    
    //定义前波浪反色path
    CGMutablePathRef frontReversePath = CGPathCreateMutable();
    
    //定义后波浪反色path
    CGMutablePathRef backReversePath=CGPathCreateMutable();
    
    //画水
    CGContextSetLineWidth(context, 1);
    
    
    //前波浪位置初始化
    float frontY=_waterLineY;
    CGPathMoveToPoint(frontPath, NULL, 0, frontY);
    
    //前波浪反色位置初始化
    float frontReverseY=_waterLineY;
    CGPathMoveToPoint(frontReversePath, NULL, 0,frontReverseY);
    
    //后波浪位置初始化
    float backY=0;
    CGPathMoveToPoint(backPath, NULL, 0, backY);
    
    //后波浪反色位置初始化
    float backReverseY=_waterLineY;
    CGPathMoveToPoint(backReversePath, NULL, 0, backReverseY);
    
    for(float x=0;x<=kwidth;x++){
        
        //前波浪绘制
        frontY= _waveAmplitude * sin( x/180*M_PI + 5*_waveCycle/M_PI ) * 2 +_waterLineY;
        CGPathAddLineToPoint(frontPath, nil, x, frontY);
        
        //后波浪绘制
        backY= _waveAmplitude * sin( x/180*M_PI + 3*_waveCycle/M_PI+M_PI ) * 2 + _waterLineY;
        CGPathAddLineToPoint(backPath, nil, x, backY);
        
        
//        if (x>=100) {
//            
//            //后波浪反色绘制
//            backReverseY= _waveAmplitude * cos( x/180*M_PI + 4*_waveCycle/M_PI ) * 5 + _waterLineY;
//            CGPathAddLineToPoint(backReversePath, nil, x, backReverseY);
//            
//            //前波浪反色绘制
//            frontReverseY= _waveAmplitude * sin( x/180*M_PI + 4*_waveCycle/M_PI ) * 5 + _waterLineY;
//            CGPathAddLineToPoint(frontReversePath, nil, x, frontReverseY);
//        }
    }
    
    //后波浪绘制
    CGContextSetFillColorWithColor(context, [[UIColor colorWithWhite:1 alpha:0.05] CGColor]);
    CGPathAddLineToPoint(backPath, nil, kwidth, rect.size.height);
    CGPathAddLineToPoint(backPath, nil, 0, rect.size.height);
    CGPathAddLineToPoint(backPath, nil, 0, _waterLineY);
    CGPathCloseSubpath(backPath);
    CGContextAddPath(context, backPath);
    CGContextFillPath(context);
    
    //推入
    CGContextSaveGState(context);
    
    //后波浪反色绘制
    CGPathAddLineToPoint(backReversePath, nil, kwidth, rect.size.height);
    CGPathAddLineToPoint(backReversePath, nil, 100, rect.size.height);
    CGPathAddLineToPoint(backReversePath, nil, 100, _waterLineY);
    
    CGContextAddPath(context, backReversePath);
    CGContextClip(context);
//    [attriButedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attriButedText.length)];
//    [attriButedText drawAtPoint:textPoint];
    
    
    // CGContextSaveGState(context);
    //弹出
    CGContextRestoreGState(context);
    
    //前波浪绘制
    CGContextSetFillColorWithColor(context, [_waterColor CGColor]);
    CGPathAddLineToPoint(frontPath, nil, kwidth, rect.size.height);
    CGPathAddLineToPoint(frontPath, nil, 0, rect.size.height);
    CGPathAddLineToPoint(frontPath, nil, 0, _waterLineY);
    CGPathCloseSubpath(frontPath);
    CGContextAddPath(context, frontPath);
    CGContextFillPath(context);
    
    //推入
    CGContextSaveGState(context);
    
    
    //前波浪反色绘制
    CGPathAddLineToPoint(frontReversePath, nil, kwidth, rect.size.height);
    CGPathAddLineToPoint(frontReversePath, nil, 100, rect.size.height);
    CGPathAddLineToPoint(frontReversePath, nil, 100, _waterLineY);
    
    CGContextAddPath(context, frontReversePath);
    CGContextClip(context);
//    [attriButedText addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attriButedText.length)];
//    [attriButedText drawAtPoint:textPoint];
    
    //推入
    CGContextSaveGState(context);
    
    
    //释放
    CGPathRelease(backPath);
    CGPathRelease(backReversePath);
    CGPathRelease(frontPath);
    CGPathRelease(frontReversePath);
    
}

@end
