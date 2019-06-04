//
//  VCProducts.h
//  TMStore
//
//  Created by Rajshekhar on 19/07/17.
//  Copyright © 2017 Twist Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Variables.h"
#import "SellerInfo.h"

@interface VCProducts : UIViewController{
IBOutlet UIScrollView *_scrollView;
//        id <BarcodeScannerDelegate> _delegate;
id _delegate;
}
@property (strong, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UINavigationItem *currentItemHeading;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousItemHeading;

- (IBAction)barButtonBackPressed:(id)sender;
@property UIImageView* topImage;
@property UIButton* btnProceed;
@property float defaultHeight;
@property UILabel* labelViewHeading;
- (void)setDelegate:(id)delegate;
@property SellerInfo* selectedSellerInfo;
- (void)setData:(SellerInfo*)sellerInfo;
@property UIActivityIndicatorView *spinnerView;
@property BOOL pageLoading;
@property id productVC;
@property id parentVC;
@end
