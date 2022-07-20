//
//  SectionController.m
//  Q
//
//  Created by XQ on 2022/7/20.
//

#import "SectionController.h"
#import "IGListModel.h"

@interface SectionController ()

@end

@implementation SectionController

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
    cell.contentView.alpha = rand() * 100 / 100;
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
    cell.contentView.alpha = rand() * 100 / 100;
    return cell;
}

@end
