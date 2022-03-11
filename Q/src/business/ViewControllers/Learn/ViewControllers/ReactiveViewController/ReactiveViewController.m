//
//  ReactiveViewController.m
//  Q
//
//  Created by XQ on 2022/3/11.
//

#import "ReactiveViewController.h"

@interface ReactiveViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ReactiveViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
        [self observe];
    }
    return self;
}

- (void)setup {
    [self.view addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.height.equalTo(@40);
        make.width.equalTo(self.view).offset(-40);
        make.centerX.equalTo(self.view);
    }];
}

- (void)observe {
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        LoggerInfo(@"[ReactiveViewController]%s, %@", __func__, x);
    }];
}

#pragma mark - privat method

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor grayColor];
        _textField.placeholder = @"默认";
        _textField.adjustsFontSizeToFitWidth = YES;
        _textField.minimumFontSize = 20;
    }
    return _textField;
}

@end
