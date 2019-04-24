//
//  WLEChartView.m
//  EChart
//
//  Created by 适途科技二 on 2019/4/9.
//  Copyright © 2019 WangLiang. All rights reserved.
//

#import "WLEChartView.h"
#import <WebKit/WebKit.h>

@interface WLEChartView ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler,UIScrollViewDelegate>
@property(nonatomic,strong) WKWebView *webView;

@end
@implementation WLEChartView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.webView];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"/echarts/index.html" withExtension:nil];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.webView];        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"/echarts/index.html" withExtension:nil];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    return self;
}
-(WKWebView *)webView{
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        //实例化对象
        configuration.userContentController = [WKUserContentController new];
        _webView = [[WKWebView alloc]initWithFrame:self.frame configuration:configuration];
        _webView.UIDelegate = self;// UI代理
        _webView.scrollView.scrollEnabled = NO;
        _webView.scrollView.delegate = self;
        _webView.navigationDelegate = self;// 导航代理
    }
    return _webView;
}
#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"btnClick"]) {
        
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return nil;
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *str = @"{\"title\":{\"text\":\"ECharts 入门示例\"},\"tooltip\":{},\"legend\":{\"data\":[\"销量\"]},\"xAxis\":{\"data\":[\"衬衫\",\"羊毛衫\",\"雪纺衫\",\"裤子\",\"高跟鞋\",\"袜子\"]},\"yAxis\":{},\"series\":[{\"name\":\"销量\",\"type\":\"bar\",\"data\":[5,20,36,10,10,20]}]}";
    NSString *jsFounction = [NSString stringWithFormat:@"EChartData('%@')",str];
    
    [self.webView evaluateJavaScript:jsFounction completionHandler:^(id _Nullable obj, NSError * _Nullable error) {
        NSLog(@"evaluateJavaScript, obj = %@, error = %@", obj, error);
    }];
}

@end
