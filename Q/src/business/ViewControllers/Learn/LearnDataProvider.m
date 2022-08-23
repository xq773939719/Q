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
#import "LearnScrollViewController.h"

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
        },
        @{
            @"title": @"Reactive与ViewModel学习",
            @"scheme": [ReactiveViewController scheme],
        },
        @{
            @"title": @"AFNetworking学习",
            @"scheme": [AFNetworkingViewController scheme],
        },
        @{
            @"title": @"YYKik学习",
            @"scheme": [YYKitViewController scheme],
        },
        @{
            @"title": @"Swift语法",
            @"scheme": [SwiftViewController scheme],
        },
        @{
            @"title": @"多线程",
            @"scheme": [ThreadViewController scheme],
        },
        @{
            @"title": @"WebView学习",
            @"scheme": [WebViewController scheme],
        },
        @{
            @"title": @"UIDevice学习",
            @"scheme": [DeviceViewController scheme],
        },
        @{
            @"title": @"Flutter学习",
            @"scheme": [BusinessFlutterViewController scheme],
        },
        @{
            @"title": @"IGList学习",
            @"scheme": [IGListViewController scheme],
        },
        @{
            @"title": @"嵌套ScrollView",
            @"scheme": [LearnScrollViewController scheme],
        }
    ];
}

@end
