//
//  HTHorizontalSelectionList.m
//  Hightower
//
//  Created by Erik Ackermann on 7/31/14.
//  Copyright (c) 2014 Hightower Inc. All rights reserved.
//

#import "HTHorizontalSelectionList.h"
#import "HTHorizontalSelectionListScrollView.h"
#import "HTHorizontalSelectionButton.h"

@interface HTHorizontalSelectionList ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIView *selectionIndicatorBar;

@property (nonatomic, strong) NSLayoutConstraint *centerXSelectionIndicatorConstraint, *widthSelectionIndicatorConstraint;

@property (nonatomic, strong) UIView *bottomTrim;
///右边表示还有栏目的遮盖图，🈶️栏目就灰色，没有栏目就透明
@property (nonatomic, strong) UIImageView *rightMaskView;

@property (nonatomic, strong) NSMutableDictionary *buttonColorsByState;

@end

#define kHTHorizontalSelectionListHorizontalMargin 10
#define kHTHorizontalSelectionListInternalPadding 15

#define kHTHorizontalSelectionListSelectionIndicatorHeight 3

#define kHTHorizontalSelectionListTrimHeight 1

@implementation HTHorizontalSelectionList

-(void)awakeFromNib{
    [super awakeFromNib];
    [self configUI];
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configUI];
        
    }
    return self;
}

-(void)configUI{
    
    self.isShowColorRight = NO;
    
    _scrollView = [[HTHorizontalSelectionListScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor clearColor];
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    _scrollView.canCancelContentTouches = YES;
    _scrollView.delegate = self;
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    _scrollView.delaysContentTouches = NO;
    
    [self addSubview:_scrollView];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_scrollView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_scrollView)]];
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:_contentView];
 
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_contentView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_contentView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_contentView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_contentView]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_contentView)]];
    
    

    
    
    _bottomTrim = [[UIView alloc] init];
    _bottomTrim.backgroundColor = BlackColorE3E3E3;
    _bottomTrim.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_bottomTrim];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_bottomTrim]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:nil
                                                                   views:NSDictionaryOfVariableBindings(_bottomTrim)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomTrim(height)]|"
                                                                 options:NSLayoutFormatDirectionLeadingToTrailing
                                                                 metrics:@{@"height" : @(lineHeight)}
                                                                   views:NSDictionaryOfVariableBindings(_bottomTrim)]];
    
    self.buttonInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    self.selectionIndicatorStyle = HTHorizontalSelectionIndicatorStyleBottomBar;
    
    _buttons = [NSMutableArray array];
    
    
    self.selectionIndicatorBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.selectionIndicatorBar.backgroundColor = [UIColor blackColor];
    
    _buttonColorsByState = [NSMutableDictionary dictionary];
    _buttonColorsByState[@(UIControlStateNormal)] = [UIColor blackColor];
    

    
}

- (void)layoutSubviews {
    if (!self.buttons.count) {
        [self reloadData];
    }
    
    [super layoutSubviews];
    [self scrollViewDidScroll:self.scrollView];
  }

#pragma mark - Custom Getters and Setters

- (void)setSelectedButtonIndex:(NSInteger)selectedButtonIndex {
    if (!self.buttons.count) {
        [self reloadData];
    }
    ///如果不先进行reloadData，self。buttons 可能为空，产生崩溃
    [self setSelectedButtonIndex:selectedButtonIndex animated:NO];
}

- (void)setSelectionIndicatorColor:(UIColor *)selectionIndicatorColor {
    self.selectionIndicatorBar.backgroundColor = selectionIndicatorColor;
    
    if (!self.buttonColorsByState[@(UIControlStateSelected)]) {
        self.buttonColorsByState[@(UIControlStateSelected)] = selectionIndicatorColor;
    }
}
-(UIView*)selectionIndicatorBar{
    if (!_selectionIndicatorBar) {
        _selectionIndicatorBar = [[UIView alloc] init];
    }
    return _selectionIndicatorBar;
}
- (UIColor *)selectionIndicatorColor {
    return self.selectionIndicatorBar.backgroundColor;
}

- (void)setBottomTrimColor:(UIColor *)bottomTrimColor {
    self.bottomTrim.backgroundColor = bottomTrimColor;
}

