//
//  RuntimeViewController.m
//
//  Created by XQ on 2023/12/6.
//

#import "RuntimeViewController.h"
#import "RuntimeModel.h"

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

+ (NSString *)scheme {
    return @"q://vc/runtime";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ARuntimeModel *a = [ARuntimeModel new];
    [a aFunc];
}

@end
