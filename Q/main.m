//
//  main.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import <UIKit/UIKit.h>
#import "FoundationHeader.h"
#import "BusinessApplicationDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  NSString * applicationClassName;
  @autoreleasepool {
    LoggerInfo(@"[main] -> %@", @"启动");
    applicationClassName = NSStringFromClass([UIApplication class]);
    appDelegateClassName = NSStringFromClass([BusinessApplicationDelegate class]);
  }
  

  return UIApplicationMain(argc, argv, applicationClassName, appDelegateClassName);
}
