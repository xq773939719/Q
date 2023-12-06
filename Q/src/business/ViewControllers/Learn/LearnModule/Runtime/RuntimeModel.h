//
//  RuntimeModel.h
//
//  Created by XQ on 2023/12/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARuntimeModel : NSObject

- (void)aFunc;

- (void)bFunc;

@end

@interface BRuntimeModel : NSObject

- (void)aFunc;

- (void)hook;

@end

NS_ASSUME_NONNULL_END
