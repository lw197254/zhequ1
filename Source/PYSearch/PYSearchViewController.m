//
//  代码地址: https://github.com/iphone5solo/PYSearch
//  代码地址: http://www.code4app.com/thread-11175-1-1.html
//  Created by CoderKo1o.
//  Copyright © 2016年 iphone5solo. All rights reserved.
//

#import "PYSearchViewController.h"
#import "PYSearchConst.h"
#import "PYSearchSuggestionViewController.h"
#import "SearchViewModel.h"
#import "SearchResultViewController.h"
#import "InformationViewController.h"
#import "PublicPraiseViewController.h"
#import "PhotoViewController.h"
#import "ParameterConfigViewController.h"
#import "AskForPriceViewController.h"
#import "BrandViewController.h"
#import "CarSeriesViewController.h"
#import "CarDeptViewController.h"
#import "CustomAlertView.h"

#import "XiHaoToTagsViewModel.h"
#define PYRectangleTagMaxCol 3 // 矩阵标签时，最多列数
#define MaxHistoryCount 10

#define PYColorPolRandomColor self.colorPol[arc4random_uniform((uint32_t)self.colorPol.count)] // 随机选取颜色池中的颜色

@interface PYSearchViewController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, PYSearchSuggestionViewDataSource>

/** 头部内容view */
@property (nonatomic, strong) UIView *headerContentView;

/** 搜索历史 */
@property (nonatomic, strong) NSMutableArray *searchHistories;

/** 键盘正在移动 */
@property (nonatomic, assign) BOOL keyboardshowing;
/** 记录键盘高度 */
@property (nonatomic, assign) CGFloat keyboardHeight;
///搜索请求信号
@property (strong, nonatomic)  RACDisposable* searchDispose;
/** 搜索建议（推荐）控制器 */
@property (nonatomic, weak) PYSearchSuggestionViewController *searchSuggestionVC;

/** 热门标签容器 */
@property (nonatomic, strong) UIView *hotSearchTagsContentView;
@property (nonatomic, strong) UIView *searchHistoryTopSeperateLine;

///装有热门搜索头，热门搜索标签的视图
@property (nonatomic, strong) UIView *hotSearchSuperView;
///装有搜索历史头，搜索历史标签，清空搜索按钮，搜索历史头部分割线的视图
@property (nonatomic, strong) UIView *searchHistorySuperView;
/** 排名标签(第几名) */
@property (nonatomic, copy) NSArray<UILabel *> *rankTags;
/** 排名内容 */
@property (nonatomic, copy) NSArray<UILabel *> *rankTextLabels;
/** 排名整体标签（包含第几名和内容） */
@property (nonatomic, copy) NSArray<UIView *> *rankViews;

/** 搜索历史标签容器，只有在PYSearchHistoryStyle值为PYSearchHistoryStyleTag才有值 */
//@property (nonatomic, strong) UIView *searchHistoryTagsContentView;
/** 搜索历史标签的清空按钮 */
@property (nonatomic, strong) UIButton *emptyButton;

/** 基本搜索TableView(显示历史搜索和搜索记录) */
@property (nonatomic, strong) UITableView *baseSearchTableView;
@property (nonatomic, strong) SearchViewModel *viewModel;
/** 记录是否点击搜索建议 */
@property (nonatomic, assign) BOOL didClickSuggestionCell;

//搜索上传
@property (nonatomic, strong) XiHaoToTagsViewModel *tagsViewModel;

@end

@implementation PYSearchViewController

