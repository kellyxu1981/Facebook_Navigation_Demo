//
//  AppDelegate.m
//  HomeWork5
//
//  Created by Kelly Xu on 4/2/14.
//  Copyright (c) 2014 iosbootcamp. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificationViewController.h"
#import "NewsfeedViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NotificationViewController *notificationVC = [[NotificationViewController alloc]init];
    UINavigationController *notificationNav = [[UINavigationController alloc]initWithRootViewController:notificationVC];
    notificationVC.title = @"Notification";
    UIBarButtonItem *navButton_left = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navIcon_search"] style:UIBarButtonItemStylePlain target:nil action:nil];
    navButton_left.tintColor = [UIColor whiteColor];
    notificationVC.navigationItem.leftBarButtonItem = navButton_left;
    
    UIBarButtonItem *navButton_right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navIcon_messages"] style:UIBarButtonItemStylePlain target:nil action:nil];
    navButton_right.tintColor = [UIColor whiteColor];
    notificationVC.navigationItem.rightBarButtonItem = navButton_right;
    
    notificationNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    notificationNav.tabBarItem.image = [UIImage imageNamed:@"notifications.png"];
    notificationNav.navigationBar.barTintColor = [UIColor colorWithRed:63/255.0 green:103/255.0 blue:169/255.0 alpha:1];
    
    NewsfeedViewController *newsfeedVC = [[NewsfeedViewController alloc]init];
    UINavigationController *newsfeedNav = [[UINavigationController alloc]initWithRootViewController:newsfeedVC];
    newsfeedVC.title = @"Newsfeed";
    newsfeedNav.tabBarItem.image = [UIImage imageNamed:@"newsfeed.png"];
    newsfeedNav.navigationBar.barTintColor = [UIColor colorWithRed:63/255.0 green:103/255.0 blue:169/255.0 alpha:1];
    newsfeedNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    

    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[newsfeedNav,notificationNav];
    
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
