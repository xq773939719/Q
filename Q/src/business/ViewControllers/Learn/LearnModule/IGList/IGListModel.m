//
//  IGListModel.m
//  Q
//
//  Created by XQ on 2022/7/20.
//

#import "IGListModel.h"

@implementation IGListModel

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {
    return YES;
}

@end

@implementation IGListModelA


@end

@implementation IGListModelB

@end
