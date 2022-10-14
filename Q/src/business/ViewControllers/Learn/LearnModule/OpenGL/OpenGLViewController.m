//
//  OpenGLViewController.m
//
//  Created by XQ on 2022/1/29.
//

#import "OpenGLViewController.h"

@interface OpenGLViewController ()

@end

@implementation OpenGLViewController

+ (NSString *)scheme {
    return @"q://vc/gl";
}

- (void)setupData {
    [super setupData];
    avdevice_register_all();
}

@end
