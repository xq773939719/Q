//
//  LearnDataProvider.m
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import "LearnDataProvider.h"
#import "LearnCellModel.h"

@interface LearnDataProvider ()

@end

@implementation LearnDataProvider

- (NSArray<LearnCellModel *> *)models {
  NSMutableArray *array = [NSMutableArray array];
  
  LearnCellModel *flutterModel = [LearnCellModel new];
  flutterModel.title = @"Flutter";
  flutterModel.onCLick = ^{
    [[Router share] route:@"q://vc/business_flutter" withParams:@{}];
  };
  [array addObject:flutterModel];
  
  LearnCellModel *ijkModel = [LearnCellModel new];
  ijkModel.title = @"IJK";
  ijkModel.onCLick = ^{
    [[Router share] route:@"q://vc/ijk" withParams:@{}];
  };
  [array addObject:ijkModel];
 
  LearnCellModel *engineModel = [LearnCellModel new];
  engineModel.title = @"Engine";
  engineModel.onCLick = ^{
      [[Router share] route:@"q://vc/engine" withParams:@{}];
  };
  [array addObject:engineModel];
  
  LearnCellModel *rnModel = [LearnCellModel new];
  rnModel.title = @"ReactNative";
  rnModel.onCLick = ^{
    [[Router share] route:@"q://vc/rn" withParams:@{}];
  };
  [array addObject:rnModel];
  
  return [array copy];
}



@end
