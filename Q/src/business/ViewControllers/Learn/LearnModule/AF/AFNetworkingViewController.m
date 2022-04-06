//
//  AFNetworkingViewController.m
//
//  Created by XQ on 2022/4/2.
//

#import "AFNetworkingViewController.h"

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

+ (NSString *)scheme {
    return @"q://vc/af";
}

- (void)loadData:(void (^)(BOOL))callback {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *urlString = @"http://baike.baidu.com/api/openapi/BaikeLemmaCardApi";
    [manager GET:urlString
      parameters:@{
        @"scope": @(103),
        @"format": @"json",
        @"appid": @"379020",
        @"bk_key": @"关键字",
        @"bk_length": @(600)
    }
         headers:@{}
        progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LoggerInfo(@"%@", responseObject);
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
