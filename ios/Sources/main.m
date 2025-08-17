//
//  main.m
//  moneymanager
//
//  Created by Christian Gann on 2025/1/20.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DB/MoneyManagerSQLite.h"
#import "Util/IdGenerator.h"

int main(int argc, char* argv[]) {
  NSString* appDelegateClassName;
  /*!
  ** 初始化本地数据库。
  */
  [[MoneyManagerSQLite sharedInstance] installDatabase];
  NSLog(@"%@",[[IdGenerator sharedInstance] generateId]);
  @autoreleasepool {
    appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
