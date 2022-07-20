//
//  IGListModel.h
//  Q
//
//  Created by XQ on 2022/7/20.
//

#import "BusinessHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface IGListModel : NSObject <IGListDiffable>

@property (nonatomic, assign) NSInteger index;

@end

@interface IGListModelA : IGListModel

@property (nonatomic, copy) NSString *title;

@end

@interface IGListModelB : IGListModel

@property (nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
