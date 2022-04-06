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

- (void)setupData {
    [super setupData];
    [self bindViewModel:self.viewModel];
}

- (void)setupViews {
    [super setupViews];
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
