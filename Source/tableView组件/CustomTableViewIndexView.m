//
//  CustomTableViewIndexView.m
//  12123
//
//  Created by 刘伟 on 2016/11/25.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "CustomTableViewIndexView.h"

@interface CustomTableViewIndexView()
@property(nonatomic,copy) CustomTableViewIndexViewSelectBlock selectBlock;

@property(nonatomic,strong)NSArray* titleArray;
@property(nonatomic,strong)NSMutableArray* titleLabelArray;
@property(nonatomic,strong)UILabel*label;


@property(nonatomic,assign)CGFloat labelFontHeight;
@property(nonatomic,assign)BOOL isHightLighted;
@end

@implementation CustomTableViewIndexView
-(void)reloadViewWithArray:(NSArray<NSString *> *)titleArray select:(CustomTableViewIndexViewSelectBlock)select{
    self.titleArray = titleArray;
//    if (!(self.titleArray.count > 0)) {
//        return;
//    }
    
    // 利用EnumerateSequence遍历可以获得带index的元组
    if (!self.titleLabelArray) {
        self.titleLabelArray = [[NSMutableArray alloc]init];
    }
    if (!self.label) {
        self.label = [Tool createLabelWithTitle:@""];
        if(self.textColor){
            self.label.textColor = self.textColor;
        }else{
            self.label.textColor = BlueColor447FF5;
        }
        self.label.font = FontOfSize(12);
        NSDictionary *attributes = @{NSFontAttributeName:self.label.font};
        CGSize textSize = [@"热" boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
        self.labelFontHeight = textSize.height;
        self.label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.layer.cornerRadius = 7;
        self.label.layer.masksToBounds = YES;
        [self addSubview:self.label];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(textSize.width+5);
            make.left.equalTo(self);
            make.right.equalTo(self).with.offset(-5);
            make.centerY.equalTo(self);
            make.height.lessThanOrEqualTo(self);
        }];
        self.label.numberOfLines = 0;
    }
    if(self.titleArray.count == 0){
        self.label.text = @"";
    }
    [self.titleArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
            if (idx!=0) {
                self.label.text = [NSString stringWithFormat:@"%@\n%@",self.label.text,obj];
            }else{
                self.label.text = obj;
            }
 
    }];
    
   
    if (_selectBlock!=select) {
        _selectBlock = select;
    }
    
}
-(void)layoutSubviews{
//    [super layoutSubviews];
    NSLog(@"%f",self.label.frame.size.height);
   
    NSInteger m = (NSInteger)((self.frame.size.height/self.labelFontHeight +1)/2);
    NSInteger n = m-1;
    NSInteger k;
    if (n<0) {
        k = 1;
    }else{
        k = ((NSInteger)self.titleArray.count -m)/n +(((NSInteger)self.titleArray.count -m)%n==0?0:1);
    }
    if (k<=0) {
        k = 1;
    }
     self.label.text  = @"";
    [self.titleArray enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (k==1) {
            if (idx == 0 ) {
                self.label.text = obj;
            }else{
                self.label.text = [NSString stringWithFormat:@"%@\n%@",self.label.text,obj];
            }
        }else{
            
            if (idx%(k+1) == 0) {
                if (idx == 0 ) {
                    if (self.titleArray.count==1) {
                         self.label.text =  [NSString stringWithFormat:@"%@",obj];
                    }else{
                        self.label.text =  [NSString stringWithFormat:@"%@\n●",obj];
                    }
                }else if(idx == self.titleArray.count-1){
                    self.label.text = [NSString stringWithFormat:@"%@\n%@",self.label.text,obj];
                }else{
                    self.label.text = [NSString stringWithFormat:@"%@\n%@\n●",self.label.text,obj];

                }
//            self.label.text = [NSString stringWithFormat:@"%@",self.label.text,obj];
            }
            
        }
        
    
        
    }];
    
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
       
        float linespace = 0;
   
        if (self.titleArray.count > 1&&k == 1) {
            
          linespace  =  (self.frame.size.height -self.titleArray.count*self.labelFontHeight)/(self.titleArray.count+1);
        }
       
        paragraphStyle.lineSpacing = linespace;// 字体的行间距
        
        paragraphStyle.headIndent = 0;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *attributes = @{
                                     NSFontAttributeName:self.label.font,
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        self.label.attributedText = [[NSAttributedString alloc] initWithString:self.label.text attributes:attributes];

        
    
     NSLog(@"%f",self.label.frame.size.height);
}
-(instancetype)init{
    if (self = [super init]) {
      
//        let indexViewH = (kScreenH - 113) * 0.91
//        // 这样设置Y保证indexview居中显示
//        let indexViewY = ((kScreenH - 113) - indexViewH) * 0.5 + 64
//        let indexView = UIView(frame: CGRect(x: kScreenW - 15, y: indexViewY, width: 10, height: indexViewH))
        UITapGestureRecognizer* touch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(indexViewTap:)];
        [self addGestureRecognizer:touch];
//        UIPanGestureRecognizer*pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
//        [self addGestureRecognizer:pan];
        self.tableViewSectionIndexSelectedView = [[TableViewSectionIndexSelectedView alloc]init];
    }
    return self;
}
-(void)indexViewTap:(UIGestureRecognizer*)gesture{
   
    CGFloat touchY = [gesture locationInView:self.label].y;
    // 利用坐标Y获得一个索引也就是letterLabel在indexview的索引
   
    [self changeWithTouchY:touchY];
}
-(void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches{
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isHightLighted = NO;
   [self.tableViewSectionIndexSelectedView hide];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   self.isHightLighted = YES;
    UITouch*touch = [touches anyObject];
    CGFloat touchY = [touch locationInView:self.label].y;
    [self changeWithTouchY:touchY];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   self.isHightLighted = YES;
    UITouch*touch = [touches anyObject];
    CGFloat touchY = [touch locationInView:self.label].y;
    [self changeWithTouchY:touchY];
   
}
-(void)changeWithTouchY:(CGFloat)touchY{
    if (!(self.titleArray.count > 0)) {
        return;
    }
    NSInteger index =(NSInteger) (touchY / self.label.bounds.size.height * self.titleArray.count);
   
    if (index < 0) {
        index = 0;
    }
    if (index > self.titleArray.count-1) {
        index = self.titleArray.count-1;
    }
     NSString*title = self.titleArray[index];
    if (self.selectBlock) {
        self.selectBlock(title,index);
    }
    [self.tableViewSectionIndexSelectedView showWithTitle:title onView:self.superview];
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isHightLighted = NO;
    [self.tableViewSectionIndexSelectedView hide];
}
-(void)setIsHightLighted:(BOOL)isHightLighted{
    if (_isHightLighted!=isHightLighted) {
        _isHightLighted = isHightLighted;
    }
    if (isHightLighted) {
        self.label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    }else{
        self.label.backgroundColor = [UIColor clearColor];
    }
}
//-(void)pan:(UIPanGestureRecognizer*)gesture{
//    CGFloat touchY = [gesture locationInView:self].y;
//    // 利用坐标Y获得一个索引也就是letterLabel在indexview的索引
//    NSInteger index =(NSInteger) (touchY / self.bounds.size.height * self.titleArray.count);
//    NSString*title = self.titleArray[index];
//    switch (gesture.state) {
//            //%%% just started swiping
//        case UIGestureRecognizerStateBegan:{
//            [self.tableViewSectionIndexSelectedView showWithTitle:title];
//            //            view.originalPoint = self.center;
//            break;
//        };
//            
//        case UIGestureRecognizerStateChanged:{
//            [self.tableViewSectionIndexSelectedView showWithTitle:title];
//                  };
//            
//        case UIGestureRecognizerStateEnded: {
//            //[self.tableViewSectionIndexSelectedView hide];
//            //            [self afterSwipeAction];
//            //            左划偏移量超过20，翻页
//                        
//            break;
//        };
//        case UIGestureRecognizerStatePossible:{
//             [self.tableViewSectionIndexSelectedView hide];
//            //            {
//            //                if (xFromCenter <= 0) {
//            //                    //                向左滑动，等手势结束后再进行操作
//            //                    view.layer.transform =   CATransform3DMakeTranslation(xFromCenter, 0, 0);
//            //                }if (xFromCenter > 0) {
//            //                    //                   向右滑动，马上进行操作
//            //                    //                防止手势不放，将手势关闭后再打开
//            //                    gestureRecognizer.enabled = NO;
//            //                    [self cardSwipedToRight:view];
//            //                    gestureRecognizer.enabled = YES;
//            //                }
//            //                break;
//            //            };
//            
//        }break;
//        case UIGestureRecognizerStateCancelled:{
//             [self.tableViewSectionIndexSelectedView hide];
//            
//        }break;
//        case UIGestureRecognizerStateFailed:{
//             [self.tableViewSectionIndexSelectedView hide];
//            
//        }break;
//    }
//
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
