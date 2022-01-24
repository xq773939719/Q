//
//  Util.h
//  Q
//
//  Created by XQ on 2022/1/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define RGB(r, g, b)         [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBA(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]
#define HEX(str)             [Util colorFromHex:str];

typedef void(^BaseClickCallback)(void);

@class UIColor;

@interface Util : NSObject

///将hex值转换成颜色
+ (UIColor*)colorFromHex:(NSString*)hex;
+ (CGFloat)transferColorValue:(unsigned int)value;

@end

NS_ASSUME_NONNULL_END
