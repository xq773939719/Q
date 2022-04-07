//
//  DebugBubble.h
//
//  Created by XQ on 2022/4/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DebugBubble : NSObject

@property (nonatomic, assign, readonly) BOOL isShow;

+ (instancetype)share;

- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
