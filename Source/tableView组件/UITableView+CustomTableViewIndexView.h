//
//  UITableView+CustomTableViewIndexView.h
//  chechengwang
//
//  Created by 刘伟 on 2016/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewIndexView.h"
#import "TableViewSectionIndexSelectedView.h"
@interface UITableView (CustomTableViewIndexView)
///没有block则正常跳转，有block，自己重写选中跳转逻辑
-(void)reloadViewWithArray:(NSArray<NSString*>*)titleArray select:(CustomTableViewIndexViewSelectBlock)select ;
@property(nonatomic,strong)UIColor*customIndexViewTextColor;
@property(nonatomic,strong)CustomTableViewIndexView* customIndexView;
@property(nonatomic,strong)TableViewSectionIndexSelectedView*tableViewSectionIndexSelectedView;
@property(nonatomic,assign)UIEdgeInsets customIndexViewEdgeInsets;
//@property(nonatomic,copy)CustomTableViewIndexViewSelectBlock customTableViewIndexViewSelectBlock;
@end
