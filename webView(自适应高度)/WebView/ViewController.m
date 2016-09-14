//
//  ViewController.m
//  WebView
//
//  Created by Mac on 16/9/13.
//  Copyright © 2016年 LoveSpending. All rights reserved.
//

#import "ViewController.h"
#import "NSString.h"

@interface ViewController ()<UIWebViewDelegate,UIScrollViewDelegate>{

    UIWebView * webView;
    UIScrollView *scrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,0,s_v_width,s_v_height}];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    
    webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *webStr = [NSString stringWithFormat:@"http://www.techweb.com.cn/irouter/2016-09-13/2392555.shtml"];
    webView.delegate = self;
    webView.backgroundColor = [UIColor whiteColor];
    webView.scrollView.showsVerticalScrollIndicator = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:webStr]]];
    [webView sizeToFit];
    [scrollView addSubview:webView];

}

- (void)webViewDidFinishLoad:(UIWebView *)WebView{
    
    NSString *clientheight_str = [WebView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"];
    float clientheight = [clientheight_str floatValue];
    if (clientheight != 0) {
    
        webView.frame = CGRectMake(15, 20, s_v_width-30, clientheight+20);
        webView.scrollView.contentSize = CGSizeMake(s_v_width-30, clientheight+20);
        
    }
    
    scrollView.contentSize = CGSizeMake(s_v_width, CGRectGetMaxY(webView.frame));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
