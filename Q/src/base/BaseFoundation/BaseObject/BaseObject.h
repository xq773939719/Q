//
//  BaseObject.h
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseObject <NSObject>

@end

@interface BaseObject : NSObject <BaseObject>

@end

NS_ASSUME_NONNULL_END