- (instancetype)init
{
    if (self = [super init]) {
       
       
        
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
     [self setup];
    [self setSearchBarBackgroundColor:self.searchBarBackgroundColor];
    [self setSearchHistoryStyle:self.searchHistoryStyle];
    [self.searchBar becomeFirstResponder];
    self.viewModel = [SearchViewModel SceneModel];
    
    self.viewModel.hotSearchRequest.startRequest = YES;
    @weakify(self);
    [[RACObserve(self.viewModel, hotSearchListModel)filter:^BOOL(id value) {
        @strongify(self);
        return self.viewModel.hotSearchListModel.isNotEmpty;
    }]subscribeNext:^(id x) {
        @strongify(self);
        if (self.viewModel.hotSearchListModel.data.count > 0) {
            HotSearchModel*model = [self.viewModel.hotSearchListModel.data firstObject];
            
            NSMutableArray*array = [NSMutableArray array];
            [self.viewModel.hotSearchListModel.data enumerateObjectsUsingBlock:^(HotSearchModel*model, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [array addObject:model.name];
            }];
            self.hotSearches = array;
        }
        
        
    }];

}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

+ (PYSearchViewController *)searchViewControllerWithHotSearches:(NSArray<NSString *> *)hotSearches searchBarPlaceholder:(NSString *)placeholder
{
    PYSearchViewController *searchVC = [[PYSearchViewController alloc] init];
//    searchVC.hotSearches = hotSearches;
//    searchVC.searchBar.placeholder = placeholder;
    return searchVC;
}

+ (PYSearchViewController *)searchViewControllerWithHotSearches:(NSArray<NSString *> *)hotSearches searchBarPlaceholder:(NSString *)placeholder didSearchBlock:(PYDidSearchBlock)block
{
    PYSearchViewController *searchVC = [self searchViewControllerWithHotSearches:hotSearches searchBarPlaceholder:placeholder];
    searchVC.didSearchBlock = [block copy];
    return searchVC;
}



#pragma mark  包装cancelButton
- (UIBarButtonItem *)cancelButton
{
    return self.navigationItem.rightBarButtonItem;
}

/** 视图完全显示 */
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    
//    
//    if ([self.searchBar.text isNotEmpty]) {
//         [self searchBarSearchButtonClicked:self.searchBar];
//         
//    }
//    
//}

/** 视图即将消失 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 回收键盘
    [self.searchBar resignFirstResponder];
}

/** 控制器销毁 */
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/** 初始化 */
- (void)setup
{
    
    
    self.navigationItem.hidesBackButton =YES;
    // 设置背景颜色为白色
    self.view.backgroundColor = [UIColor whiteColor];
    self.baseSearchTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    UIButton*cancel = [[UIButton alloc]initNavigationButtonWithTitle:@"取消" color:BlackColor333333 font:FontOfSize(15)];
    
    cancel.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
   [cancel addTarget:self action:@selector(cancelDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancel ];
   
    /**
     * 设置一些默认设置
     */
//    // 热门搜索风格设置
//    self.hotSearchStyle = PYHotSearchStyleDefault;
//    // 设置搜索历史风格
//    self.searchHistoryStyle = PYHotSearchStyleDefault;
//    // 设置搜索结果显示模式
//    self.searchResultShowMode = PYSearchResultShowModeDefault;
    // 显示搜索建议
    self.searchSuggestionHidden = NO;
    // 搜索历史缓存路径
    self.searchHistoriesCachePath = PYSearchHistoriesPath;
    
    // 创建搜索框
    UIView *titleView = [[UIView alloc] init];
    titleView.py_x = PYMargin * 0.5;
    titleView.py_y = 7;
    titleView.py_width = self.view.py_width - 44 - titleView.py_x * 2;
    titleView.py_height = 30;
    titleView.backgroundColor = [UIColor clearColor];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];
    searchBar.py_width -= PYMargin * 1.5;
    searchBar.placeholder = PYSearchPlaceholderText;
    searchBar.backgroundImage = [UIImage imageNamed:@"PYSearch.bundle/clearImage"];
    searchBar.delegate = self;
    searchBar.tintColor = BlueColor447FF5;
    
    
    [titleView addSubview:searchBar];
    self.searchBar = searchBar;
    self.navigationItem.titleView = titleView;
    
    // 设置头部（热门搜索）
    self.headerContentView = [[UIView alloc] init];
   
    
    [self.headerContentView addSubview:self.hotSearchSuperView];
    [self.headerContentView addSubview:self.searchHistorySuperView];
    [self.hotSearchSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerContentView);
        make.left.equalTo(self.headerContentView).with.offset(PYMargin*1.5);
        make.right.equalTo(self.headerContentView).with.offset(-PYMargin*1.5);
        make.height.mas_equalTo(0).priority(900);
    }];
    [self.searchHistorySuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headerContentView);
        make.left.equalTo(self.headerContentView).with.offset(PYMargin*1.5);
        make.right.equalTo(self.headerContentView).with.offset(-PYMargin*1.5);
        make.top.equalTo(self.hotSearchSuperView.mas_bottom);
        make.height.mas_equalTo(0).priority(900);
    }];
   
    
    
  
    UIView*view = [[UIView alloc]init];
    view.backgroundColor =  BlackColorF1F1F1;
    [self.hotSearchSuperView addSubview:view];
    [self.hotSearchSuperView addSubview:self.hotSearchHeader];
       // 创建热门搜索标签容器
  
    
    [self.hotSearchSuperView addSubview: self.hotSearchTagsContentView];
    UIView*view1 = [[UIView alloc]init];
    view1.backgroundColor =  BlackColorF1F1F1;
    [self.searchHistorySuperView addSubview:view1];
    [self.searchHistorySuperView addSubview:self.searchHistoryTopSeperateLine];
    [self.searchHistorySuperView addSubview:self.searchHistoryHeader];
    [self.searchHistorySuperView addSubview:self.emptyButton];
//    [self.searchHistorySuperView addSubview:self.searchHistoryTagsContentView];
    
    
    [self.hotSearchHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotSearchSuperView).priority(500);
        make.left.equalTo(self.hotSearchSuperView);
         make.height.mas_equalTo(25);
        
    }];
   
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotSearchHeader);
        make.height.mas_equalTo(25);
        make.left.right.equalTo(self.headerContentView);
    }];
    [self.hotSearchTagsContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotSearchHeader.mas_bottom).with.offset(PYMargin*2);
        make.left.right.equalTo(self.hotSearchSuperView);
         make.bottom.equalTo(self.hotSearchSuperView).with.offset(-PYMargin*2);
        
    }];
       [self.searchHistoryTopSeperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchHistorySuperView);
           make.height.mas_equalTo(0);
        make.left.right.equalTo(self.searchHistorySuperView);
        
    }];
   
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchHistoryHeader);
        make.height.mas_equalTo(25);
        make.left.right.equalTo(self.headerContentView);
    }];
    [self.searchHistoryHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchHistoryTopSeperateLine.mas_bottom);
        make.height.mas_equalTo(25);
         make.left.bottom.right.equalTo(self.searchHistorySuperView).priority(500);
        
    }];
   
    [self.emptyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.searchHistoryHeader);
        make.right.equalTo(self.searchHistorySuperView);
        
    }];

//    [self.searchHistoryTagsContentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.searchHistoryHeader.mas_bottom).with.offset(PYMargin);
//        make.left.bottom.right.equalTo(self.searchHistorySuperView).priority(500);
//        
//    }];

    
    
  
    
    self.baseSearchTableView.tableHeaderView = self.headerContentView;
    
