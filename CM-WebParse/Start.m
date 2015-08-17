//
//  ViewController.m
//  CM-WebParse
//
//  Created by 0x00 on 16/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "Start.h"

@interface Start ()
@property (strong, nonatomic) UIWebView *webNews;

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initController];
    
}
- (void)initController {
}
/**********************************************************************************************/
#pragma mark - Web methods
/**********************************************************************************************/
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    @try {
        NSLog(@"webViewDidFinishLoad");
        NSString *stCurrentURL      = self.webNews.request.URL.absoluteString;
        print(NSLog(@"stCurrentURL %@", stCurrentURL))
        
        NSString *count = [self.webNews stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('listado').length;"];
        print(NSLog(@"count %@", count))
        
        NSString *stClass       = [self.webNews stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('listado')[0].innerHTML;"]];
        print(NSLog(@"stClassFinish %@", stClass))
        
        NSString *stClassHeader = [self.webNews stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('listado')[0].children[0].innerText;"]];
        print(NSLog(@"stClassHeader %@", stClassHeader))
        
        NSString *stClassImage  = [self.webNews stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementsByClassName('img')[0].children[0].getAttribute('src');"]];
        print(NSLog(@"stClassImage %@", stClassImage))
        
        NSURL *url                      = [NSURL URLWithString:stClassImage];
        
        [self.imgNoticia sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
        
        self.lblTexto.text = stClassHeader;
        self.lblTexto.adjustsFontSizeToFitWidth = YES;
        // self.lblText.text = stClass;
        //self.lblText.adjustsFontSizeToFitWidth = YES;
    }
    @catch (NSException * e) {print(NSLog(@"Exception"));}
}
//-------------------------------------------------------------------------------
/*- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
 NSLog(@"didFailLoadWithError");
 }*/



- (IBAction)btnCargar:(id)sender {
    [self.webNews stopLoading];
    self.webNews                = [[UIWebView alloc] init];
    self.webNews.hidden         = YES;
    NSString *urlAddress        = nURLNews;//[nURLNews stringByAppendingString:@"1"];
    NSURL *url                  = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj    = [NSURLRequest requestWithURL:url];
    self.webNews.delegate       = self;
    [self.webNews loadRequest:requestObj];
}
@end
