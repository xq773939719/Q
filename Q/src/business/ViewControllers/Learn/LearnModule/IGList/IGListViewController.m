//
//  IGListViewController.m
//
//  Created by XQ on 2022/7/20.
//

#import "IGListViewController.h"
#import "IGListModel.h"
#import "SectionController.h"

@interface IGListViewController () <IGListAdapterDataSource, IGListAdapterDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;

@end

@implementation IGListViewController

+ (NSString *)scheme {
    return @"q://vc/iglistVc";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adapter];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.rootContainer);
    }];
}

- (UICollectionView *)collectionView {
    if (_collectionView) return _collectionView;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    _collectionView.backgroundColor = self.view.backgroundColor;
    return _collectionView;
}

- (IGListAdapter *)adapter {
    if (_adapter) return _adapter;
    IGListAdapterUpdater *updater = [IGListAdapterUpdater new];
    _adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self];
    _adapter.collectionView = self.collectionView;
    _adapter.dataSource = self;
    _adapter.delegate = self;
    _adapter.scrollViewDelegate = self;
    return _adapter;
}

#pragma mark - IGListAdapterDataSource
- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; ++i) {
        IGListModelA *model = [IGListModelA new];
        model.index = i;
        model.title = [@"A" stringByAppendingString:@(i).stringValue];
        [array addObject:model];
    }
    
    for (NSInteger i = 0; i < 100; ++i) {
        IGListModelB *model = [IGListModelB new];
        model.index = i;
        model.title = [@"B" stringByAppendingString:@(i).stringValue];
        [array addObject:model];
    }
    
    return [array copy];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(IGListModel *)object {
    if ([object isMemberOfClass:[IGListModelA class]]) {
        return [SectionControllerA new];
    }
    if ([object isMemberOfClass:[IGListModelB class]]) {
        return [SectionControllerB new];
    }
    return nil;
}

#pragma mark - IGListAdapterDelegate

- (void)listAdapter:(IGListAdapter *)listAdapter willDisplayObject:(id)object atIndex:(NSInteger)index {
    
}

- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingObject:(id)object atIndex:(NSInteger)index {
    
}


#pragma mark - UIScrollViewDelegate




@end
