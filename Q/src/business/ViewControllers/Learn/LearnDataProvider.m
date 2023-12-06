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
#import "SDWebImageViewController.h"
#import "RuntimeViewController.h"

@interface LearnDataProvider ()

@end

@implementation LearnDataProvider

- (NSArray<LearnCellModel *> *)models {
    NSMutableArray<LearnCellModel *> *array = [NSMutableArray array];
    
    [[self class] addCellModel:array cellTitle:@"Runtime" scheme:[RuntimeViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"OpenGL" scheme:[OpenGLViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"Reactive与ViewModel" scheme:[ReactiveViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"AFNetworking" scheme:[AFNetworkingViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"YYKit" scheme:[YYKitViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"Swift" scheme:[SwiftViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"MultiThread" scheme:[ThreadViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"WebView" scheme:[WebViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"Device" scheme:[DeviceViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"Flutter" scheme:[BusinessFlutterViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"IGListKit" scheme:[IGListViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"SDWebImage" scheme:[SDWebImageViewController scheme] params:@{}];
    [[self class] addCellModel:array cellTitle:@"RXSwift" scheme:[RXSwiftViewController scheme] params:@{}];
    
    return [array copy];
}

+ (void)addCellModel:(NSMutableArray<LearnCellModel *> *)array
           cellTitle:(NSString *)title
              scheme:(NSString *)scheme
              params:(NSDictionary *)params {
    [array addObject:[[LearnCellModel alloc] initWithTitle:title
                                                   onCilck:^{
        [[Router share] route:scheme withParams:params];
    }]];
}

@end
