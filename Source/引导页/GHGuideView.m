//
//  GHGuideView.m
//  chechengwang
//
//  Created by 刘伟 on 2017/1/19.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "GHGuideView.h"
#import "GHWalkThroughView.h"

#import "GuideTagsView.h"

#import "RegionClickViewModel.h"
#import "TagsPopView.h"
 

@interface GHGuideView ()<GHWalkThroughViewDataSource>

@property (nonatomic, strong) GHWalkThroughView* ghView ;
@property (nonatomic, strong) NSArray* descStrings;
@property (nonatomic, strong) UILabel* welcomeLabel;
@property (nonatomic, copy) DismissBlock block;

@property (nonatomic, strong) TagsPopView *tagPopView;
@property (nonatomic, strong) UIView *lastView;
@end
@implementation GHGuideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init{
    if (self = [super init]) {
        [self viewDidLoad];
    }
    return self;
}
+(instancetype)shareInstance{
    static GHGuideView *loadingView;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        loadingView = [[GHGuideView alloc]init];
    });
    return loadingView;
}
- (void)viewDidLoad
{
   
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ghView = [[GHWalkThroughView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight)];
    [self.ghView setDataSource:self];
//    [_ghView setWalkThroughDirection:GHWalkThroughViewDirectionVertical];
//    UILabel* welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
//    welcomeLabel.text = @"Welcome";
//    welcomeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40];
//    welcomeLabel.textColor = [UIColor whiteColor];
//    welcomeLabel.textAlignment = NSTextAlignmentCenter;
//    self.welcomeLabel = welcomeLabel;
    
    self.descStrings = [NSArray arrayWithObjects:@"",@"",@"",nil];
    self.ghView.floatingHeaderView = nil;
    [self.ghView setWalkThroughDirection:GHWalkThroughViewDirectionHorizontal];
    
}
-(void)showWithDismissBlock:(DismissBlock)dismissBlock{
    if(dismissBlock !=self.block){
        self.block = dismissBlock;
    }
    self.ghView.isfixedBackground = NO;
   
    
     [self.ghView showInView:[UIApplication sharedApplication].keyWindow animateDuration:0.3];
}
#pragma mark - GHDataSource

-(NSInteger) numberOfPages
{
    return self.descStrings.count;
}

- (void) configurePage:(GHWalkThroughPageCell *)cell atIndex:(NSInteger)index
{
 
    cell.title = @"";
    NSString* imageName =[NSString stringWithFormat:@"%ld.png", index+1];
    UIImage* image = [UIImage imageNamed:imageName];
    cell.titleImage = image;
    cell.desc = @"";
    cell.view.hidden = YES;
    cell.button.hidden = YES;
   
    
    if(index == 2 ){
  
        cell.view.hidden = NO;
        cell.button.hidden = NO;
        [cell.button setTitle:@"开始体验" forState:UIControlStateNormal];
        
        [cell.button setBackgroundColor:BlueColor447FF5];
        
        
        [cell.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell);
            make.right.equalTo(cell);
            make.height.mas_equalTo(80);
            make.bottom.equalTo(cell.mas_bottom).offset(-SafeAreaBottom);
        }];
        
        
        [cell.button mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).offset(15);
            make.right.equalTo(cell).offset(-15);
            make.height.mas_equalTo(50);
            make.center.equalTo(cell.view);
        }];
        
        

        cell.button.layer.cornerRadius = 5;
        cell.button.layer.masksToBounds = YES;
        [cell.button addTarget:self action:@selector(outGhView) forControlEvents:UIControlEventTouchUpInside];
        
        
        GuideTagsView *view = [[GuideTagsView alloc] init];
        [cell addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(cell);
            make.bottom.equalTo(cell.view.mas_top).offset(-10);
        }];
        
        [view.jumpButton addTarget:self action:@selector(outGhJumpView) forControlEvents:UIControlEventTouchUpInside];
        
        if (![self.lastView isNotEmpty]) {
            self.lastView = cell;
        }
    }
}

-(void)outGhJumpView{
    [_ghView  skipIntroduction];
    
    RegionClickViewModel *viewModel = [RegionClickViewModel SceneModel];
    
    viewModel.request.regionId = jumpclick;
    viewModel.request.startRequest = YES;
    
    if (self.block) {
        self.block();
    }
}
///移除
-(void)outGhView{
    if (![[XiHaoClickObject getnames] isNotEmpty]) {
        [self.lastView addSubview:self.tagPopView];
        [self.tagPopView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.lastView);
        }];
    }else{
        [_ghView  skipIntroduction];
        if (self.block) {
            self.block();
        }
    }
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (UIImage*) bgImageforPage:(NSInteger)index
{
//    NSString* imageName =[NSString stringWithFormat:@"%ld.png", index+1];
    UIImage* image = [UIImage imageWithColor:[UIColor whiteColor]];
    
    return image;
}

-(TagsPopView *)tagPopView{
    if (!_tagPopView) {
        _tagPopView = [[TagsPopView alloc] init];
    }
    return _tagPopView;
}

@end
