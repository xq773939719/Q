//
//  main.m
//
//  Created by XQ on 2022/1/19.
//

#import <UIKit/UIKit.h>
#import "BusinessHeader.h"
#import "BusinessApplicationDelegate.h"

int main(int argc, char * argv[]) {
    static NSString * appDelegateClassName;
    static NSString * applicationClassName;
    int ret = -1;
    @autoreleasepool {
        LoggerInfo(@"[main] -> %@", @"启动");
        applicationClassName = NSStringFromClass([UIApplication class]);
        appDelegateClassName = NSStringFromClass([BusinessApplicationDelegate class]);
        ret = UIApplicationMain(argc, argv, applicationClassName, appDelegateClassName);
    }
    return ret;
}
