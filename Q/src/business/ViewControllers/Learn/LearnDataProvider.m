//
//  LearnDataProvider.m
//
//  Created by XQ on 2022/1/24.
//

#import "LearnDataProvider.h"

#import "LearnCellModel.h"

#import "OpenGLViewController.h"
#import "ReactiveViewController.h"
#import "AFNetworkingViewController.h"
#import "YYKitViewController.h"
#import "Q-Swift.h"
#import "ThreadViewController.h"
#import "DeviceViewController.h"

@interface LearnDataProvider ()

@end

@implementation LearnDataProvider

- (NSArray<LearnCellModel *> *)models {
    NSMutableArray *array = [NSMutableArray array];
    
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
    
    LearnCellModel *webviewModel = [LearnCellModel new];
    webviewModel.title = @"WebView学习";
    webviewModel.onClick = ^{
        [[Router share] route:[WebViewController scheme] withParams:nil];
    };
    [array addObject:webviewModel];
    
    LearnCellModel *deviceModel = [LearnCellModel new];
    deviceModel.title = @"UIDevice学习";
    deviceModel.onClick = ^{
        [[Router share] route:[DeviceViewController scheme] withParams:nil];
    };
    [array addObject:deviceModel];
    
    return [array copy];
}

@end
