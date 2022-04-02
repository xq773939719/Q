//
//  LearnDataProvider.h
//
//  Created by XQ on 2022/1/24.
//

#import "FoundationHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class LearnCellModel;

@interface LearnDataProvider : NSObject <BaseModelProviderProtocol>

- (NSArray<LearnCellModel *> *)models;

@end

NS_ASSUME_NONNULL_END
