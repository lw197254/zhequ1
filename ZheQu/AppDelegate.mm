//
//  AppDelegate.m
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/2.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "AppDelegate.h"


//#import <AlipaySDK/AlipaySDK.h>

//#import "WXApi.h"
#import "UMessage.h"
#import "MobClick.h"

#import "UMCheckUpdate.h"
#import "WeiboSDK.h"

#import <ShareSDK/ShareSDK.h>
#import "TabBarViewController.h"



#import "UpdateView.h"
#import "UpDateViewModel.h"

//极光推送的广告支持
//#import <AdSupport/AdSupport.h>
//#import "UMSocialSinaSSOHandler.h"
@interface AppDelegate ()
@property(strong,nonatomic)UpdateView *updateView;
@property(strong,nonatomic)UpDateViewModel *updateViewModel;

@property(strong,nonatomic)UMCheckUpdate *update;


@end


///复制代码
void uncaughtExceptionHandler(NSException *exception) {
    
    NsLog(@"reason: %@", exception);
    
    // Internal error reporting
    
}
@implementation AppDelegate





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
   
    ///为了webview中添加客户端标志
    self.database = [[MyAppDatabase alloc]initWithMigrations] ;
   
    

#pragma mark   shareSDK 分享
    [self setUpShareSDK];

    
    [self setUmeng];
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:sinaAppKey];

    
    
    // Override point for customization after application launch.
   
#ifdef DEBUG
    ///因为错误日志会后面的覆盖前面的，所以debug版本打印日志，release版本使用友盟统计，同理，setCobub 方法放到 [self setUmeng]之前，也是为了友盟错误统计能够使用，Cobub的错误统计废弃
     NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    
#else

#endif
     ///修改tabbar的默认字体颜色跟选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:BlackColor333333} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:BlueColor447FF5} forState:UIControlStateSelected];
    
    [VideoAutoPlay setAutoPlay:isnotautoPlay];
    return YES;
}



//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


//- (UIImage *)getTheLaunchImage
//{
//    CGSize viewSize = [UIScreen mainScreen].bounds.size;
//    
//    NSString *viewOrientation = nil;
//    if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown) || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait)) {
//        viewOrientation = @"Portrait";
//    } else {
//        viewOrientation = @"Landscape";
//    }
//    
//    
//    NSString *launchImage = nil;
//    
//    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
//    for (NSDictionary* dict in imagesDict)
//    {
//        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
//        
//        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
//        {
//            launchImage = dict[@"UILaunchImageName"];
//        }
//    }
//    
//    return [UIImage imageNamed:launchImage];
//    
//}



//- (void)applicationDidBecomeActive:(UIApplication *)application
//{
////    [[LoadingView shareInstance]ContinueAnimation];
//    // 登录需要编写
////    [UMSocialSnsService applicationDidBecomeActive];
//    
//    
//}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
//    [UMessage registerDeviceToken:deviceToken];
    
    NSString *deviceTokenString = [[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                    stringByReplacingOccurrencesOfString: @">" withString: @""]
                                   stringByReplacingOccurrencesOfString: @" " withString: @""];
    NSLog(@"%@",deviceTokenString);
//    [UmPushModel shareInstance].deviceToken = deviceTokenString;
   
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
   
    //如果注册不成功，打印错误信息，可以在网上找到对应的解决方案
    //1.2.7版本开始自动捕获这个方法，log以application:didFailToRegisterForRemoteNotificationsWithError开头
}




//- (void)application:(UIApplication *)application
//didReceiveLocalNotification:(UILocalNotification *)notification {
//    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
//}


//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
////     return  [UMSocialSnsService handleOpenURL:url];
//}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}



- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [VideoAutoPlay setAutoPlay:isnotautoPlay];
    
}

-(void)setUpShareSDK{
    /**
     *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册，
     *  在将生成的AppKey传入到此方法中。
     *  方法中的第二个第三个参数为需要连接社交平台SDK时触发，
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
     */
     [WXApi registerApp:weichatAppId];
    
    [ShareSDK registerApp:shareSDKAppKey
     
          activePlatforms:@[@(SSDKPlatformSubTypeQZone),
                            @(SSDKPlatformSubTypeWechatSession),
                            @(SSDKPlatformSubTypeWechatTimeline),
                            @(SSDKPlatformSubTypeQQFriend),@(SSDKPlatformTypeSinaWeibo)]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 //                             [ShareSDKConnector connectWeChat:[WXApi class]];
                 [ShareSDKConnector connectWeChat:[WXApi class] delegate:self];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class]
                            tencentOAuthClass:[TencentOAuth class]];
                 break;
            case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:weichatAppId
                                       appSecret:weichatAppSecret];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:QQAppId
                                      appKey:QQAppSecret
                                    authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [appInfo SSDKSetupSinaWeiboByAppKey:sinaAppKey appSecret:sinaAppSecret redirectUri:sinaShareCallBack authType:SSDKAuthTypeBoth];
             default:
                 break;
         }
     }];
}

-(void)setUmeng{
    
    //检测更新
//    [UMCheckUpdate checkUpdateWithAppID:appleID];
    // 友盟统计
    UMConfigInstance.appKey = UmengAppKey;
    UMConfigInstance.channelId = nil;
    [MobClick startWithConfigure:UMConfigInstance];
    //设置收集版本为版本号而非build号
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    
    if (!self.update) {
        self.update= [UMCheckUpdate sharedInstance];
        
//        @weakify(self);
//        [[RACObserve(self,update) filter:^BOOL(id value) {
//            return self.update.isNeedUpdate;
//        }]subscribeNext:^(id x) {
//            //需要更新的时候就要展示 ture 为展示
//            @strongify(self);
//            if (x) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self setLocationUpdate];
//                });
//            }else{
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self checkoutNotification];
//                });
//            }
//        }];
        
        [self.update checkUpdateWithAppID:appleID checkUpdateUrl:nil homeUrl:nil title:nil cancelButtonTitle:nil otherButtonTitles:nil];
        
        @weakify(self);
        [RACObserve(self.update,isNeedUpdate) subscribeNext:^(id x) {
            //需要更新的时候就要展示 ture 为展示
            @strongify(self);
            if (self.update.isNeedUpdate ==NeedUpdate) {
                  NSLog(@"需要升级");
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self setLocationUpdate];
                });
            }else{
                return ;
            }
        }];
        
//        [self.update checkUpdateWithAppID:appleID checkUpdateUrl:nil homeUrl:nil title:nil cancelButtonTitle:nil otherButtonTitles:nil];

    }
    
    
}



-(void)setLocationUpdate{
    
    @weakify(self)
    [[RACObserve(self.updateViewModel, data)filter:^BOOL(id value) {
        return self.updateViewModel.data.isNotEmpty;
    }]subscribeNext:^(id x) {
        @strongify(self)
        [self.window addSubview:self.updateView];
        [self.updateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.window);
        }];
 
        self.updateView.messagelabel.text = self.updateViewModel.data.des ;
    }];
    
    NSLog(@"开始升级测试测试测试");
    NSString * systemVersion = [UIDevice currentDevice].systemVersion;
    self.updateViewModel.request.channel=@"guanwang";
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    self.updateViewModel.request.versionCode = systemVersion;
    self.updateViewModel.request.startRequest = YES;
    
}





@end
