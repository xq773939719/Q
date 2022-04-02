//
//  LaunchViewController.h
//
//  Created by XQ on 2022/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LaunchViewControllerProtocol <NSObject>

- (void)showRootViewController;

@end

@interface LaunchViewController : UIViewController

@property (nonatomic, weak) id<LaunchViewControllerProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
