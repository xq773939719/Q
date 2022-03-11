  //
  //  Util.m
  //  Q
  //
  //  Created by XQ on 2022/1/24.
  //

#import "Util.h"

@implementation Util

+ (UIColor*)colorFromHex:(NSString*)hex {
    NSString * newHex = hex;
    if ([newHex hasPrefix:@"#"]) {
        newHex = [newHex substringFromIndex:1];
    }
    if ([newHex hasPrefix:@"0x"]) {
        newHex = [newHex substringFromIndex:2];
    }
    if (newHex.length != 3 && newHex.length != 6 && newHex.length != 8 && newHex.length < 3) {
        return UIColor.clearColor;
    }
    NSRange range = NSMakeRange(0, 2);
    unsigned int alpha = 255,red = 0,green = 0,blue = 0;
    //Check for short hex strings
    if(newHex.length == 3) {
        //Convert to full length hex string
        newHex = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                  [newHex substringWithRange:NSMakeRange(0, 1)],[newHex substringWithRange:NSMakeRange(0, 1)],
                  [newHex substringWithRange:NSMakeRange(1, 1)],[newHex substringWithRange:NSMakeRange(1, 1)],
                  [newHex substringWithRange:NSMakeRange(2, 1)],[newHex substringWithRange:NSMakeRange(2, 1)]];
    }
    
    if (newHex.length == 8) {
        NSString * alphaStr = [newHex substringWithRange:range];
        range.location = 2;
        NSString * redStr = [newHex substringWithRange:range];
        range.location = 4;
        NSString * greenStr = [newHex substringWithRange:range];
        range.location = 6;
        NSString * blueStr = [newHex substringWithRange:range];
        [[NSScanner scannerWithString:alphaStr] scanHexInt:&alpha];
        [[NSScanner scannerWithString:redStr] scanHexInt:&red];
        [[NSScanner scannerWithString:greenStr] scanHexInt:&green];
        [[NSScanner scannerWithString:blueStr] scanHexInt:&blue];
        return [UIColor colorWithRed:[self transferColorValue:red] green:[self transferColorValue:green] blue:[self transferColorValue:blue] alpha:[self transferColorValue:alpha]];
    }
    
    if (newHex.length == 6) {
        NSString * redStr = [newHex substringWithRange:range];
        range.location = 2;
        NSString * greenStr = [newHex substringWithRange:range];
        range.location = 4;
        NSString * blueStr = [newHex substringWithRange:range];
        [[NSScanner scannerWithString:redStr] scanHexInt:&red];
        [[NSScanner scannerWithString:greenStr] scanHexInt:&green];
        [[NSScanner scannerWithString:blueStr] scanHexInt:&blue];
        return [UIColor colorWithRed:[self transferColorValue:red] green:[self transferColorValue:green] blue:[self transferColorValue:blue] alpha:[self transferColorValue:alpha]];
        
    }
    
    return UIColor.clearColor;
}

+ (CGFloat)transferColorValue:(unsigned int)value{
    
    return value/255.0;
}

@end