//    // 设置底部(清除历史搜索)
//    UIView *footerView = [[UIView alloc] init];
//    footerView.py_width = PYScreenW;
//    UILabel *emptySearchHistoryLabel = [[UILabel alloc] init];
//    emptySearchHistoryLabel.textColor = [UIColor darkGrayColor];
//    emptySearchHistoryLabel.font = FontOfSize(13);
//    emptySearchHistoryLabel.userInteractionEnabled = YES;
//    emptySearchHistoryLabel.text = PYEmptySearchHistoryText;
//    emptySearchHistoryLabel.textAlignment = NSTextAlignmentCenter;
//    emptySearchHistoryLabel.py_height = 30;
//    [emptySearchHistoryLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(emptySearchHistoryDidClick)]];
//    emptySearchHistoryLabel.py_width = PYScreenW;
//    [footerView addSubview:emptySearchHistoryLabel];
//    footerView.py_height = 30;
    self.baseSearchTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
   
    // 默认没有热门搜索
    self.hotSearches = nil;
   
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
   
   
    if (self.searchHistories.count==0) {
        ///没有历史隐藏
        self.searchHistorySuperView.hidden = YES;
        
        
        [self.searchHistorySuperView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.headerContentView);
            make.left.equalTo(self.headerContentView).with.offset(PYMargin*1.5);
            make.right.equalTo(self.headerContentView).with.offset(-PYMargin*1.5);
            make.top.equalTo(self.hotSearchSuperView.mas_bottom);
            make.height.mas_equalTo(0).priority(900);
        }];

        
        
       
    }else{
        ///有历史显示
        self.searchHistorySuperView.hidden = NO;
        
        ///约束优先级降下来，相当于去掉了约束
     
        [self.searchHistorySuperView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.headerContentView);
            make.left.equalTo(self.headerContentView).with.offset(PYMargin*1.5);
            make.right.equalTo(self.headerContentView).with.offset(-PYMargin*1.5);
            make.top.equalTo(self.hotSearchSuperView.mas_bottom);
            make.height.mas_equalTo(0).priority(10);
        }];

       
    }
    
    
    [self.headerContentView layoutIfNeeded];
    CGFloat height = [self.headerContentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    self.headerContentView.frame = CGRectMake(0, 0, kwidth, height);
    self.baseSearchTableView.tableHeaderView = self.headerContentView;
}
/**
 * 设置热门搜索标签(不带排名)
 * PYHotSearchStyleNormalTag || PYHotSearchStyleColorfulTag ||
 * PYHotSearchStyleBorderTag || PYHotSearchStyleARCBorderTag
 */
- (void)setupHotSearchNormalTags
{
    // 添加和布局标签
    self.hotSearchTags = [self addAndLayoutTagsWithTagsContentView:self.hotSearchTagsContentView tagTexts:self.hotSearches];
    
    // 根据hotSearchStyle设置标签样式
     //self.hotSearchHeader.py_y = self.searchHistoryTags.count > 0 ? CGRectGetMaxY(self.searchHistoryTagsContentView.frame) + PYMargin * 2 : 0;
    [self setHotSearchStyle:self.hotSearchStyle];
}

/**
 * 设置搜索历史标签
 * PYSearchHistoryStyleTag
 */
- (void)setupSearchHistoryTags
{
   
    
    [self.baseSearchTableView reloadData];
    
    // 添加和布局标签
//    self.searchHistoryTags = [self addAndLayoutTagsWithTagsContentView:_searchHistoryTagsContentView tagTexts:[self.searchHistories copy]];
}

/**  添加和布局标签 */
- (NSArray *)addAndLayoutTagsWithTagsContentView:(UIView *)contentView tagTexts:(NSArray<NSString *> *)tagTexts;
{
    
    
    
    if(!contentView){
        return nil;
    }
    // 清空标签容器的子控件
    [contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 添加热门搜索标签
    NSMutableArray *tagsM = [NSMutableArray array];
    for (int i = 0; i < tagTexts.count; i++) {
        UILabel *label = [self labelWithTitle:tagTexts[i]];
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagDidCLick:)]];
        [contentView addSubview:label];
        [tagsM addObject:label];
    }
    
    // 计算位置
    CGFloat currentX = 0;
    CGFloat currentY = 0;
    CGFloat countRow = 0;
    CGFloat countCol = 0;
    
    // 调整布局
    
    CGFloat py_Width =  kwidth-PYMargin*3;
    for (int i = 0; i < contentView.subviews.count; i++) {
        UILabel *subView = contentView.subviews[i];
        // 当搜索字数过多，宽度为contentView的宽度
        if (subView.py_width > py_Width) subView.py_width = py_Width;
        if (currentX + subView.py_width + PYMargin * countRow > py_Width) { // 得换行
            subView.py_x = 0;
            subView.py_y = (currentY += subView.py_height) + PYMargin * ++countCol;
            currentX = subView.py_width;
            countRow = 1;
        } else { // 不换行
            subView.py_x = (currentX += subView.py_width) - subView.py_width + PYMargin * countRow;
            subView.py_y = currentY + PYMargin * countCol;
            countRow ++;
        }
    }
    NSLog(@"%f",CGRectGetMaxY(contentView.subviews.lastObject.frame));
    // 设置contentView高度
    [contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(CGRectGetMaxY(contentView.subviews.lastObject.frame)).priorityHigh();
    }];
    // 取消隐藏
    self.baseSearchTableView.tableHeaderView.hidden = NO;
    // 重新赋值, 注意：当操作系统为iOS 9.x系列的tableHeaderView高度设置失效，需要重新设置tableHeaderView
    
    CGFloat height = [self.headerContentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    self.headerContentView.frame = CGRectMake(0, 0, kwidth, height);
    self.baseSearchTableView.tableHeaderView = self.headerContentView;
     
    return [tagsM copy];
}

#pragma mark - setter
- (void)setCancelButton:(UIBarButtonItem *)cancelButton
{
    self.navigationItem.rightBarButtonItem = cancelButton;
}

