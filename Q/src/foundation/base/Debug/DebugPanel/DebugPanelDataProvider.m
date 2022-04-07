//
//  DebugPanelDataProvider.m
//
//  Created by XQ on 2022/4/7.
//

#import "DebugPanelDataProvider.h"
#import "DebugLookinModel/DebugLookinModel.h"

@implementation DebugPanelDataProvider

- (NSArray<DebugModel *> *)models {
    NSArray *array = @[
        [DebugLookinModel new],
    ];
    
    return array;
}

@end
