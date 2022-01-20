//
//  BaseApplication.h
//  Q
//
//  Created by XQ on 2022/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BaseWindow;

@interface BaseApplication : UIApplication

@property (nonatomic, strong) BaseWindow *window;

@end

NS_ASSUME_NONNULL_END