- (void)setSearchHistoriesCachePath:(NSString *)searchHistoriesCachePath
{
    _searchHistoriesCachePath = [searchHistoriesCachePath copy];
    // 刷新
    self.searchHistories = nil;
    if (self.searchHistoryStyle == PYSearchHistoryStyleCell) { // 搜索历史为cell类型
        [self.baseSearchTableView reloadData];
    } else { // 搜索历史为标签类型
        [self setSearchHistoryStyle:self.searchHistoryStyle];
    }
}

- (void)setHotSearchTags:(NSArray<UILabel *> *)hotSearchTags
{
    // 设置热门搜索时(标签tag为1，搜索历史为0)
    for (UILabel *tagLabel in hotSearchTags) {
        tagLabel.tag = 1;
    }
    _hotSearchTags = hotSearchTags;
}

- (void)setSearchBarBackgroundColor:(UIColor *)searchBarBackgroundColor
{
    _searchBarBackgroundColor = searchBarBackgroundColor;
    
    // 取出搜索栏的textField设置其背景色
    for (UIView *subView in [[self.searchBar.subviews lastObject] subviews]) {
        if ([[subView class] isSubclassOfClass:[UITextField class]]) { // 是UItextField
            // 设置UItextField的背景色
            UITextField *textField = (UITextField *)subView;
            textField.backgroundColor = searchBarBackgroundColor;
            // 退出循环
            break;
        }
    }
}

- (void)setSearchSuggestions:(NSArray<NSString *> *)searchSuggestions
{
    if (self.searchSuggestionHidden) return; // 如果隐藏，直接返回，避免刷新操作
    
    _searchSuggestions = [searchSuggestions copy];
    // 赋值给搜索建议控制器
    self.searchSuggestionVC.searchSuggestions = [searchSuggestions copy];
}

- (void)setRankTagBackgroundColorHexStrings:(NSArray<NSString *> *)rankTagBackgroundColorHexStrings
{
    if (rankTagBackgroundColorHexStrings.count < 4) { // 不符合要求，使用基本设置
        NSArray *colorStrings = @[@"#f14230", @"#ff8000", @"#ffcc01", @"#ebebeb"];
        _rankTagBackgroundColorHexStrings = colorStrings;
    } else { // 取前四个
        _rankTagBackgroundColorHexStrings = @[rankTagBackgroundColorHexStrings[0], rankTagBackgroundColorHexStrings[1], rankTagBackgroundColorHexStrings[2], rankTagBackgroundColorHexStrings[3]];
    }
    
    // 刷新
    self.hotSearches = self.hotSearches;
}

- (void)setHotSearches:(NSArray *)hotSearches
{
    _hotSearches = hotSearches;
    // 没有热门搜索,隐藏相关控件，直接返回
    if (hotSearches.count == 0) {
        [self.hotSearchSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0).priority(900);
        }];
//        self.hotSearchSuperView.hidden = YES;
         [self viewWillLayoutSubviews];
        return;
    };
    // 有热门搜索，取消相关隐藏
    [self.hotSearchSuperView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerContentView);
        make.left.equalTo(self.headerContentView).with.offset(PYMargin*1.5);
        make.right.equalTo(self.headerContentView).with.offset(-PYMargin*1.5);
        make.height.mas_equalTo(0).priority(100);
    }];
    self.hotSearchSuperView.hidden = NO;
    

    // 根据hotSearchStyle设置标签
    if (self.hotSearchStyle == PYHotSearchStyleDefault
        || self.hotSearchStyle == PYHotSearchStyleColorfulTag
        || self.hotSearchStyle == PYHotSearchStyleBorderTag
        || self.hotSearchStyle == PYHotSearchStyleARCBorderTag) { // 不带排名的标签
        [self setupHotSearchNormalTags];
//    } else if (self.hotSearchStyle == PYHotSearchStyleRankTag) { // 带有排名的标签
//        [self setupHotSearchRankTags];
//    } else if (self.hotSearchStyle == PYHotSearchStyleRectangleTag) { // 矩阵标签
//        [self setupHotSearchRectangleTags];
    }
    [self viewWillLayoutSubviews];
    // 刷新搜索历史布局
    [self setSearchHistoryStyle:self.searchHistoryStyle];
    
}

- (void)setSearchHistoryStyle:(PYSearchHistoryStyle)searchHistoryStyle
{
    _searchHistoryStyle = searchHistoryStyle;
    
//    // 默认cell，直接返回
//    if (searchHistoryStyle == UISearchBarStyleDefault) return;
//    // 创建、初始化默认标签
//    [self setupSearchHistoryTags];
//    // 根据标签风格设置标签
//    switch (searchHistoryStyle) {
//        case PYSearchHistoryStyleColorfulTag: // 彩色标签
//            for (UILabel *tag in self.searchHistoryTags) {
//                // 设置字体颜色为白色
//                tag.textColor = [UIColor whiteColor];
//                // 取消边框
//                tag.layer.borderColor = nil;
//                tag.layer.borderWidth = 0.0;
//                tag.backgroundColor = PYColorPolRandomColor;
//            }
//            break;
//        case PYSearchHistoryStyleBorderTag: // 边框标签
//            for (UILabel *tag in self.searchHistoryTags) {
//                // 设置背景色为clearColor
//                tag.backgroundColor = [UIColor clearColor];
//                // 设置边框颜色
//                tag.layer.borderColor = PYColor(223, 223, 223).CGColor;
//                // 设置边框宽度
//                tag.layer.borderWidth = 0.5;
//            }
//            break;
//        case PYSearchHistoryStyleARCBorderTag: // 圆弧边框标签
//            for (UILabel *tag in self.searchHistoryTags) {
//                // 设置背景色为clearColor
//                tag.backgroundColor = [UIColor clearColor];
//                // 设置边框颜色
//                tag.layer.borderColor = PYColor(223, 223, 223).CGColor;
//                // 设置边框宽度
//                tag.layer.borderWidth = 0.5;
//                // 设置边框弧度为圆弧
//                tag.layer.cornerRadius = tag.py_height * 0.5;
//            }
//            break;
//            
//        default:
//            break;
//    }
}

