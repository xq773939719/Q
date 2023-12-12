//
//  NetworkViewController.m
//
//  Created by XQ on 2022/4/2.
//

#import "NetworkViewController.h"
#import <Foundation/Foundation.h>

@interface NetworkViewController () <NSURLSessionDelegate, NSURLSessionTaskDelegate>

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSURLSession *urlSession;

@end

@implementation NetworkViewController

+ (NSString *)scheme {
    return @"q://vc/network";
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
    // configuration -> session <-> (urlString -> url) / request / task
    NSURLSessionDataTask *task = [self.urlSession dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    task.delegate = self;
    [task resume];
}

#pragma mark - Lazy

- (NSOperationQueue *)queue {
    if (_queue) return _queue;
    _queue = [NSOperationQueue new];
    return _queue;
}

- (NSURLSession *)urlSession {
    if (_urlSession) return _urlSession;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    _urlSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:self.queue];
    return _urlSession;
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
   
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didFinishCollectingMetrics:(NSURLSessionTaskMetrics *)metrics API_AVAILABLE(ios(10.0)) {
    for (NSURLSessionTaskTransactionMetrics *sessionMetric in metrics.transactionMetrics) {
        NSInteger dom = ([sessionMetric.domainLookupEndDate timeIntervalSince1970] - [sessionMetric.domainLookupStartDate timeIntervalSince1970]) * 1000 ;
        NSInteger sec = ([sessionMetric.secureConnectionEndDate timeIntervalSince1970] - [sessionMetric.secureConnectionStartDate timeIntervalSince1970]) * 1000;
        NSInteger con = ([sessionMetric.connectEndDate timeIntervalSince1970] - [sessionMetric.connectStartDate timeIntervalSince1970]) * 1000;
        NSInteger req = ([sessionMetric.requestEndDate timeIntervalSince1970] - [sessionMetric.requestStartDate timeIntervalSince1970]) * 1000;
        NSInteger res = ([sessionMetric.responseEndDate timeIntervalSince1970] - [sessionMetric.responseStartDate timeIntervalSince1970]) * 1000;
        NSInteger tot = ([sessionMetric.responseEndDate timeIntervalSince1970] - [sessionMetric.fetchStartDate timeIntervalSince1970]) * 1000;
        
        NSString *locip = @"";
        NSString *remip = @"";
        
        if (@available(iOS 13.0, *)) {
            locip = [NSString stringWithFormat:@"%@", sessionMetric.localAddress];
            remip = [NSString stringWithFormat:@"%@", sessionMetric.remoteAddress];
        }
        NSString *log = [NSString stringWithFormat:@"metric path:%@ 总耗时:%ldms, 域名解析:%ldms, 连接耗时:%ldms(包括TLS:%ldms), 请求:%ldms, 回调:%ldms l:%@ r:%@",sessionMetric.request.URL.lastPathComponent,tot,dom,con,sec,req,res, locip, remip];
        LoggerInfo(log);
    }
}

@end