- (UIColor *)bottomTrimColor {
    return self.bottomTrim.backgroundColor;
}

- (void)setBottomTrimHidden:(BOOL)bottomTrimHidden {
    self.bottomTrim.hidden = bottomTrimHidden;
}

- (BOOL)bottomTrimHidden {
    return self.bottomTrim.hidden;
}
//-(void)setSelectionIndicatorBarHidden:(BOOL)selectionIndicatorBarHidden{
//    if (_selectionIndicatorBarHidden!=selectionIndicatorBarHidden) {
//        _selectionIndicatorBarHidden = selectionIndicatorBarHidden;
//        
//    }
//    self.selectionIndicatorBar.hidden = selectionIndicatorBarHidden;
//    
//}
#pragma mark - Public Methods

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    self.buttonColorsByState[@(state)] = color;
}


- (void)reloadData {
    
   CGFloat lastOffSetX = self.scrollView.contentOffset.x;
    for (UIButton *button in self.buttons) {
        [button removeFromSuperview];
    }
    
    [self.selectionIndicatorBar removeFromSuperview];
    [self.buttons removeAllObjects];
    
    NSInteger totalButtons = [self.dataSource numberOfItemsInSelectionList:self];
    
    if (totalButtons < 1) {
        return;
    }
    
    if (_selectedButtonIndex > totalButtons - 1) {
        _selectedButtonIndex = -1;
    }
    
    UIButton *previousButton;
    
    CGFloat width;
    if (self.maxShowCount==0) {
        width = 0;
    }else{
        if (totalButtons >self.maxShowCount) {
            width = (kwidth-self.leftSpace-self.rightSpace)/self.maxShowCount;
        }else{
            if (totalButtons!=0) {
                width = (kwidth-self.leftSpace-self.rightSpace)/totalButtons;
            }else{
                width = 0;
            }
            
        }

    }
    CGFloat maxWidth;
    if (self.minShowCount==0||totalButtons==0) {
        maxWidth = (kwidth-self.leftSpace-self.rightSpace);
    }else{
        if (totalButtons < self.minShowCount) {
            maxWidth = (kwidth-self.leftSpace-self.rightSpace)/totalButtons;
        }else{
            
                maxWidth = (kwidth-self.leftSpace-self.rightSpace)/self.minShowCount;
            
        }
        
    }

        for (NSInteger index = 0; index < totalButtons; index++) {
        UIButton *button;
        
        if ([self.dataSource respondsToSelector:@selector(selectionList:viewForItemWithIndex:)]) {
            UIView *buttonView = [self.dataSource selectionList:self viewForItemWithIndex:index];
            
            button = [self selectionListButtonWithView:buttonView];
   
            [self.contentView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView).with.offset(self.topSpace);
                 make.bottom.equalTo(self.contentView).with.offset(-self.bottomSpace);
               
            }];
            

//            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topInset-[button]-bottomInset-|"
//                                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
//                                                                                     metrics:@{@"topInset" : @(self.buttonInsets.top),
//                                                                                               @"bottomInset" : @(self.buttonInsets.bottom)}
//                                                                                       views:NSDictionaryOfVariableBindings(button)]];
            
        } else if ([self.dataSource respondsToSelector:@selector(selectionList:titleForItemWithIndex:)]) {
            NSString *buttonTitle = [self.dataSource selectionList:self titleForItemWithIndex:index];
            
            button = [self selectionListButtonWithTitle:buttonTitle];
            
            if (self.isShowColorRight && self.isShowColorRightCount == index) {
                
                self.redUiView = [[UIView alloc]init];
                [button addSubview:self.redUiView];
                
                [self.redUiView setBackgroundColor:[UIColor redColor]];
                
                [self.redUiView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(button);
                    make.right.equalTo(button);
                    make.width.height.mas_equalTo(8);
                }];
                self.redUiView.layer.cornerRadius = 4;
            }
            
        
            [self.contentView addSubview:button];

        } else {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:button];
        }
        
        if (self.selectionIndicatorStyle == HTHorizontalSelectionIndicatorStyleButtonBorder) {
            button.layer.borderWidth = 1.0;
            button.layer.cornerRadius = 3.0;
            button.layer.borderColor = [UIColor clearColor].CGColor;
            button.layer.masksToBounds = YES;
        }
        
        if (previousButton) {
            
            [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:previousButton attribute:NSLayoutAttributeTrailing multiplier:1 constant:self.seperateSpace]];
            
            
            
            //            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[previousButton(==button)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousButton,button)]];
            //            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[previousButton]-padding-[button]"
            //                                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
            //                                                                                     metrics:@{@"padding" : @(0)}
            //                                                                                       views:NSDictionaryOfVariableBindings(previousButton, button)]];
            //            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[previousButton]-padding-[button]"
            //                                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
            //                                                                                     metrics:@{@"padding" : @(kHTHorizontalSelectionListInternalPadding)}
            //                                                                                       views:NSDictionaryOfVariableBindings(previousButton, button)]];
        } else {
            [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:_leftSpace]];
            //            [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[button]"
            //                                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
            //                                                                                     metrics:@{@"margin" : @(0)}
            //                                                                                       views:NSDictionaryOfVariableBindings(button)]];
        }
            if (width!=0) {
//                [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width]];
                [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width]];
                
            }
            NSLayoutConstraint*contraint =[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:maxWidth];
            contraint.priority = 249;
             [self.contentView addConstraint:contraint];

        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        //        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:button
        //                                                                     attribute:NSLayoutAttributeCenterY
        //                                                                     relatedBy:NSLayoutRelationEqual
        //                                                                        toItem:self.contentView
        //                                                                     attribute:NSLayoutAttributeCenterY
        //                                                                    multiplier:1.0
        //                                                                      constant:0.0]];
        
        previousButton = button;
        
        [self.buttons addObject:button];
    }
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:previousButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-self.rightSpace]];
   
    
    if (totalButtons > 0 && _selectedButtonIndex >= 0 && _selectedButtonIndex < totalButtons) {
        UIButton *selectedButton = self.buttons[self.selectedButtonIndex];
        selectedButton.selected = YES;
        
        switch (self.selectionIndicatorStyle) {
            case HTHorizontalSelectionIndicatorStyleBottomBar: {
                [self.contentView addSubview:self.selectionIndicatorBar];
                
                [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_selectionIndicatorBar(height)]|"
                                                                                         options:NSLayoutFormatDirectionLeadingToTrailing
                                                                                         metrics:@{@"height" : @(kHTHorizontalSelectionListSelectionIndicatorHeight)}
                                                                                           views:NSDictionaryOfVariableBindings(_selectionIndicatorBar)]];
                
                [self alignSelectionIndicatorWithButton:selectedButton];
                break;
            }
                
            case HTHorizontalSelectionIndicatorStyleButtonBorder: {
                selectedButton.layer.borderColor = self.selectionIndicatorColor.CGColor;
                break;
            }
                
            default:
                break;
        }
    }
    
    [self sendSubviewToBack:self.bottomTrim];
