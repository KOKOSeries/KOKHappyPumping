//
//  SceneDelegate.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "KOKWindowHelperVC.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
//    UIWindow *window2 = [[UIWindow alloc]initWithWindowScene:(UIWindowScene *)scene];
//    window2.windowLevel = self.window.windowLevel + 1;
//    UIViewController *vc =     [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
//    window2.rootViewController = vc;
//    [window2.rootViewController.view addSubview:self.window];
    [[KOKWindowHelperVC shared] enable];
    
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


@end

//    UIWindowScene *windowScene = (UIWindowScene *)scene;
//        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
//        self.window.frame = windowScene.coordinateSpace.bounds;
//        self.window.rootViewController = [UITabBarController new];
//        [self.window makeKeyAndVisible];
////
 
 
//    UIWindow *window = [[UIWindow alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    window.backgroundColor = [UIColor redColor];
//
//    scene = window.windowScene;
//    window.windowLevel = UIWindowLevelStatusBar + 1;
//
//    [self.window addSubview:window];
//
//    self.windowScene = (UIWindowScene *)scene;
//    UIWindow *window2 = [[UIWindow alloc]initWithWindowScene:self.windowScene];
//
//    window2.frame = CGRectMake(200, 200, 200, 200);
//    UIViewController *vc =     [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
//    window2.rootViewController = vc;
//    window2.windowLevel = 1;
//    [window2 setHidden:NO];
//    [window2.rootViewController.view addSubview:self.window.rootViewController.view];
 
//    NSLog(@"%f",self.window.windowLevel);
 
//      self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
 
 
//      self.window.frame = windowScene.coordinateSpace.bounds;
//      self.window.rootViewController = [UITabBarController new];
//      [self.window makeKeyAndVisible];

//static SceneDelegate * sceneDelegate = nil;
//+ (SceneDelegate *)shared{
//    @synchronized(self){
//         if (sceneDelegate == nil) {
//
//         }
//     }
//     return sceneDelegate;
//}
