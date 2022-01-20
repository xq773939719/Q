//
//  BaseObject.h
//  Q
//
//  Created by XQ on 2022/1/19.
//

#import <Foundation/Foundation.h>

#import "BaseAppStatusProtocol.h"
#import "Logger.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseProtocol

@end

@interface BaseObject : NSObject <BaseProtocol, BaseAppStatusProtocal>

@end

NS_ASSUME_NONNULL_END
