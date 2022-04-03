//
//  LearnDataProvider.m
//
//  Created by XQ on 2022/1/24.
//

#import "LearnDataProvider.h"

#import "LearnCellModel.h"

#import "BusinessFlutterViewController.h"
#import "IJKViewController.h"
#import "EngineViewController.h"
#import "ReactNativeViewController.h"
#import "OpenGLViewController.h"
#import "ReactiveViewController.h"
#import "AFNetworkingViewController.h"
#import "YYKitViewController.h"
#import "Q-Swift.h"
#import "ThreadViewController.h"

@interface LearnDataProvider ()

@end

@implementation LearnDataProvider

- (NSArray<LearnCellModel *> *)models {
    NSMutableArray *array = [NSMutableArray array];
    
    LearnCellModel *flutterModel = [LearnCellModel new];
    flutterModel.title = @"Flutter";
    flutterModel.onClick = ^{
        [[Router share] route:[BusinessFlutterViewController scheme] withParams:nil];
    };
    // [array addObject:flutterModel];
    
    LearnCellModel *ijkModel = [LearnCellModel new];
    ijkModel.title = @"IJK";
    ijkModel.onClick = ^{
        [[Router share] route:[IJKViewController scheme] withParams:nil];
    };
    // [array addObject:ijkModel];
    
    LearnCellModel *engineModel = [LearnCellModel new];
    engineModel.title = @"Engine";
    engineModel.onClick = ^{
        [[Router share] route:[EngineViewController scheme] withParams:nil];
    };
    // [array addObject:engineModel];
    
    LearnCellModel *rnModel = [LearnCellModel new];
    rnModel.title = @"ReactNative";
    rnModel.onClick = ^{
        [[Router share] route:[ReactNativeViewController scheme] withParams:nil];
    };
    // [array addObject:rnModel];
    
    LearnCellModel *openGLModel = [LearnCellModel new];
    openGLModel.title = @"OpenGL学习";
    openGLModel.onClick = ^{
        [[Router share] route:[OpenGLViewController scheme] withParams:nil];
    };
     [array addObject:openGLModel];
    
    LearnCellModel *reactiveModel = [LearnCellModel new];
    reactiveModel.title = @"Reactive与ViewModel学习";
    reactiveModel.onClick = ^{
        [[Router share] route:[ReactiveViewController scheme] withParams:nil];
    };
    [array addObject:reactiveModel];
    
    LearnCellModel *afModel = [LearnCellModel new];
    afModel.title = @"AFNetworking学习";
    afModel.onClick = ^{
        [[Router share] route:[AFNetworkingViewController scheme] withParams:nil];
    };
    [array addObject:afModel];
    
    LearnCellModel *yyKitModel = [LearnCellModel new];
    yyKitModel.title = @"YYKik学习";
    yyKitModel.onClick = ^{
        [[Router share] route:[YYKitViewController scheme] withParams:nil];
    };
    [array addObject:yyKitModel];
    
    LearnCellModel *swiftModel = [LearnCellModel new];
    swiftModel.title = @"Swift语法";
    swiftModel.onClick = ^{
        [[Router share] route:[SwiftViewController scheme] withParams:nil];
    };
    [array addObject:swiftModel];
    
    LearnCellModel *threadModel = [LearnCellModel new];
    threadModel.title = @"多线程";
    threadModel.onClick = ^{
        [[Router share] route:[ThreadViewController scheme] withParams:nil];
    };
    [array addObject:threadModel];
    
    return [array copy];
}



@end
