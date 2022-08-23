//
//  LearnScrollViewController.m
//
//  Created by XQ on 2022/8/23.
//

#import "LearnScrollViewController.h"

@interface LearnScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *rootScrollView;
@property (nonatomic, strong) UIScrollView *childScrollView;

@end

@implementation LearnScrollViewController

+ (NSString *)scheme {
    return @"q://vc/xxx";
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setupData {
    
}

- (void)setupViews {
    [self addSubview:self.rootScrollView];
    [self.rootScrollView addSubview:self.childScrollView];
}

- (void)updateViews {
    [self.rootScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rootContainer);
    }];
    @weakify(self)
    [RACObserve(self.rootScrollView, bounds) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        CGRect bounds = [x CGRectValue];
        self.rootScrollView.contentSize = CGSizeMake(bounds.size.width, bounds.size.height * 2);
    }];
    
    [self.childScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.rootContainer);
        make.height.mas_offset(200);
        make.bottom.equalTo(self.rootContainer.mas_bottom);
    }];
    
    [RACObserve(self.childScrollView, bounds) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        CGRect bounds = [x CGRectValue];
        self.childScrollView.contentSize = CGSizeMake(bounds.size.width, bounds.size.height * 2);
    }];
}

#pragma mark - Private Methods

- (UIScrollView *)rootScrollView {
    if (_rootScrollView) return _rootScrollView;
    _rootScrollView = [UIScrollView new];
    _rootScrollView.backgroundColor = [UIColor redColor];
    _rootScrollView.delegate = self;
    return _rootScrollView;
}

- (UIScrollView *)childScrollView {
    if (_childScrollView) return _childScrollView;
    _childScrollView = [UIScrollView new];
    _childScrollView.backgroundColor = [UIColor greenColor];
    _childScrollView.delegate = self;
    return _childScrollView;
}

// 滚动就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    LoggerInfo(@"只有scrollview是跟滚动状态就会调用此方法 %@", scrollView);
}

//开始拖拽时触发
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    LoggerInfo(@"开始拖拽 %@", scrollView);
}

// 结束拖拽时触发
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView  willDecelerate:(BOOL)decelerate {
    LoggerInfo(@"结束拖拽 %@", scrollView);
}

// 开始减速时触发
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    LoggerInfo(@"开始减速 %@", scrollView);
}

// 结束减速时触发（停止）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    LoggerInfo(@"结束减速（停止）%@", scrollView);
}

@end