- (void)setHotSearchStyle:(PYHotSearchStyle)hotSearchStyle
{
    _hotSearchStyle = hotSearchStyle;
    switch (hotSearchStyle) {
        case PYHotSearchStyleColorfulTag: // 彩色标签
            for (UILabel *tag in self.hotSearchTags) {
                // 设置字体颜色为白色
                tag.textColor = [UIColor whiteColor];
                // 取消边框
                tag.layer.borderColor = nil;
                tag.layer.borderWidth = 0.0;
                tag.backgroundColor = PYColorPolRandomColor;
            }
            break;
        case PYHotSearchStyleBorderTag: // 边框标签
            for (UILabel *tag in self.hotSearchTags) {
                // 设置背景色为clearColor
                tag.backgroundColor = [UIColor clearColor];
                // 设置边框颜色
                tag.layer.borderColor = PYColor(223, 223, 223).CGColor;
                // 设置边框宽度
                tag.layer.borderWidth = 0.5;
            }
            break;
        case PYHotSearchStyleARCBorderTag: // 圆弧边框标签
            for (UILabel *tag in self.hotSearchTags) {
                // 设置背景色为clearColor
                tag.backgroundColor = [UIColor clearColor];
                // 设置边框颜色
                tag.layer.borderColor = PYColor(223, 223, 223).CGColor;
                // 设置边框宽度
                tag.layer.borderWidth = 0.5;
                // 设置边框弧度为圆弧
                tag.layer.cornerRadius = tag.py_height * 0.5;
            }
            break;
        case PYHotSearchStyleRectangleTag: // 九宫格标签
            self.hotSearches = self.hotSearches;
            break;
        case PYHotSearchStyleRankTag: // 排名标签
            self.rankTagBackgroundColorHexStrings = nil;
            break;
            
        default:
            break;
    }
}

/** 点击取消 */
- (void)cancelDidClick
{
    [self.searchBar resignFirstResponder];
    
    // dismiss ViewController
    [self dismissViewControllerAnimated:NO completion:nil];
    
    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(didClickCancel:)]) {
        [self.delegate didClickCancel:self];
    }
}

/** 键盘显示完成（弹出） */
- (void)keyboardDidShow:(NSNotification *)noti
{
    // 取出键盘高度
    NSDictionary *info = noti.userInfo;
    self.keyboardHeight = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    self.keyboardshowing = YES;
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

/** 点击清空历史按钮 */
- (void)emptySearchHistoryDidClick
{
    //移除输入框
   [self.searchBar resignFirstResponder];
    
    [[CustomAlertView alertView]showWithTitle:@"是否清除所有搜索记录？" message:nil cancelButtonTitle:@"取消" confirmButtonTitle:@"确定" cancel:^{
        
    } confirm:^{
        // 移除所有历史搜索
        [self.searchHistories removeAllObjects];
        // 移除数据缓存
        [NSKeyedArchiver archiveRootObject:self.searchHistories toFile:self.searchHistoriesCachePath];
        
        
            self.searchHistoryStyle = self.searchHistoryStyle;
            [self viewWillLayoutSubviews];
            [self.baseSearchTableView reloadData];
        

    }];
    
   
}

/** 选中标签 */
- (void)tagDidCLick:(UITapGestureRecognizer *)gr
{
    UILabel *label = (UILabel *)gr.view;
    self.searchBar.text = label.text;
    
    if (self.searchHistoryStyle == PYSearchHistoryStyleCell) { // 搜索历史为标签时，刷新标签
        // 刷新tableView
        [self.baseSearchTableView reloadData];
    } else {
        // 更新
        self.searchHistoryStyle = self.searchHistoryStyle;
    }
    
    if (label.tag == 1) { // 热门搜索标签
        // 取出下标
        if ([self.delegate respondsToSelector:@selector(searchViewController:didSelectHotSearchAtIndex:searchText:)]) {
            [self.delegate searchViewController:self didSelectHotSearchAtIndex:[self.hotSearchTags indexOfObject:label] searchText:label.text];
        } else {
            [self searchBarSearchButtonClicked:self.searchBar];
        }
    } else { // 搜索历史标签
        if ([self.delegate respondsToSelector:@selector(searchViewController:didSelectSearchHistoryAtIndex:searchText:)]) {
            [self.delegate searchViewController:self didSelectSearchHistoryAtIndex:[self.searchHistoryTags indexOfObject:label] searchText:label.text];
        } else {
            [self searchBarSearchButtonClicked:self.searchBar];
        }
    }
    PYSearchLog(@"搜索 %@", label.text);
}

/** 添加标签 */
- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.userInteractionEnabled = YES;
    label.font = FontOfSize(12);
    label.text = title;
    label.textColor = BlackColor333333;
    label.backgroundColor = [UIColor py_colorWithHexString:@"#fafafa"];
    label.layer.cornerRadius = 3;
    label.clipsToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    label.py_width += 20;
    label.py_height += 14;
    return label;
}

#pragma mark - PYSearchSuggestionViewDataSource
- (NSInteger)numberOfSectionsInSearchSuggestionView:(UITableView *)searchSuggestionView
{
    if ([self.dataSource respondsToSelector:@selector(numberOfSectionsInSearchSuggestionView:)]) {
        return [self.dataSource numberOfSectionsInSearchSuggestionView:searchSuggestionView];
    }
    return 1;
}

- (NSInteger)searchSuggestionView:(UITableView *)searchSuggestionView numberOfRowsInSection:(NSInteger)section
{
    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:numberOfRowsInSection:)]) {
        return [self.dataSource searchSuggestionView:searchSuggestionView numberOfRowsInSection:section];
    }
    return self.searchSuggestions.count;
}

