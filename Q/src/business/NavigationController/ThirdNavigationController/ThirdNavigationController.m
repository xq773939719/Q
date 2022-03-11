//
//  ThirdNavigationController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "ThirdNavigationController.h"

#import "ThirdViewController.h"

@interface ThirdNavigationController ()

@end

@implementation ThirdNavigationController

+ (instancetype)share {
    static ThirdNavigationController * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[[self class] alloc] init];
        }
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setViewControllers: @[
            [ThirdViewController new]
        ]];
    }
    
    self.tabBarItem.title = self.viewControllers.firstObject.tabBarTitle;
    self.tabBarItem.image = [UIImage imageNamed: @"add"];
    
    return self;
}

@end
