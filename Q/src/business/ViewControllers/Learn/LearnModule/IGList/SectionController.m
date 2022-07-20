//
//  SectionController.m
//  Q
//
//  Created by XQ on 2022/7/20.
//

#import "SectionController.h"
#import "IGListModel.h"

@interface SectionController ()

@property (nonatomic, strong) IGListModel *model;

@end

@implementation SectionController

- (void)didUpdateToObject:(IGListModel *)object {
    _model = object;
}

- (NSInteger)numberOfItems {
    return 1;
}

@end

@implementation SectionControllerA

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 200);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class]
                                                               forSectionController:self
                                                                            atIndex:index];
    cell.contentView.backgroundColor = [UIColor redColor];
    cell.contentView.layer.borderWidth = 2;
    cell.contentView.layer.borderColor = [UIColor greenColor].CGColor;
    return cell;
}

@end

@implementation SectionControllerB

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 50);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class]
                                                               forSectionController:self
                                                                            atIndex:index];
    cell.contentView.backgroundColor = [UIColor orangeColor];
    cell.contentView.layer.borderWidth = 2;
    cell.contentView.layer.borderColor = [UIColor greenColor].CGColor;
    return cell;
}

@end
