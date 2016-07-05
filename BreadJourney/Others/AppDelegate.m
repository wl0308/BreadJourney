//
//  AppDelegate.m
//  面包旅行
//
//  Created by administrator on 15/10/24.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import "AppDelegate.h"
#import "RecommendViewController.h"
#import "CityhunterViewController.h"
#import "destinationViewController.h"
#import "MyViewController.h"
#import "TabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
    RecommendViewController *recommendVC = [[RecommendViewController alloc] initWithNibName:@"RecommendViewController" bundle:nil];
    CityhunterViewController *cityhunterVC = [[CityhunterViewController alloc]initWithNibName:@"CityhunterViewController" bundle:nil];
    destinationViewController *destinationVC = [[destinationViewController alloc] initWithNibName:@"destinationViewController" bundle:nil];
    MyViewController *myVC = [[MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil];
    
    self.recommendNavController = [[UINavigationController alloc] initWithRootViewController:recommendVC];
    self.cityhunterNavController = [[UINavigationController alloc] initWithRootViewController:cityhunterVC];
    self.destinationNavController = [[UINavigationController alloc] initWithRootViewController:destinationVC];
    self.myNavController = [[UINavigationController alloc] initWithRootViewController:myVC];
    
    
    TabBarViewController *tabBarController = [[TabBarViewController alloc] init];
    tabBarController.viewControllers = @[self.recommendNavController,self.cityhunterNavController,self.destinationNavController,self.myNavController];
    
    UINavigationController *tabBarNavController = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    
    tabBarController.navigationController.navigationBar.hidden = YES;
    
    self.window.rootViewController = tabBarNavController;
    [self.window makeKeyAndVisible];
    
    return YES;
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