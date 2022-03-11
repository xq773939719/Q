//
//  HomeNavigationController.m
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import "HomeNavigationController.h"

#import "HomeViewController.h"

@interface HomeNavigationController ()

@end

@implementation HomeNavigationController

+ (instancetype)share {
    static HomeNavigationController * instance;
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
            [HomeViewController new]
        ]];
    }
    
    self.tabBarItem.title = self.viewControllers.firstObject.tabBarTitle;
    self.tabBarItem.image = [UIImage imageNamed: @"home"];
    
    return self;
}

@end
