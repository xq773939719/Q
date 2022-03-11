//
//  ViewModel.m
//  Q
//
//  Created by XQ on 2022/3/11.
//

#import "BaseHeader.h"

@interface ViewModel ()

@property (nonatomic, strong) NSObject *model;

@end

@implementation ViewModel

- (void)bind {
    [self bindModel:self.model];
}

- (void)bindModel:(NSObject *)model {
    [self bindOnViewChange];
    [self bindOnModelChange];
}

- (void)bindOnViewChange {
    NSAssert(NO, @"未实现绑定方法");
}

- (void)bindOnModelChange {
    NSAssert(NO, @"未实现绑定方法");
}


@end
