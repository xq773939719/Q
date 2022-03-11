//
//  ReactiveViewModel.m
//  Q
//
//  Created by XQ on 2022/3/11.
//

#import "ReactiveViewModel.h"
#import "ReactiveModel.h"

@implementation ReactiveViewModel

- (ReactiveModel *)model {
    return [ReactiveModel new];
}

- (void)bindOnViewChange {
    UITextField *textField = (UITextField *)self.delegate;
    [[textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        LoggerInfo(@"[ReactiveViewModel]%s, %@", __func__, x);
        self.model.text = x;
    }];
}

- (void)bindOnModelChange {
    [[self.model rac_valuesForKeyPath:@"text" observer:self] subscribeNext:^(NSString *x) {
        UITextField *textField = (UITextField *)self.delegate;
        LoggerInfo(@"[ReactiveViewModel]%s, %@", __func__, x);
        textField.text = x;
    }];
}

@end
