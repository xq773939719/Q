//
//  BaseViewController.h
//
//  Created by XQ on 2022/1/24.
//

#import "FoundationHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class ViewModel;

@protocol ViewModelBindable <NSObject>

- (void)bindViewModel:(ViewModel *)viewModel;

@end

@interface BaseViewController : UIViewController <ViewModelBindable>

@property (nonatomic, strong, readonly) NSMutableArray<ViewModel *> *viewModels;

@end

NS_ASSUME_NONNULL_END
