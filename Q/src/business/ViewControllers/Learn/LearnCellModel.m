//
//  LearnCellModel.m
//
//  Created by XQ on 2022/1/24.
//

#import "LearnCellModel.h"

@interface LearnCellModel ()

@property(nonatomic, strong) NSString *title;
@property(nonatomic, copy) LearnCellModelClickBlock onClick;

@end

@implementation LearnCellModel

- (instancetype)initWithTitle:(NSString *)title onCilck:(LearnCellModelClickBlock)onClick {
    self = [super init];
    if (self) {
        _title = title;
        _onClick = onClick;
    }
    return self;
}

@end
