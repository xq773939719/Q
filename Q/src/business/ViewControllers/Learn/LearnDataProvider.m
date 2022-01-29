//
//  LearnDataProvider.m
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import "LearnDataProvider.h"

#import "LearnCellModel.h"
#import "BusinessRouteDefine.h"

@interface LearnDataProvider ()

@end

@implementation LearnDataProvider

- (NSArray<LearnCellModel *> *)models {
  NSMutableArray *array = [NSMutableArray array];
  
  LearnCellModel *flutterModel = [LearnCellModel new];
  flutterModel.title = @"Flutter";
  flutterModel.onCLick = ^{
    [[Router share] route:BUSINESS_FLUTTER_VIEW_CONTROLLER withParams:nil];
  };
  [array addObject:flutterModel];
  
  LearnCellModel *ijkModel = [LearnCellModel new];
  ijkModel.title = @"IJK";
  ijkModel.onCLick = ^{
    [[Router share] route:BUSINESS_IJK_VIEW_CONTROLLER withParams:nil];
  };
  [array addObject:ijkModel];
 
  LearnCellModel *engineModel = [LearnCellModel new];
  engineModel.title = @"Engine";
  engineModel.onCLick = ^{
      [[Router share] route:BUSINESS_ENGINE_VIEW_CONTROLLER withParams:nil];
  };
  [array addObject:engineModel];
  
  LearnCellModel *rnModel = [LearnCellModel new];
  rnModel.title = @"ReactNative";
  rnModel.onCLick = ^{
    [[Router share] route:BUSINESS_REACT_NATIVE_VIEW_CONTROLLER withParams:nil];
  };
  // [array addObject:rnModel];
  
  LearnCellModel *openGLModel = [LearnCellModel new];
  openGLModel.title = @"OpenGL";
  openGLModel.onCLick = ^{
    [[Router share] route:BUSINESS_OPENGL_VIEW_CONTROLLER withParams:nil];
  };
  [array addObject:openGLModel];
  
  return [array copy];
}



@end
