//
//  ViewModel.h
//
//  Created by XQ on 2022/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewModel <NSObject>

/// ① 绑定Model
- (BOOL)bind;

/// ② 装载UI
- (BOOL)setup;

@end

@interface ViewModel : NSObject <ViewModel>

@property (nonatomic, weak) UIViewController *delegate;

- (void)setupModel;
- (void)bindOnModelChange;
- (void)setupView;
- (void)bindOnViewChange;

@end

NS_ASSUME_NONNULL_END
