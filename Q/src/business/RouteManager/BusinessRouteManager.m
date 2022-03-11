//
//  BusinessRouteManager.m
//  Q
//
//  Created by XQ on 2022/1/29.
//

#import "BusinessRouteManager.h"
#import "BusinessRouteDefine.h"

// 
#import "HomeViewController.h"
#import "FeatureViewController.h"
#import "ThirdViewController.h"
#import "MineViewController.h"
#import "LearnViewController.h"

//
#import "BusinessFlutterViewController.h"
#import "IJKViewController.h"
#import "EngineViewController.h"
#import "ReactNativeViewController.h"
#import "OpenGLViewController.h"
#import "ReactiveViewController.h"

@implementation BusinessRouteManager

- (void)registerViewControllers {
    [[Router share] registerScheme:BUSINESS_HOME_VIEW_CONTROLLER withClass:[HomeViewController class]];
    [[Router share] registerScheme:BUSINESS_FEATURE_VIEW_CONTROLLER withClass:[FeatureViewController class]];
    [[Router share] registerScheme:BUSINESS_THIRD_VIEW_CONTROLLER withClass:[ThirdViewController class]];
    [[Router share] registerScheme:BUSINESS_MINE_VIEW_CONTROLLER withClass:[MineViewController class]];
    [[Router share] registerScheme:BUSINESS_LEARN_VIEW_CONTROLLER withClass:[LearnViewController class]];
    
    [[Router share] registerScheme:BUSINESS_FLUTTER_VIEW_CONTROLLER withClass:[BusinessFlutterViewController class]];
    [[Router share] registerScheme:BUSINESS_IJK_VIEW_CONTROLLER withClass:[IJKViewController class]];
    [[Router share] registerScheme:BUSINESS_ENGINE_VIEW_CONTROLLER withClass:[EngineViewController class]];
    [[Router share] registerScheme:BUSINESS_REACT_NATIVE_VIEW_CONTROLLER withClass:[ReactNativeViewController class]];
    [[Router share] registerScheme:BUSINESS_OPENGL_VIEW_CONTROLLER withClass:[OpenGLViewController class]];
    [[Router share] registerScheme:BUSINESS_REACTIVE_VIEW_CONTROLLER withClass:[ReactiveViewController class]];
}

@end
