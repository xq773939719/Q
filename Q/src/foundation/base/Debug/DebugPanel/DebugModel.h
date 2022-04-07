//
//  DebugModel.h
//
//  Created by XQ on 2022/4/7.
//

#import "BaseHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface DebugModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) BaseClickCallback onClick;

@end

NS_ASSUME_NONNULL_END
