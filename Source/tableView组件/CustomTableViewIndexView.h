//
//  CustomTableViewIndexView.h
//  12123
//
//  Created by 刘伟 on 2016/11/25.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CustomTableViewIndexViewSelectBlock)(NSString* title,NSInteger index);
#import "TableViewSectionIndexSelectedView.h"
@interface CustomTableViewIndexView : UIView
@property(nonatomic,strong)TableViewSectionIndexSelectedView*tableViewSectionIndexSelectedView;
@property(nonatomic,strong)UIColor*textColor;
-(void)reloadViewWithArray:(NSArray<NSString*>*)titleArray select:(CustomTableViewIndexViewSelectBlock)select ;
@end
