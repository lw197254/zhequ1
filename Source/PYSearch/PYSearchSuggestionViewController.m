//
//  代码地址: https://github.com/iphone5solo/PYSearch
//  代码地址: http://www.code4app.com/thread-11175-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYSearchSuggestionViewController.h"
#import "PYSearchConst.h"

@interface PYSearchSuggestionViewController () 

@end

@implementation PYSearchSuggestionViewController

+ (instancetype)searchSuggestionViewControllerWithDidSelectCellBlock:(PYSearchSuggestionDidSelectCellBlock)didSelectCellBlock
{
    PYSearchSuggestionViewController *searchSuggestionVC = [[PYSearchSuggestionViewController alloc] init];
    searchSuggestionVC.didSelectCellBlock = didSelectCellBlock;
    return searchSuggestionVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedSectionFooterHeight =0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = BlackColorE3E3E3;
    [[RACObserve(self.viewModel, searchSuggestionListModel)filter:^BOOL(id value) {
        return self.viewModel.searchSuggestionListModel.isNotEmpty;
    }]subscribeNext:^(id x) {
       
        [self.tableView reloadData];
    }];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}
- (BOOL)shouldAutorotate
{
    return YES;
}

// 支持竖屏显示
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)setSearchSuggestions:(NSArray<NSString *> *)searchSuggestions
{
    _searchSuggestions = [searchSuggestions copy];
    
    // 刷新数据
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000001;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInSearchSuggestionView:)]) {
        return [self.dataSource numberOfSectionsInSearchSuggestionView:tableView];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.viewModel.searchSuggestionListModel.data.count;
//    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:numberOfRowsInSection:)]) {
//        return [self.dataSource searchSuggestionView:tableView numberOfRowsInSection:section];
//    }
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
       // 使用默认的搜索建议Cell
    static NSString *cellID = @"PYSearchSuggestionCellID";
    // 创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.textColor = BlackColor333333;
        cell.textLabel.font = FontOfSize(15);
        cell.backgroundColor = [UIColor clearColor];
//        // 添加分割线
//        UIView*line = [Tool createLine];
//        line.py_height = 1;
//        line.alpha = 1;
//        line.py_x = PYMargin;
//        line.py_y = 49;
//        line.py_width = PYScreenW;
//        [cell.contentView addSubview:line];
    }
    // 设置数据
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    SearchSugestionModel*model =self.viewModel.searchSuggestionListModel.data[indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
//    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:cellForRowAtIndexPath:)]) {
//        UITableViewCell *cell= [self.dataSource searchSuggestionView:tableView cellForRowAtIndexPath:indexPath];
//        if (cell) return cell;
//    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
//    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:heightForRowAtIndexPath:)]) {
//        return [self.dataSource searchSuggestionView:tableView heightForRowAtIndexPath:indexPath];
//    }
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectCellBlock) self.didSelectCellBlock([tableView cellForRowAtIndexPath:indexPath]);
    

    
  
}

@end