- (UITableViewCell *)searchSuggestionView:(UITableView *)searchSuggestionView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:cellForRowAtIndexPath:)]) {
        return [self.dataSource searchSuggestionView:searchSuggestionView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (CGFloat)searchSuggestionView:(UITableView *)searchSuggestionView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource respondsToSelector:@selector(searchSuggestionView:heightForRowAtIndexPath:)]) {
        return [self.dataSource searchSuggestionView:searchSuggestionView heightForRowAtIndexPath:indexPath];
    }
    return 44.0;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // 回收键盘
    [searchBar resignFirstResponder];
    if(searchBar.text.length==0){
        return;
    }
    // 先移除再刷新
    [self.searchHistories removeObject:searchBar.text];
    [self.searchHistories insertObject:searchBar.text atIndex:0];
    // 刷新数据
    if (self.searchHistoryStyle == PYSearchHistoryStyleCell) { // 普通风格Cell
        [self.baseSearchTableView reloadData];
    } else { // 搜索历史为标签
        // 更新
        self.searchHistoryStyle = self.searchHistoryStyle;
    }
    // 保存搜索信息
    [NSKeyedArchiver archiveRootObject:self.searchHistories toFile:self.searchHistoriesCachePath];
    // 处理搜索结果
    switch (self.searchResultShowMode) {
        case PYSearchResultShowModePush: // Push
            [self.rt_navigationController pushViewController:self.searchResultController animated:YES];
            break;
        case PYSearchResultShowModeEmbed: // 内嵌
            // 添加搜索结果的视图
        {
            [self addChildViewController:self.searchResultController];
            self.searchResultController.viewModel.searchResultRequest.keywords = searchBar.text;
            self.searchResultController.viewModel.searchResultRequest.startRequest = YES;
            self.searchResultController.showAllSeries = NO;
            self.searchResultController.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
            [self.view addSubview:self.searchResultController.tableView];
            
            
        }
            
                        break;
        case PYSearchResultShowModeCustom: // 自定义
            
            break;
        default:
            break;
    }
    // 如果代理实现了代理方法则调用代理方法
    if ([self.delegate respondsToSelector:@selector(searchViewController:didSearchWithsearchBar:searchText:)]) {
        [self.delegate searchViewController:self didSearchWithsearchBar:searchBar searchText:searchBar.text];
        return;
    }
    // 如果有block则调用
    if (self.didSearchBlock) self.didSearchBlock(self, searchBar, searchBar.text);
}
-(void)createSearchSuggestionWithKey:(NSString*)key{
    
    [self.searchDispose dispose];//上次信号还没处理，取消它(距离上次生成还不到1秒)
    if (key.length==0) {
        return;
    }
    @weakify(self);
    self.searchDispose = [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendCompleted];
        return nil;
    }] delay:0.5] //延时一秒
                         subscribeCompleted:^{
                             @strongify(self);
                            
                             self.searchSuggestionVC.viewModel.searchSuggestionRequest.keywords = key;
                             self.searchSuggestionVC.viewModel.searchSuggestionRequest.startRequest = YES;
                             self.searchDispose = nil;
                         }];


}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.searchResultController removeFromParentViewController];
    
    [self.searchResultController.tableView removeFromSuperview];
    // 如果有搜索文本且显示搜索建议，则隐藏
    self.baseSearchTableView.hidden = searchText.length && !self.searchSuggestionHidden;
    // 根据输入文本显示建议搜索条件
    
    self.searchSuggestionVC.view.hidden = self.searchSuggestionHidden || !searchText.length;
    // 放在最上层
    [self viewWillLayoutSubviews];
    [self.view bringSubviewToFront:self.searchSuggestionVC.view];
    [self createSearchSuggestionWithKey:searchText];
    // 如果代理实现了代理方法则调用代理方法
    if ([self.delegate respondsToSelector:@selector(searchViewController:searchTextDidChange:searchText:)]) {
        [self.delegate searchViewController:self searchTextDidChange:searchBar searchText:searchText];
    }
    [self.baseSearchTableView reloadData];
    
}

