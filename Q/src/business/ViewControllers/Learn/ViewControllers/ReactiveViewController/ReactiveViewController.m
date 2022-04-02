//
//  ReactiveViewController.m
//
//  Created by XQ on 2022/3/11.
//

#import "ReactiveViewController.h"
#import "ReactiveViewModel.h"

@interface ReactiveViewController () <UITextFieldDelegate>

@property (nonatomic, strong) ReactiveViewModel *viewModel;

@end

@implementation ReactiveViewController

+ (NSString *)scheme {
    return @"q://vc/reactive";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
        // 可基于ViewModel返回值装载UI
        [self setup];
    }
    return self;
}

- (void)initData {
    [self bindViewModel:self.viewModel];
}

- (void)setup {
    [self.viewModel setup];
}

#pragma mark - privat method

- (ReactiveViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [ReactiveViewModel new];
    }
    return _viewModel;
}

@end
