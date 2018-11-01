//
//  Aspect-net.m
//  PrivateOrdering
//
//  Created by 刘伟 on 16/3/24.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "TabBarViewController.h"
#import "ParentViewController.h"
#import "Timer.h"
#import "AdView.h"
#import "GHGuideView.h"
#import "HomeViewController.h"
#import "CustomNavigationController.h"
#import "MyAction.h"
#import "NetWorkStatus.h"

#import "JustOnceClickTool.h"

#define AtAspect Window
#define AtAspectOfClass AppDelegate
@classPatchField(AppDelegate)
AspectPatch(-, void, application:(UIApplication*)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions){
    ///添加host，正确code值
    [MyAction actionConfigHost:Host client:nil codeKey:@"code" rightCode:0 msgKey:nil];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   
    ParentViewController *view = [[ParentViewController alloc]init];
//    TabBarViewController*tab = [[TabBarViewController alloc]init];
    self.window.rootViewController = view;
    [self.window makeKeyAndVisible];
    
    
    TabBarViewController*tab = [[TabBarViewController alloc]init];
    CustomNavigationController*nav = [tab.viewControllers firstObject];
    HomeViewController*vc = [nav.rt_viewControllers firstObject];
    
    NSString* obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"guide"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
  
    if(!obj.isNotEmpty||![obj isEqual:version]){
        [JustOnceClickTool setRightClickTimes:YES];
        GHGuideView*guide = [GHGuideView shareInstance];

        [guide showWithDismissBlock:^{
            self.window.rootViewController = tab;
            vc.guideFinished = YES;
        }];


        [[NSUserDefaults standardUserDefaults]setObject:version forKey:@"guide" ];
        [[NSUserDefaults standardUserDefaults] synchronize];


    }else{

        self.window.rootViewController = tab;
        vc.guideFinished = YES;

        [AdView showAdViewOnWindow:self.window complateBlock:^{
            self.window.rootViewController = tab;
            vc.guideFinished = YES;

        }];
    }


   
    
//    UINavigationController*nav  = tab.rt_viewControllers[0];
//    
//     GuideViewController*guide = [[GuideViewController alloc]init];
    
    
    [[SDImageCache sharedImageCache]setMaxCacheSize:1024*1024*MaxCacheSize];
    [[SDImageCache sharedImageCache] cleanDisk];
   
   
    
///状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
   static BOOL isfirst = YES;
    [[$ rac_didNetworkChanges]
     subscribeNext:^(NSNumber *status) {
         AFNetworkReachabilityStatus networkStatus = [status intValue];
         switch (networkStatus) {
             case AFNetworkReachabilityStatusUnknown:
             case AFNetworkReachabilityStatusNotReachable:
//                 [DataCenter sharedInstance].isWifi = NO;
//                 因为第一次会监听初始值变化，故第一次的网络状态并不是真正的网络状态
                 if(isfirst!=YES){
                 [[DialogView sharedInstance] showDlg:self.window textOnly:@"网络连接不给力"];
                 }
                 isfirst = NO;
                 break;
             case AFNetworkReachabilityStatusReachableViaWWAN:
                 [NetWorkStatus  setIsWifi:isnotwifi];
//                 [DataCenter sharedInstance].isWifi = NO;
//                 [[DialogUtil sharedInstance] showDlg:self.window textOnly:@"当前使用移动数据网络"];
                 break;
             case AFNetworkReachabilityStatusReachableViaWiFi:
                 [NetWorkStatus setIsWifi:iswifi];
//                 [DataCenter sharedInstance].isWifi = YES;
//                 [[DialogUtil sharedInstance] showDlg:self.window textOnly:@"当前使用WiFi网络"];
                 break;
         }
     }];
 XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

//-(void)addLaunchImage{
//    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
//    UIView* lunchView = viewController.view;
//    //    lunchView.frame = CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
//    [self.window addSubview:lunchView];
//    [lunchView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.left.top.equalTo(self.window);
//        make.bottom.equalTo(self.window).offset(-50);
//    }];
//    UIImageView *imageV = [[UIImageView alloc] init];
//    [lunchView addSubview:imageV];
//    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(lunchView);
//        make.bottom.equalTo(lunchView).with.offset(-120);
//    }];
//    [self.window bringSubviewToFront:lunchView];
//    NSDictionary*dict =  [[NSUserDefaults standardUserDefaults]objectForKey:launchScreenImage];
//    
//    AdModel*model = [[AdModel alloc]initWithDictionary:dict error:nil];
//    
//    if (model.isNotEmpty) {
//        NSDate*date = [NSDate date];
//        NSDate*beginDate = [NSDate dateWithString:model.begintime format: @"yyyy-MM-dd HH:mm:ss"];
//        NSDate*endDate = [NSDate dateWithString:model.endtime format: @"yyyy-MM-dd HH:mm:ss"];
//        if ([date timeIntervalSinceDate:beginDate]>=0&&[endDate timeIntervalSinceDate:date]>=0) {
//            [imageV sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage: [UIImage imageWithColor:[UIColor whiteColor]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                [UIView animateWithDuration:model.delay delay:1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//                    lunchView.alpha = 0.0f;
//                    //        imageV.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0f, 2.0f, 1.0f);
//                } completion:^(BOOL finished) {
//                    [lunchView removeFromSuperview];
//                    TabBarViewController*tab = [[TabBarViewController alloc]init];
//                    self.window.rootViewController = tab;
//                    [self.window makeKeyAndVisible];
//                    NSString* obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"guide"];
//                    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//                    if(!obj.isNotEmpty||![obj isEqual:version]){
//                        GHGuideView*guide = [GHGuideView shareInstance];
//                        
//                        [guide show];
//                        
//                        
//                        [[NSUserDefaults standardUserDefaults]setObject:version forKey:[NSString stringWithFormat:@"guide"] ];
//                    }
//
//                }];
//                
//            }];
//            
//        }
//        
//    }else{
//        imageV.image = [UIImage imageWithColor:[UIColor whiteColor]] ;
//        [UIView animateWithDuration:1.5f delay:1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//            lunchView.alpha = 0.0f;
//            //        imageV.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0f, 2.0f, 1.0f);
//        } completion:^(BOOL finished) {
//            [lunchView removeFromSuperview];
//            TabBarViewController*tab = [[TabBarViewController alloc]init];
//            self.window.rootViewController = tab;
//            [self.window makeKeyAndVisible];
//            NSString* obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"guide"];
//            NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//            if(!obj.isNotEmpty||![obj isEqual:version]){
//                GHGuideView*guide = [GHGuideView shareInstance];
//                
//                [guide show];
//                
//                
//                [[NSUserDefaults standardUserDefaults]setObject:version forKey:[NSString stringWithFormat:@"guide"] ];
//            }
//
//            //             NSString* obj = [[NSUserDefaults standardUserDefaults] objectForKey:@"guideshow"];
//            //            /// 设置第一次对象进来，不要变色
//            //            if(obj.isNotEmpty){
//            //                [self setStatusBarBackgroundColor:LightBlueColor];
//            //                [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//            //            }else{
//            //                [[NSUserDefaults standardUserDefaults]setObject:@"guideshow" forKey:[NSString stringWithFormat:@"guideshow"] ];
//            //            }
//            
//        }];
//        
//    }
//    
//}
//
@end
