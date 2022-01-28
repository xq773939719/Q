//
//  UIViewController+Configuration.h
//  Q
//
//  Created by XQ on 2022/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Configuration)

// ViewController配置
@property (nonatomic, strong) NSString *viewControllerName;
@property (nonatomic, strong) NSDictionary *params;

// 状态栏配置
@property (nonatomic, assign) BOOL hideStatusBar;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

// Tab配置
@property (nonatomic, assign) BOOL hideTabBar;
@property (nonatomic, strong) NSString *tabBarTitle;
@property (nonatomic, strong) NSString *tabBarIcon;

// 导航栏配置
@property (nonatomic, assign) BOOL hideNavigationBar;
@property (nonatomic, strong) NSString *navigationTitle;

@end

NS_ASSUME_NONNULL_END
