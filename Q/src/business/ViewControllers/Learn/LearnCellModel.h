//
//  LearnCellModel.h
//
//  Created by XQ on 2022/1/24.
//

#import "BusinessHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface LearnCellModel : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, copy) void (^onClick)(void);

@end

NS_ASSUME_NONNULL_END
