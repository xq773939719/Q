//
//  BusinessRouteManager.m
//
//  Created by XQ on 2022/1/29.
//

#import "BusinessRouteManager.h"

// 
#import "HomeViewController.h"
#import "FeatureViewController.h"
#import "ThirdViewController.h"
#import "MineViewController.h"
#import "LearnViewController.h"

//
#import "OpenGLViewController.h"
#import "ReactiveViewController.h"
#import "AFNetworkingViewController.h"
#import "YYKitViewController.h"
#import "Q-Swift.h"
#import "ThreadViewController.h"

@implementation BusinessRouteManager

- (void)registerViewControllers {
    [[Router share] registerScheme:[HomeViewController scheme] withClass:[HomeViewController class]];
    [[Router share] registerScheme:[FeatureViewController scheme] withClass:[FeatureViewController class]];
    [[Router share] registerScheme:[ThirdViewController scheme] withClass:[ThirdViewController class]];
    [[Router share] registerScheme:[MineViewController scheme] withClass:[MineViewController class]];
    [[Router share] registerScheme:[LearnViewController scheme] withClass:[LearnViewController class]];
    
    [[Router share] registerScheme:[OpenGLViewController scheme] withClass:[OpenGLViewController class]];
    [[Router share] registerScheme:[ReactiveViewController scheme] withClass:[ReactiveViewController class]];
    [[Router share] registerScheme:[AFNetworkingViewController scheme] withClass:[AFNetworkingViewController class]];
    [[Router share] registerScheme:[YYKitViewController scheme] withClass:[YYKitViewController class]];
    [[Router share] registerScheme:[SwiftViewController scheme] withClass:[SwiftViewController class]];
    [[Router share] registerScheme:[ThreadViewController scheme] withClass:[ThreadViewController class]];
}

@end
