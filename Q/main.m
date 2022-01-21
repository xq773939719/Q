//
//  main.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import <UIKit/UIKit.h>
#import "BaseHeader.h"
#import "BusinessApplicationDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  NSString * applicationClassName;
  @autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    applicationClassName = NSStringFromClass([BaseApplication class]);
    appDelegateClassName = NSStringFromClass([BusinessApplicationDelegate class]);
  }
  
  return UIApplicationMain(argc, argv, applicationClassName, appDelegateClassName);
}
