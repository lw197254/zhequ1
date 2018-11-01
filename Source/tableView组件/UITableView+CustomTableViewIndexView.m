//
//  UITableView+CustomTableViewIndexView.m
//  chechengwang
//
//  Created by 刘伟 on 2016/12/28.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "UITableView+CustomTableViewIndexView.h"
static char*const customIndexViewKey = "customIndexView";
static char*const tableViewSelectedViewKey = "tableViewSelectedViewKey";
static char*const customIndexViewEdgeInsetsKey = "customIndexViewEdgeInsetsKey";
//static char*const customTableViewIndexViewSelectBlockKey = "customTableViewIndexViewSelectBlockKey";
@implementation UITableView (CustomTableViewIndexView)
///没有block则正常跳转，有block，自己重写选中跳转逻辑
-(void)reloadViewWithArray:(NSArray<NSString*>*)titleArray select:(CustomTableViewIndexViewSelectBlock)select{
    [self.customIndexView reloadViewWithArray:titleArray select:^(NSString *title, NSInteger index) {
      
        if (select) {
            select(title,index);
        }else{
            NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
            [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
        }
       
    }];
   
   
}
-(void)setCustomIndexView:(CustomTableViewIndexView *)customIndexView{
    objc_setAssociatedObject(self, customIndexViewKey,customIndexView , OBJC_ASSOCIATION_RETAIN);
}

-(CustomTableViewIndexView*)customIndexView{
    CustomTableViewIndexView*obj = objc_getAssociatedObject(self, customIndexViewKey) ;
    if (!obj) {
        obj = [[CustomTableViewIndexView alloc]init];
        [self.superview addSubview:obj];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(self.customIndexViewEdgeInsets.top);
            make.bottom.equalTo(self).with.offset(self.customIndexViewEdgeInsets.bottom);
            make.right.equalTo(self).with.offset(self.customIndexViewEdgeInsets.right);
            
            
        }];
        self.customIndexView = obj;
    }
    return obj;
}
-(void)setTableViewSectionIndexSelectedView:(TableViewSectionIndexSelectedView *)tableViewSectionIndexSelectedView{
    objc_setAssociatedObject(self, tableViewSelectedViewKey,tableViewSectionIndexSelectedView , OBJC_ASSOCIATION_RETAIN);
}
-(TableViewSectionIndexSelectedView*)tableViewSectionIndexSelectedView{
    TableViewSectionIndexSelectedView*obj =  objc_getAssociatedObject(self, tableViewSelectedViewKey) ;
    if (!obj) {
        obj = [[TableViewSectionIndexSelectedView alloc]init];
    }
    return obj;
}

-(void)setCustomIndexViewTextColor:(UIColor*)textColor{
    self.customIndexView.textColor = textColor;
}
-(UIColor*)customIndexViewTextColor{
    return  self.customIndexView.textColor;
}
-(void)setCustomIndexViewEdgeInsets:(UIEdgeInsets)customIndexViewEdgeInsets{
      NSValue* value = [NSValue valueWithBytes:&customIndexViewEdgeInsets objCType:@encode(UIEdgeInsets)];
      objc_setAssociatedObject(self, customIndexViewEdgeInsetsKey,value , OBJC_ASSOCIATION_COPY);
    [self.customIndexView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(customIndexViewEdgeInsets.top);
        make.bottom.equalTo(self).with.offset(customIndexViewEdgeInsets.bottom);
        make.right.equalTo(self).with.offset(customIndexViewEdgeInsets.right);
        
        
    }];
}
-(UIEdgeInsets)customIndexViewEdgeInsets{
   
   NSValue* value = objc_getAssociatedObject(self, customIndexViewEdgeInsetsKey);
    UIEdgeInsets customIndexViewEdgeInsets;
    [value getValue:&customIndexViewEdgeInsets];
    return customIndexViewEdgeInsets;
    
}
@end
