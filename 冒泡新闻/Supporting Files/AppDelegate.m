//
//  AppDelegate.m
//  冒泡新闻
//
//  Created by 小葵花 on 16/3/2.
//  Copyright © 2016年 泡泡. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    self.window = [[UIWindow alloc]initWithFrame:SCREEN_BOUNDS];
    self.window.backgroundColor =[UIColor colorWithRed:1.000 green:0.998 blue:0.945 alpha:1.000];
    
    [self initTabControllers];
    [self setBarColor];
    
    return YES;
}

- (void)initTabControllers{
    NSArray *controllerNames = @[@"NewsViewController",@"MediaViewController",@"TalkViewController",@"MyViewController"];
    
    NSMutableArray *controllers = [NSMutableArray array];
    //把创建的controller放到数组里面
    for (NSString *controllerClassName in controllerNames) {
        //NSClassFromString(controllerClassName) 通过字符串找到类名（runtime）
        UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(controllerClassName) alloc]init]];
        [controllers addObject:controller];
    }
    NSArray *titles = @[@"新闻",@"视听",@"爆料",@"消息"];
    UITabBarController *rootController = [[UITabBarController alloc] init];
    rootController.viewControllers = controllers;
    for (int i=0; i<rootController.viewControllers.count; i++) {
        UIBarItem *item = rootController.tabBar.items[i];
        item.title = titles[i];
        item.image = [UIImage imageNamed:titles[i]];
    }
    self.window.rootViewController = rootController;
}

//设置导航栏 和 分栏 的颜色
- (void)setBarColor{
    [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:1.000 green:0.000 blue:0.010 alpha:1.000];
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.905 green:0.911 blue:1.000 alpha:1.000];
    [UITabBar appearance].tintColor = [UIColor redColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
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

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
