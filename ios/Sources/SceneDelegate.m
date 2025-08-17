//
//  SceneDelegate.m
//  moneymanager
//
//  Created by Christian Gann on 2025/1/20.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
  if ([scene isKindOfClass:[UIWindowScene class]]) {
    UIWindowScene* windowScene = (UIWindowScene*)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    NSString* storyboardName = @"Welcome";
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController* viewController = [storyboard instantiateInitialViewController];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
  }
}


- (void)sceneDidDisconnect:(UIScene *)scene {

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
}


@end