//    更新约束
    [self updateConstraintsIfNeeded];
    ///更新界面并且判断右边是否需要显示遮盖图
    [self layoutIfNeeded];
    
    CGFloat scrollX = self.scrollView.contentSize.width - self.scrollView.frame.size.width;
    if (scrollX < 0) {
         [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else{
        if (lastOffSetX < scrollX) {
            [self.scrollView setContentOffset:CGPointMake(lastOffSetX, 0) animated:YES];
        }else{
            [self.scrollView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
        }

    }
       lastOffSetX = self.scrollView.contentOffset.x;
    [self scrollViewDidScroll:self.scrollView];
    NSLog(@"____offsetX%f",self.scrollView.contentOffset.x);
}

- (void)setSelectedButtonIndex:(NSInteger)selectedButtonIndex animated:(BOOL)animated {
    
    NSInteger buttonCount = [self.dataSource numberOfItemsInSelectionList:self];
    
    NSInteger oldSelectedIndex = _selectedButtonIndex;
    UIButton *oldSelectedButton;
    if (oldSelectedIndex < buttonCount && oldSelectedIndex >= 0) {
        if (oldSelectedIndex < self.buttons.count) {
            oldSelectedButton = self.buttons[oldSelectedIndex];
            oldSelectedButton.selected = NO;
        }
    }
    
    if (selectedButtonIndex < buttonCount && selectedButtonIndex >= 0) {
        _selectedButtonIndex = selectedButtonIndex;
    } else {
        _selectedButtonIndex = -1;
    }
    
    UIButton *selectedButton;
    
    if (_selectedButtonIndex != -1) {
        if (_selectedButtonIndex < self.buttons.count) {
            selectedButton = self.buttons[_selectedButtonIndex];
            selectedButton.selected = YES;
        }
    }
    
    [self layoutIfNeeded];
    [UIView animateWithDuration:animated ? 0.4 : 0.0
                          delay:0
         usingSpringWithDamping:0.5
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self setupSelectedButton:selectedButton oldSelectedButton:oldSelectedButton];
                     }
                     completion:nil];
    if (selectedButtonIndex==0||selectedButtonIndex==self.buttons.count-1) {
        [self.scrollView scrollRectToVisible:CGRectInset(selectedButton.frame, -kHTHorizontalSelectionListHorizontalMargin, 0)
                                    animated:animated];
    }else{
        UIButton*leftButton = self.buttons[selectedButtonIndex-1];
        UIButton*rightButton = self.buttons[selectedButtonIndex+1];
        CGRect frame = CGRectMake(leftButton.frame.origin.x, leftButton.frame.origin.y, rightButton.frame.origin.x+rightButton.frame.size.width-leftButton.frame.origin.x, rightButton.frame.origin.y+rightButton.frame.size.height-leftButton.frame.origin.y);
        [self.scrollView scrollRectToVisible:CGRectInset(frame, -kHTHorizontalSelectionListHorizontalMargin, 0)
                                animated:animated];
    }
    
}

