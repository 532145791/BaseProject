//
//  BaseWebViewController.m
//  BaseProject
//
//  Created by super on 2018/3/12.
//  Copyright © 2018年 lengchao. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WebKit.h>

static NSInteger progressHeight = 2;

@interface BaseWebViewController ()<WKNavigationDelegate>
@property (nonatomic , strong) WKWebView *webView;
@property (nonatomic , strong) CALayer *progressLayer;
@property (nonatomic , strong) UIView *progressView;
@end

@implementation BaseWebViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}

-(void)configUI{
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //进度条
    [self.view addSubview:self.progressView];
}

-(void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}

#pragma mark - WKNavigationDelegate
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"页面开始加载");
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"开始返回内容");
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"页面加载完成");
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"页面加载失败");
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    NSLog(@"收到响应后，决定是否跳转");
    NSString *tmpUrlStr = navigationResponse.response.URL.absoluteString;
    NSLog(@"要加载的URL=%@",tmpUrlStr);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
//    decisionHandler(WKNavigationResponsePolicyCancel);
}

#pragma mark - KVO回馈
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressLayer.opacity = 1;
        if ([change[@"new"] floatValue] <[change[@"old"] floatValue]) {
            return;
        }
        self.progressLayer.frame = CGRectMake(0, 0, Screen_Width*[change[@"new"] floatValue], progressHeight);
        if ([change[@"new"]floatValue] == 1.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressLayer.opacity = 0;
                self.progressLayer.frame = CGRectMake(0, 0, 0, progressHeight);
            });
        }
    }else if ([keyPath isEqualToString:@"title"]){
        self.title = change[@"new"];
    }
}

-(UIView *)progressView{
    if (!_progressView) {
        _progressView = [UIView new];
        _progressView.frame = CGRectMake(0, 0, Screen_Width, progressHeight);
        _progressView.backgroundColor = [UIColor clearColor];
        [_progressView.layer addSublayer:self.progressLayer];
    }
    return _progressView;
}

-(CALayer *)progressLayer{
    if (!_progressLayer) {
        _progressLayer = [CALayer layer];
        _progressLayer.frame = CGRectMake(0, 0, 0, progressHeight);
        _progressLayer.backgroundColor = [UIColor colorWithHexString:@"FDCF0F"].CGColor;
    }
    return _progressLayer;
}

-(WKWebView *)webView{
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.selectionGranularity = WKSelectionGranularityDynamic;
        config.allowsInlineMediaPlayback = YES;
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
        _webView.navigationDelegate = self;
    }
    return _webView;
}


@end
