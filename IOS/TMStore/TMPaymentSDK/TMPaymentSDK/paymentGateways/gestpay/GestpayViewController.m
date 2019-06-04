//
//  SagepayViewController.m
//  sagepayTest
//
//  Created by Rishabh Jain on 02/09/16.
//  Copyright © 2016 Twist Mobile. All rights reserved.
//

#import "SagepayViewController.h"
#import "TMPaymentSDK.h"
//#import "../../../../TMStore/Classes/Utilities/UILabel+LocalizeConstrint.h"

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





@interface SagepayViewController (SEWebviewJSListenerNew)

@end
@implementation SagepayViewController

- (void)backButtonClicked:(id)sender{
    [self operationResult:false];
}
- (void)viewDidDisappear:(BOOL)animated {
    [PaymentUtility stopGrayLoadingBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:
                                 @"< Back" style:UIBarButtonItemStyleBordered target:
                                 self action:@selector(backButtonClicked:)];
    [self.navigationItem setLeftBarButtonItem:backButton];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    
    /*
    
    
    
    
//    [self.navigationController.navigationBar setBarTintColor:[Utility getUIColor:kUIColorBgHeader]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    UIButton* customBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBackButton setImage:[[UIImage imageNamed:@"img_arrow_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [customBackButton setBackgroundColor:[UIColor blueColor]];
//    [customBackButton addTarget:self action:@selector(barButtonBackPressed:)forControlEvents:UIControlEventTouchUpInside];
//    [customBackButton setTitle:[NSString stringWithFormat:@"  %@  ", Localize(@"i_back")] forState:UIControlStateNormal];
    [customBackButton setTitle:[NSString stringWithFormat:@"< BACK"] forState:UIControlStateNormal];
//    [customBackButton setTintColor:[Utility getUIColor:kUIColorThemeFont]];
//    [customBackButton setTitleColor:[Utility getUIColor:kUIColorThemeFont] forState:UIControlStateNormal];
//    [customBackButton.titleLabel setUIFont:kUIFontType18 isBold:false];
    [customBackButton sizeToFit];
//    [self.navigationController.navigationBar SET]
//    [self.navigationController.navigationBar. setCustomView:customBackButton];
    
    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] init];

//    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
//    [self.navigationController.navigationItem setLeftBarButtonItem:myNavBtn];
    [self.navigationController.navigationItem setBackBarButtonItem:myNavBtn];
    [myNavBtn setCustomView:customBackButton];
    
    // create a navigation push button that is initially hidden
//    navButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [navButton setFrame:CGRectMake(60, 50, 200, 40)];
//    [navButton setTitle:@"Push Navigation" forState:UIControlStateNormal];
//    [navButton addTarget:self action:@selector(pushNewView:)
//        forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:customBackButton];
//    [customBackButton setHidden:YES];
    
    */
    
    
    
//    [self.navigationItem set]
    //    NSString* linkStr = @"https://www.premihair.co.uk/apppayment/sagepay/";
    //    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    //    [webView setDelegate:self];
    //    [self.view addSubview:webView];
    //    NSURL *url = [NSURL URLWithString:linkStr];
    //    NSString *body = [NSString stringWithFormat:@"vendorname=%@&totalamount=%@&currency=%@&description=%@&billingsurname=%@&billingfirstname=%@&address=%@&city=%@&postcode=%@&country=%@&billingcountry=%@&platform=%@", @"firstcapitalltd", @"200", @"GBP", @"payment for my site", @"surname",  @"name", @"clifton", @"Bristol", @"BS82UE", @"GB", @"GB", @"ios"];
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    //    [request setHTTPMethod:@"POST"];
    //    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //    [webView loadRequest:request];
    
    
    
    //    NSString* linkStr = @"https://www.premihair.co.uk/apppayment/sagepay/success.php";
    //    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    //    [webView setDelegate:self];
    //    [self.view addSubview:webView];
    //    NSURL *url = [NSURL URLWithString:linkStr];
    //    NSString *body = [NSString stringWithFormat:@"\
    //                      vendorname=%@&\         //parse//
    //                      totalamount=%@&\        //customer
    //                      currency=%@&\           //customer
    //                      description=%@&\        //customer
    //                      billingsurname=%@&\     //customer
    //                      billingfirstname=%@&\   //customer
    //                      address=%@&\            //customer
    //                      city=%@&\               //customer
    //                      postcode=%@&\           //customer
    //                      country=%@&\            //customer
    //                      billingcountry=%@&\     //customer
    //                      platform=%@", @"firstcapitalltd", @"200", @"GBP", @"payment for my site", @"surname",  @"name", @"clifton", @"Bristol", @"BS82UE", @"GB", @"GB", @"ios"];
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    //    [request setHTTPMethod:@"POST"];
    //    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //    [webView loadRequest:request];
    [self pay];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        _responseDelegate = (TMPaymentSDKDelegate*)delegate;
    }
    return self;
}
- (void)pay {
    SagepayConfig* config = [SagepayConfig sharedManager];
    NSString* linkStr = config.cVendorUrl;
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView setDelegate:self];
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:linkStr];
    NSString *body = [NSString stringWithFormat:@"vendorid=%@&totalamount=%@&currency=%@&description=%@&billingsurname=%@&billingfirstname=%@&address=%@&city=%@&postcode=%@&country=%@&billingcountry=%@&platform=%@&vendorpassword=%@&paymenturl=%@&responseurl=%@", config.cVendorId, [NSString stringWithFormat:@"%.2f", config.infoTotalAmount], config.infoCurrency, config.infoDescription, config.infoLastName, config.infoFirstName, config.infoAddress, config.infoCity, config.infoPostCode, config.infoCountry, config.infoCountry, config.infoPlatform, config.cVendorPassword, config.cVendorPaymentUrl, config.cVendorResponseUrl];
    //NSLog(@"url:%@", linkStr);
    //NSLog(@"data:%@", body);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [webView loadRequest:request];
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
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    //NSLog(@"key=%@,val=%@", key, val);
    BOOL success = false;
    if ([key isEqualToString:@"payment"]) {
        if ([val isEqualToString:@"Success"]) {
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
