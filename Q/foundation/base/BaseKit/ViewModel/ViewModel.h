//
//  ViewModel.h
//  Q
//
//  Created by XQ on 2022/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

@property (nonatomic, weak) UIView *delegate;

- (void)bind;

@end

NS_ASSUME_NONNULL_END
