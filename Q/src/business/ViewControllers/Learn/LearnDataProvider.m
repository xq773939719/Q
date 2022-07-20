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
#import "BusinessFlutterViewController.h"
#import "IGListViewController.h"

@interface LearnDataProvider ()

@end

@implementation LearnDataProvider

- (NSArray<LearnCellModel *> *)models {
    NSMutableArray *array = [NSMutableArray array];
    NSArray<NSDictionary *> *datas = [[self class] datas];
    [datas enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LearnCellModel *cellModel = [LearnCellModel new];
        cellModel.title = obj[@"title"];
        cellModel.onClick = ^{
            [[Router share] route:obj[@"scheme"] withParams:obj[@"params"]];
        };
        [array addObject:cellModel];
    }];
    
    return [array copy];
}

+ (NSArray<NSDictionary *> *)datas {
    return @[
        @{
            @"title": @"OpenGL学习",
            @"scheme": [OpenGLViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"Reactive与ViewModel学习",
            @"scheme": [ReactiveViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"AFNetworking学习",
            @"scheme": [AFNetworkingViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"YYKik学习",
            @"scheme": [YYKitViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"Swift语法",
            @"scheme": [SwiftViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"多线程",
            @"scheme": [ThreadViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"WebView学习",
            @"scheme": [WebViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"UIDevice学习",
            @"scheme": [DeviceViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"Flutter学习",
            @"scheme": [BusinessFlutterViewController scheme],
            @"params": @{}
        },
        @{
            @"title": @"IGList学习",
            @"scheme": [IGListViewController scheme],
            @"params": @{}
        },
    ];
}

@end
