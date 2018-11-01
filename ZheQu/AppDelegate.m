//
//  AppDelegate.m
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/2.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "AppDelegate.h"

#import "UMSocial.h"
#import "UMSocialWechatHandler.h"

#import "Action.h"
#import <AlipaySDK/AlipaySDK.h>
#import "AirplaneOrderDetailViewController.h"
#import "UMessage.h"
#import "MobClick.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.database = [[MyAppDatabase alloc]initWithMigrations];
    
     [UMSocialData setAppKey:shareAppKey];
    //[UMSocialWechatHandler setWXAppId:WXAppID appSecret:WXAppSecret url:shareUrl];
//    友盟统计
    UMConfigInstance.appKey = shareAppKey;
   
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
//        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//        [MobClick setAppVersion:version];
    
//     [UMCheckUpdate checkUpdateWithAppkey:shareAppKey channel:nil];
    ///添加host，正确code值
 [Action actionConfigHost:Host client:nil codeKey:@"rc" rightCode:0 msgKey:nil];
    // Override point for customization after application launch.
#pragma mark 友盟推送
    [UMessage startWithAppkey:shareAppKey launchOptions:launchOptions];
    //        [UMessage setAutoAlert:NO];//程序在前台运行时不弹出alert
    
    //register remoteNotification types
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
    action1.identifier = @"action1_identifier";
    action1.title=@"Accept";
    action1.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
    
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
    action2.identifier = @"action2_identifier";
    action2.title=@"Reject";
    action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
    action2.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
    action2.destructive = YES;
    
    UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc] init];
    categorys.identifier = @"category1";//这组动作的唯一标示
    [categorys setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];
    
    UIUserNotificationSettings *userSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert
                                                                                 categories:[NSSet setWithObject:categorys]];
    
    [UMessage registerRemoteNotificationAndUserNotificationSettings:userSettings];
    
    
    //for log
    [UMessage setLogEnabled:NO];
[NSThread sleepForTimeInterval:1]; // 设置启动页面停留时间
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[LoadingView shareInstance]ContinueAnimation];
    // 登录需要编写
    [UMSocialSnsService applicationDidBecomeActive];
    
    
}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [UMessage registerDeviceToken:deviceToken];
    
    NSString *deviceTokenString = [[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                    stringByReplacingOccurrencesOfString: @">" withString: @""]
                                   stringByReplacingOccurrencesOfString: @" " withString: @""];
//    NSLog(@"%@",deviceTokenString);
    [UmPushModel shareInstance].deviceToken = deviceTokenString;
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
   
    //如果注册不成功，打印错误信息，可以在网上找到对应的解决方案
    //1.2.7版本开始自动捕获这个方法，log以application:didFailToRegisterForRemoteNotificationsWithError开头
}
//在 didReceiveRemoteNotification 中处理消息（默认动作：点击进入消息详情页）
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    //        [UMessage didReceiveRemoteNotification:userInfo];
    NSString*alert = userInfo[@"aps"][@"alert"];
    if (!alert) {
        alert = @"有新的通知";
    }
    [AlertView showAlertWithMessage:alert confirmBlock:^{
        [[UmPushModel shareInstance] mergeFromDictionary:userInfo useKeyMapping:YES] ;
        
        if([UserModel shareInstance].userId.isNotEmpty){
            [Tool showOrderDetailVC ];
        }
        
        
    } withVC:[Tool currentViewController]];
    
    
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    
    if ([sourceApplication isEqualToString:@"com.alipay.iphoneclient"]) {
        
        
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"" message:@"支付失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert.tag =50;
        
        [[AlipaySDK defaultService]processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            
            UIViewController*vc = [Tool currentViewController];
            if ([vc isKindOfClass:[AirplaneOrderDetailViewController class]]) {
                AirplaneOrderDetailViewController*order = (AirplaneOrderDetailViewController*)vc;
                [order refreshViewControllerWithResultDict:resultDic];
            }
            
            
            
            
            
        }];
        return YES;
    }
    else{//友盟分享
        return  [UMSocialSnsService handleOpenURL:url];
    }
    return YES;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
     return  [UMSocialSnsService handleOpenURL:url];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
}

@end
