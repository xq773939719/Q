//
//  FeatureNavigationController.m
//
//  Created by XQ on 2022/1/19.
//

#import "FeatureNavigationController.h"

#import "FeatureViewController.h"

@interface FeatureNavigationController ()

@end

@implementation FeatureNavigationController

+ (instancetype)share {
    static FeatureNavigationController * instance;
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
            [FeatureViewController new]
        ]];
    }
    
    self.tabBarItem.title = self.viewControllers.firstObject.tabBarTitle;
    self.tabBarItem.image = [UIImage imageNamed: @"feature"];
    
    return self;
}

@end
