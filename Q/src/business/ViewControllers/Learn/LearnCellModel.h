//
//  LearnCellModel.h
//
//  Created by XQ on 2022/1/24.
//

#import "FoundationHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface LearnCellModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) BaseClickCallback onClick;

@end

NS_ASSUME_NONNULL_END
