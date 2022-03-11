//
//  UIView+ViewModel.m
//  Q
//
//  Created by XQ on 2022/3/11.
//

#import "UIView+ViewModel.h"

static NSString *viewModelKey = @"viewModelKey";

@interface UIView (ViewModel)

@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation UIView (ViewModel)

- (void)bindViewModel:(ViewModel *)viewModel {
    viewModel.delegate = self;
    objc_setAssociatedObject(self, &viewModelKey, viewModel, OBJC_ASSOCIATION_RETAIN);
    [viewModel bind];
}

@end
