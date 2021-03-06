//
//  TapPaymentViewController.m
//
//
//  Created by Rishabh Jain on 12/12/16.
//  Copyright © 2016 Twist Mobile. All rights reserved.
//

#import "TapPaymentViewController.h"
#import "TMPaymentSDK.h"
#import <CommonCrypto/CommonDigest.h>
#import "TMPaymentVariables.h"

@implementation NSObject (SEWebviewJSListenerNew)

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *requestString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    //NSLog(@"requestString = %@", requestString);
    
    NSArray *requestArray = [requestString componentsSeparatedByString:@":##sendToApp##"];
    if ([requestArray count] > 1){
        NSString *requestPrefix = [[requestArray objectAtIndex:0] lowercaseString];
        NSString *requestMssg = ([requestArray count] > 0) ? [requestArray objectAtIndex:1] : @"";
        [self webviewMessageKey:requestPrefix value:requestMssg];
        return NO;
    } else if (navigationType == UIWebViewNavigationTypeLinkClicked && [self shouldOpenLinksExternally]) {
        // open links in safari
        //NSLog(@"open links in safari");
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    return YES;
}

- (void)webviewMessageKey:(NSString *)key value:(NSString *)val {
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    //NSLog(@"key=%@,val=%@", key, val);
}

- (BOOL)shouldOpenLinksExternally {
    return YES;
}

@end



@interface TapPaymentViewController(){
    UIWebView *webviewPaymentPage;
}
@end

@interface TapPaymentViewController (SEWebviewJSListenerNew)

@end
@implementation TapPaymentViewController

- (void)backButtonClicked:(id)sender{
    [self operationResult:false];
}

- (void)viewDidDisappear:(BOOL)animated {
    [PaymentUtility stopGrayLoadingBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    TapPaymentConfig* config = [TapPaymentConfig sharedManager];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:
                                   config.backButtonTitle style:UIBarButtonItemStyleBordered target:
                                   self action:@selector(backButtonClicked:)];
    [self.navigationItem setLeftBarButtonItem:backButton];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    if (webviewPaymentPage == nil) {
        webviewPaymentPage = [[UIWebView alloc] initWithFrame:self.view.frame];
        [webviewPaymentPage setDelegate:self];
        [self.view addSubview:webviewPaymentPage];
    }
    [self pay];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    TapPaymentConfig* config = [TapPaymentConfig sharedManager];
    [self setTitle:config.paymentPageTitle];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    [self setTitle:@""];
}
- (id)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        _responseDelegate = (TMPaymentSDKDelegate*)delegate;
    }
    return self;
}


//"amount"
//"first_name"
//"last_name"
//"email"
//"phone"
- (void)pay {
    UIActivityIndicatorView* sV = [PaymentUtility startGrayLoadingBar:true];
    sV.center = self.view.center;
    TapPaymentConfig* config = [TapPaymentConfig sharedManager];
    NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
    NSString* amtStr = [NSString stringWithFormat:@"%.2f", config.infoTotalAmount];
    

    NSString* nameStr = [NSString stringWithFormat:@"%@ %@", config.infoFirstName, config.infoLastName];
    [params setObject:base64_str(amtStr) forKey:@"ItemPrice"];
    [params setObject:base64_str(nameStr) forKey:@"CstFName"];
    [params setObject:base64_str(config.infoEmail) forKey:@"CstEmail"];
    [params setObject:base64_str(config.infoPhone) forKey:@"CstMobile"];
//    [params setObject:base64_str(config.infoCurrency) forKey:@"currency"];
//    [params setObject:base64_str(config.infoPlatform) forKey:@"platform"];
    
    __block NSString *post = @"";
    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([post isEqualToString:@""]) {
            post = [NSString stringWithFormat:@"%@=%@", key, obj];
        } else {
            post = [NSString stringWithFormat:@"%@&%@=%@", post, key, obj];
        }
    }];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",config.cBackendUrl]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    [webviewPaymentPage setDelegate:self];
    [webviewPaymentPage loadRequest:request];
    //    [activityIndicatorView startAnimating];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    //NSLog(@"webViewDidStartLoad");
    UIActivityIndicatorView* sV = [PaymentUtility startGrayLoadingBar:true];
    sV.center = self.view.center;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //NSLog(@"webViewDidFinishLoad");
    [PaymentUtility stopGrayLoadingBar];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(/*nullable*/ NSError *)error {
    //NSLog(@"webView didFailLoadWithError");
    PLOG(@"WebView failed loading with requestURL: %@ with error: %@ & error code: %ld",requestURL, [error localizedDescription], (long)[error code]);
    if (error.code == -1009 || error.code == -1003 || error.code == -1001) { //error.code == -999
        [self operationResult:false];
    }
}
- (void)webviewMessageKey:(NSString *)key value:(NSString *)val {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"key=%@,val=%@", key, val);
    BOOL success = false;
    if ([[key lowercaseString] isEqualToString:@"payment"]) {
        if ([[val lowercaseString] isEqualToString:@"success"]) {
            success = true;
        }
    }
    [self operationResult:success];
}
- (BOOL)shouldOpenLinksExternally {
    return NO;
}
- (void)operationResult:(BOOL)success{
    [PaymentUtility stopGrayLoadingBar];
    if (success) {
        [self dismissViewControllerAnimated:YES completion:^{
            [_responseDelegate postCompletionCallbackWithSuccess:nil];
            _responseDelegate = nil;
        }];
    } else {
        [self dismissViewControllerAnimated:YES completion:^{
            [_responseDelegate postCompletionCallbackWithFailure:nil];
            _responseDelegate = nil;
        }];
    }
}
@end
