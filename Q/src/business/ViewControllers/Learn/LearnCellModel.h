//
//  LearnCellModel.h
//
//  Created by XQ on 2022/1/24.
//

#import "BusinessHeader.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^LearnCellModelClickBlock)(void);

@interface LearnCellModel : NSObject

@property(nonatomic, strong, readonly) NSString *title;
@property(nonatomic, copy, readonly) LearnCellModelClickBlock onClick;

- (instancetype)initWithTitle:(NSString *)title onCilck:(LearnCellModelClickBlock)onClick NS_DESIGNATED_INITIALIZER;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
