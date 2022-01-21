//
//  UIViewController+Configuration.h
//  Q
//
//  Created by XQ on 2022/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Configuration)

@property (nonatomic, strong) NSString *viewControllerName;
@property (nonatomic, strong) NSDictionary *params;

@property (nonatomic, strong) NSString *tabBarTitle;
@property (nonatomic, strong) NSString *tabBarIcon;

@property (nonatomic, strong) NSString *navigationTitle;

  // ...

@end

NS_ASSUME_NONNULL_END