- (void)closeDidClick:(UIButton *)sender
{
    // 获取当前cell
    UITableViewCell *cell = (UITableViewCell *)sender.superview;
    // 移除搜索信息
    [self.searchHistories removeObject:cell.textLabel.text];
    // 保存搜索信息
    [NSKeyedArchiver archiveRootObject:self.searchHistories toFile:PYSearchHistoriesPath];
    // 刷新
    [self.baseSearchTableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 没有搜索记录就隐藏
    if (tableView == self.baseSearchTableView) {
        return self.searchHistories.count;
    }
    return 0;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.baseSearchTableView) {
        return 50;
    }else{
        return 100;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"PYSearchHistoryCellID";
    // 创建cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.textColor = BlackColor333333;
        cell.textLabel.font = FontOfSize(15);
        cell.backgroundColor = [UIColor clearColor];
    }
    
        cell.textLabel.text = self.searchHistories[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
//    return self.searchHistories.count && self.searchHistoryStyle == PYSearchHistoryStyleCell ? PYSearchHistoryText : nil;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出选中的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.searchBar.text = cell.textLabel.text;
    
    if ([self.delegate respondsToSelector:@selector(searchViewController:didSelectSearchHistoryAtIndex:searchText:)]) { // 实现代理方法则调用，则搜索历史时searchViewController:didSearchWithsearchBar:searchText:失效
        [self.delegate searchViewController:self didSelectSearchHistoryAtIndex:indexPath.row searchText:cell.textLabel.text];
    } else {
        [self searchBarSearchButtonClicked:self.searchBar];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 滚动时，回收键盘
    if (self.keyboardshowing) [self.searchBar resignFirstResponder];
}
#pragma mark - 懒加载
- (UITableView *)baseSearchTableView
{
    if (!_baseSearchTableView) {
        UITableView *baseSearchTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        baseSearchTableView.backgroundColor = [UIColor clearColor];
        
        baseSearchTableView.delegate = self;
        baseSearchTableView.dataSource = self;
        [self.view addSubview:baseSearchTableView];
        [baseSearchTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.right.bottom.equalTo(self.view);
        }];
       
        _baseSearchTableView = baseSearchTableView;
    }
    return _baseSearchTableView;
}

- (SearchResultViewController *)searchResultController
{
    if (!_searchResultController) {
        SearchResultViewController*vc = [[SearchResultViewController alloc] initWithStyle:UITableViewStylePlain];
        
        vc.viewModel = self.viewModel;
        vc.tableView.frame = CGRectMake(0, 0, self.view.py_width, self.view.py_height);
        _searchResultController = vc;
        self.searchResultTableView = _searchResultController.tableView;
    }
    return _searchResultController;
}

- (PYSearchSuggestionViewController *)searchSuggestionVC
{
    if (!_searchSuggestionVC) {
        PYSearchSuggestionViewController *searchSuggestionVC = [[PYSearchSuggestionViewController alloc] initWithStyle:UITableViewStyleGrouped];
        searchSuggestionVC.viewModel = self.viewModel;
        __weak typeof(self) _weakSelf = self;
        searchSuggestionVC.didSelectCellBlock = ^(UITableViewCell *didSelectCell) {
            NSIndexPath *indexPath = [_weakSelf.searchSuggestionVC.tableView indexPathForCell:didSelectCell];
            // 设置搜索信息
            SearchSugestionModel*model =self.viewModel.searchSuggestionListModel.data[indexPath.row];
            [self.searchHistories removeObject:model.name];
            [self.searchHistories insertObject:model.name atIndex:0];
            self.viewModel.submitSearchResultRequest.keywords = model.name;
            self.viewModel.submitSearchResultRequest.startRequest = YES;
            // 刷新数据
            if (self.searchHistoryStyle == PYSearchHistoryStyleCell) { // 普通风格Cell
                [self.baseSearchTableView reloadData];
            } else { // 搜索历史为标签
                // 更新
                self.searchHistoryStyle = self.searchHistoryStyle;
            }
            // 保存搜索信息
            
            [NSKeyedArchiver archiveRootObject:self.searchHistories toFile:self.searchHistoriesCachePath];
            
            ///需要跳转指定页面 news：资讯页 koubei:口碑页 photo:图片页 param：参配页 price:报价页（app无
            if ([model.page isEqualToString:@"news"]) {
                InformationViewController*info = [[InformationViewController alloc]init];
                ;
                info.carSeriesId  = model.id;
                [self.rt_navigationController pushViewController:info animated:YES];
                return ;
            }else if ([model.page isEqualToString:@"koubei"]){
                PublicPraiseViewController* kb = [[PublicPraiseViewController alloc]init];
                
                kb.catTypeId = model.id;
                kb.carSeriesName = model.name;
                [self.rt_navigationController pushViewController:kb animated:YES];
                return ;
            } if ([model.page isEqualToString:@"photo"]){
                PhotoViewController*vc = [[PhotoViewController alloc]init];
                vc.carName = model.name;
                vc.typeId = model.id;
                
                [self.rt_navigationController pushViewController:vc animated:YES];
                return ;
            }
            if ([model.page isEqualToString:@"param"]){
                ParameterConfigViewController*vc = [[ParameterConfigViewController alloc]init];
                vc.typeId = model.id;
                [self.rt_navigationController pushViewController:vc animated:YES];
                return ;
            }
            if ([model.page isEqualToString:@"price"]){
                AskForPriceViewController*vc = [[AskForPriceViewController alloc]init];
                ////缺少,暂无这种类型
                [self.rt_navigationController pushViewController:vc animated:YES];
            }else{
                switch (model.type) {
                    case SearchTypeBrand:{
                        CarSeriesViewController*vc = [[CarSeriesViewController alloc]init];
                        vc.brandModel = [[BrandModel alloc]init];
                        vc.brandModel.name = model.name;
                        vc.brandModel.id = model.id;
                        vc.brandModel.url = model.picurl;
                        
                        [self.rt_navigationController pushViewController:vc animated:YES];
                        return ;
                    }
                        
                        break;
                    case SearchTypeCarSearies:{
                        
                        NSString *uid = [UserModel shareInstance].uid;
                        if ([uid isNotEmpty]) {
                            self.tagsViewModel.request.uid = uid;
                            self.tagsViewModel.request.chexiid = model.id;
                            self.tagsViewModel.request.name = model.name;
                            self.tagsViewModel.request.startRequest = YES;
                        }
                        
                        
                        CarDeptViewController*vc = [[CarDeptViewController alloc]init];
                        vc.chexiid = model.id;
                        vc.picture = model.picurl;
                        [self.rt_navigationController pushViewController:vc animated:YES];
                        return ;
                    }
                        
                        break;
                    case SearchTypeFactory:{
                        CarSeriesViewController*vc = [[CarSeriesViewController alloc]init];
                        vc.brandModel = [[BrandModel alloc]init];
                        
                        vc.factoryId = model.id;
                        vc.carSeriesName = model.name;
                        [self.rt_navigationController pushViewController:vc animated:YES];
                        return ;
                    }
                        
                        break;
                        
                    default:
                        break;
                }
                
                
                
                
            }
            
            // 如果实现搜索建议代理方法则searchBarSearchButtonClicked失效
            if ([self.delegate respondsToSelector:@selector(searchViewController:didSelectSearchSuggestionAtIndex:searchText:)]) {
                // 获取下标
                NSIndexPath *indexPath = [_weakSelf.searchSuggestionVC.tableView indexPathForCell:didSelectCell];
                [self.delegate searchViewController:_weakSelf didSelectSearchSuggestionAtIndex:indexPath.row searchText:_weakSelf.searchBar.text];
            } else {
                
                
                // 点击搜索
                //[_weakSelf searchBarSearchButtonClicked:_weakSelf.searchBar];
            }
        };
        searchSuggestionVC.view.frame = CGRectMake(0, 0, self.view.py_width, self.view.py_height);
        searchSuggestionVC.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.keyboardHeight, 0);
        searchSuggestionVC.view.backgroundColor = self.baseSearchTableView.backgroundColor;
        searchSuggestionVC.view.hidden = YES;
        // 设置数据源
        searchSuggestionVC.dataSource = self;
        [self.view addSubview:searchSuggestionVC.view];
        [self addChildViewController:searchSuggestionVC];
        _searchSuggestionVC = searchSuggestionVC;
    }
    return _searchSuggestionVC;
}

