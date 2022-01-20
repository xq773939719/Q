//
//  main.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import <UIKit/UIKit.h>
#import "CommonApplication.h"
#import "CommonAppDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  NSString * applicationClassName;
  @autoreleasepool {
    // Setup code that might create autoreleased objects goes here.
    applicationClassName = NSStringFromClass([CommonApplication class]);
    appDelegateClassName = NSStringFromClass([CommonAppDelegate class]);
  }
  
  return UIApplicationMain(argc, argv, applicationClassName, appDelegateClassName);
}
