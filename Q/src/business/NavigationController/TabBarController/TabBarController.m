//
//  TabBarController.m
//
//  Created by XQ on 2022/1/19.
//

#import "TabBarController.h"

#import "TabBarControllerDataProvider.h"

@interface TabBarController ()

@property (nonatomic, strong) TabBarControllerDataProvider<BaseModelProviderProtocol> *dataProvider;

@end

@implementation TabBarController

+ (void)load {
    [self share];
}

+ (instancetype)share {
    static TabBarController * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [TabBarController new];
        }
    });
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
}

- (void)createViewControllers {
    self.dataProvider = [TabBarControllerDataProvider new];
    NSArray<UINavigationController *> *childViewControllers = [self.dataProvider models];
    for (UIViewController* childViewController in childViewControllers) {
        [self addChildViewController:childViewController];
    }
    
}


@end