- (UIButton *)emptyButton
{
    
    if (!_emptyButton) {
        // 添加清空按钮
        UIButton *emptyButton = [[UIButton alloc] init];
//        emptyButton.titleLabel.font = self.searchHistoryHeader.font;
//        [emptyButton setTitleColor:BlackColor333333 forState:UIControlStateNormal];
        
        [emptyButton setImage:[UIImage imageNamed:@"PYSearch.bundle/ic_trash"] forState:UIControlStateNormal];
        [emptyButton addTarget:self action:@selector(emptySearchHistoryDidClick) forControlEvents:UIControlEventTouchUpInside];
        [emptyButton sizeToFit];
        
       
        
        _emptyButton = emptyButton;
    }
    return _emptyButton;
}
-(UIView*)hotSearchTagsContentView{
    if (!_hotSearchTagsContentView) {
        _hotSearchTagsContentView = [[UIView alloc] init];
        
        
    }
    
    return _hotSearchTagsContentView;
    
}
-(UIView*)hotSearchSuperView{
    if (!_hotSearchSuperView) {
        _hotSearchSuperView = [[UIView alloc] init];
        
        
    }
    
    return _hotSearchSuperView;
    
}
-(UIView*)searchHistorySuperView{
    if (!_searchHistorySuperView) {
        _searchHistorySuperView = [[UIView alloc] init];
        
        
    }
    
    return _searchHistorySuperView;
    
}
//- (UIView *)searchHistoryTagsContentView
//{
//    if (!_searchHistoryTagsContentView) {
//        UIView *searchHistoryTagsContentView = [[UIView alloc] init];
//        
//        _searchHistoryTagsContentView = searchHistoryTagsContentView;
//        
//        NSLog(@"%f",_searchHistoryTagsContentView.frame.size.height);
//    }
//    return _searchHistoryTagsContentView;
//}
///热门上面的分割线
-(UIView*)searchHistoryTopSeperateLine{
    if (!_searchHistoryTopSeperateLine) {
        _searchHistoryTopSeperateLine = [[UIView alloc]init];
        _searchHistoryTopSeperateLine.backgroundColor  = [UIColor clearColor];
        
        
    }
    return _searchHistoryTopSeperateLine;
}

-(UILabel*)hotSearchHeader{
    if (!_hotSearchHeader) {
        _hotSearchHeader =  [self setupTitleLabel:PYHotSearchText];
        
        
    }
    
    return _hotSearchHeader;
}
- (UILabel *)searchHistoryHeader
{
    if (!_searchHistoryHeader) {
        UILabel *titleLabel = [self setupTitleLabel:PYSearchHistoryText];
        _searchHistoryHeader = titleLabel;
    }
    return _searchHistoryHeader;
}

- (NSMutableArray *)searchHistories
{
    if (!_searchHistories) {
        _searchHistories = [NSKeyedUnarchiver unarchiveObjectWithFile:self.searchHistoriesCachePath];
        if (!_searchHistories) {
            _searchHistories = [NSMutableArray array];
        }
    }
    if (_searchHistories.count >MaxHistoryCount){
        [_searchHistories removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(MaxHistoryCount, _searchHistories.count-MaxHistoryCount)]];
    }
    
    return _searchHistories;
}

- (NSMutableArray *)colorPol
{
    if (!_colorPol) {
        NSArray *colorStrPol = @[@"009999", @"0099cc", @"0099ff", @"00cc99", @"00cccc", @"336699", @"3366cc", @"3366ff", @"339966", @"666666", @"666699", @"6666cc", @"6666ff", @"996666", @"996699", @"999900", @"999933", @"99cc00", @"99cc33", @"660066", @"669933", @"990066", @"cc9900", @"cc6600" , @"cc3300", @"cc3366", @"cc6666", @"cc6699", @"cc0066", @"cc0033", @"ffcc00", @"ffcc33", @"ff9900", @"ff9933", @"ff6600", @"ff6633", @"ff6666", @"ff6699", @"ff3366", @"ff3333"];
        NSMutableArray *colorPolM = [NSMutableArray array];
        for (NSString *colorStr in colorStrPol) {
            UIColor *color = [UIColor py_colorWithHexString:colorStr];
            [colorPolM addObject:color];
        }
        _colorPol = colorPolM;
    }
    return _colorPol;
}
/** 创建并设置标题 */
- (UILabel *)setupTitleLabel:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = FontOfSize(13);
    titleLabel.tag = 1;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = BlackColor333333;
    [titleLabel sizeToFit];
    
    
    
    return titleLabel;
}

-(XiHaoToTagsViewModel *)tagsViewModel{
    if (!_tagsViewModel) {
        _tagsViewModel = [XiHaoToTagsViewModel SceneModel];
    }
    return _tagsViewModel;
}
@end
