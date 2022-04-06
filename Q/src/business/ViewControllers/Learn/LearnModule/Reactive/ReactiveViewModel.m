//
//  ReactiveViewModel.m
//
//  Created by XQ on 2022/3/11.
//

#import "ReactiveViewModel.h"
#import "ReactiveModel.h"

@interface ReactiveViewModel ()

@property (nonatomic, strong) ReactiveModel *model;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField1;
@property (nonatomic, strong) UITextField *textField2;

@end

@implementation ReactiveViewModel

- (ReactiveModel *)model {
    return _model;
}

- (void)setupModel {
    if (!_model) {
        _model = [ReactiveModel new];
    }
}

- (void)bindOnModelChange {
    [RACObserve(self.model, text) subscribeNext:^(NSString * _Nullable x) {
        LoggerInfo(@"[ReactiveViewModel]%s, %@", __func__, x);
        self.label.text = x;
    }];
}

- (void)setupView {
    [self.delegate addSubview:self.textField1];
    [self.textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(self.delegate.view).offset(-40);
        make.centerX.equalTo(self.delegate.view);
        make.centerY.equalTo(self.delegate.view).offset(-40);
    }];
    
    [self.delegate addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(self.delegate.view).offset(-40);
        make.centerX.equalTo(self.delegate.view);
        make.centerY.equalTo(self.delegate.view);
    }];
    
    [self.delegate addSubview:self.textField2];
    [self.textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.textField1);
        make.width.equalTo(self.textField1);
        make.centerX.equalTo(self.textField1);
        make.centerY.equalTo(self.delegate.view).offset(40);
    }];
}

- (void)bindOnViewChange {
    [[self.textField1 rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        self.label.text = x;
    }];
    
    [[self.textField2 rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        self.model.text = x;
    }];
}

#pragma mark - UI

- (UILabel *)label {
    if (_label) {
        return _label;
    }
    _label = [UILabel new];
    _label.backgroundColor = [UIColor colorWithHexString:@"#aa2231"];
    return _label;
}

- (UITextField *)textField1 {
    if (_textField1) {
        return _textField1;
    }
    _textField1 = [UITextField new];
    _textField1.layer.cornerRadius = 5;
    _textField1.backgroundColor = [UIColor colorWithHexString:@"#334223"];
    _textField1.adjustsFontSizeToFitWidth = YES;
    _textField1.minimumFontSize = 20;
    _textField1.returnKeyType = UIReturnKeyDone;
    return _textField1;
}

- (UITextField *)textField2 {
    if (_textField2) {
        return _textField2;
    }
    _textField2 = [UITextField new];
    _textField2.layer.cornerRadius = 5;
    _textField2.backgroundColor = [UIColor colorWithHexString:@"#666766"];
    _textField2.adjustsFontSizeToFitWidth = YES;
    _textField2.minimumFontSize = 20;
    _textField2.returnKeyType = UIReturnKeyDone;
    return _textField2;
}

@end