#pragma mark - Private Methods

- (UIButton *)selectionListButtonWithTitle:(NSString *)buttonTitle {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentEdgeInsets = self.buttonInsets;
    
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    
    for (NSNumber *controlState in [self.buttonColorsByState allKeys]) {
        [button setTitleColor:self.buttonColorsByState[controlState] forState:controlState.integerValue];
    }
    
    
    if (self.titleFont) {
       button.titleLabel.font = self.titleFont;
    }else{
        button.titleLabel.font = FontOfSize(14);
    }
    [button setBackgroundColor:[UIColor clearColor]];
//    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    [button sizeToFit];
    
    [button addTarget:self
               action:@selector(buttonWasTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    return button;
}

- (UIButton *)selectionListButtonWithView:(UIView *)buttonView {
    HTHorizontalSelectionButton*button = [HTHorizontalSelectionButton buttonWithType:UIButtonTypeCustom];
   
     button.contentView = buttonView;
   button.contentView.userInteractionEnabled = self.contentViewUserInteractionEnabled;
    
//    buttonView.translatesAutoresizingMaskIntoConstraints = NO;
//    buttonView.userInteractionEnabled = NO;
//    [buttonView layoutIfNeeded];
////    CGFloat aspectRatio = buttonView.frame.size.height/buttonView.frame.size.width;
//    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(button);
//    }];
//    [buttonView addConstraint:[NSLayoutConstraint constraintWithItem:buttonView
//                                                           attribute:NSLayoutAttributeHeight
//                                                           relatedBy:NSLayoutRelationEqual
//                                                              toItem:buttonView
//                                                           attribute:NSLayoutAttributeWidth
//                                                          multiplier:aspectRatio
//                                                            constant:0.0]];
//    
//    [button addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[buttonView]|"
//                                                                   options:NSLayoutFormatDirectionLeadingToTrailing
//                                                                   metrics:nil
//                                                                     views:NSDictionaryOfVariableBindings(buttonView)]];
//    
//    [button addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[buttonView]|"
//                                                                   options:NSLayoutFormatDirectionLeadingToTrailing
//                                                                   metrics:nil
//                                                                     views:NSDictionaryOfVariableBindings(buttonView)]];
    
    [button addTarget:self
               action:@selector(buttonWasTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    return button;
}

- (void)setupSelectedButton:(UIButton *)selectedButton oldSelectedButton:(UIButton *)oldSelectedButton {
    switch (self.selectionIndicatorStyle) {
        case HTHorizontalSelectionIndicatorStyleBottomBar: {
            [self.contentView removeConstraint:self.centerXSelectionIndicatorConstraint];
            [self.contentView removeConstraint:self.widthSelectionIndicatorConstraint];
            
            [self alignSelectionIndicatorWithButton:selectedButton];
            [self layoutIfNeeded];
            break;
        }
            
        case HTHorizontalSelectionIndicatorStyleButtonBorder: {
            selectedButton.layer.borderColor = self.selectionIndicatorColor.CGColor;
            oldSelectedButton.layer.borderColor = [UIColor clearColor].CGColor;
            break;
        }
            
        case HTHorizontalSelectionIndicatorStyleNone: {
            selectedButton.layer.borderColor = [UIColor clearColor].CGColor;
            oldSelectedButton.layer.borderColor = [UIColor clearColor].CGColor;

        }
    }
}

- (void)alignSelectionIndicatorWithButton:(UIButton *)button {
    if (!button) {
        return;
    }
    if ([button isKindOfClass:[HTHorizontalSelectionButton class]]) {
        self.centerXSelectionIndicatorConstraint = [NSLayoutConstraint constraintWithItem:self.selectionIndicatorBar
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:button
                                                                             attribute:NSLayoutAttributeLeft
                                                                            multiplier:1.0
                                                                              constant:0.0];
        
        
        self.widthSelectionIndicatorConstraint = [NSLayoutConstraint constraintWithItem:self.selectionIndicatorBar
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:((HTHorizontalSelectionButton*)button).contentView
                                                                              attribute:NSLayoutAttributeWidth
                                                                             multiplier:1.0
                                                                               constant:0.0];
        
    }else{
        CGSize size = [button.titleLabel systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
        
        self.centerXSelectionIndicatorConstraint = [NSLayoutConstraint constraintWithItem:self.selectionIndicatorBar
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:button
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1.0
                                                                              constant:0.0];
        
        
        self.widthSelectionIndicatorConstraint = [NSLayoutConstraint constraintWithItem:self.selectionIndicatorBar
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:size.width];
    }
   
    [self.contentView addConstraint:self.centerXSelectionIndicatorConstraint];
    [self.contentView addConstraint:self.widthSelectionIndicatorConstraint];
}

#pragma mark - Action Handlers

- (void)buttonWasTapped:(id)sender {
    NSInteger index = [self.buttons indexOfObject:sender];
    if (index != NSNotFound) {
        if (index == self.selectedButtonIndex) {
            if (self.selectionIndicatorStyle == HTHorizontalSelectionIndicatorStyleNone) {
                if ([self.delegate respondsToSelector:@selector(selectionList:didSelectButtonWithIndex:)]) {
                    [self.delegate selectionList:self didSelectButtonWithIndex:index];
                }
            }
            
            return;
        }
        
        [self setSelectedButtonIndex:index animated:YES];
       
        if ([self.delegate respondsToSelector:@selector(selectionList:didSelectButtonWithIndex:)]) {
            [self.delegate selectionList:self didSelectButtonWithIndex:index];
        }
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%f____%f______%f",scrollView.contentSize.width-scrollView.frame.size.width-scrollView.contentOffset.x,scrollView.contentSize.width-scrollView.frame.size.width,scrollView.contentOffset.x);
    if (self.showRightMaskView==YES) {
        if ( scrollView.contentSize.width-scrollView.frame.size.width-scrollView.contentOffset.x <=0.1) {
            self.rightMaskView.hidden = YES;
        }else{
            self.rightMaskView.hidden = NO;
        }

    }else{
        self.rightMaskView.hidden = YES;
    }
    
}

-(UIImageView *)searchImageView{
    if (!_searchImageView) {
        
        self.searchView = [[UIView alloc] init];
        [self.searchView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.searchView];
        
        _searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索大"]];
        [_searchImageView setBackgroundColor:[UIColor whiteColor]];
        [self insertSubview:_searchImageView aboveSubview:self.searchView];
        [self.searchView setUserInteractionEnabled:YES];

        
        [_searchImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.mas_right).with.offset(-15);
            make.width.mas_equalTo(25);
        }];
        
        [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(_searchImageView.mas_left);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        self.rightMaskView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rightmaskImage"]];
        [self addSubview:self.rightMaskView];
        [self.rightMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.right.equalTo(_searchImageView.mas_left);
            make.bottom.equalTo(self).with.offset(0);
        }];
        
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0,_searchImageView.frame.size.width+15);
        
    }
    return _searchImageView;
}
@end
