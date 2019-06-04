//
//  ViewControllerReservationForm.m
//  TMStore
//
//  Created by Rishabh Jain on 08/05/17.
//  Copyright (c) 2017 Twist Mobile. All rights reserved.
//

#import "ViewControllerReservationForm.h"
#import "Utility.h"
#import "Variables.h"
#import "AnalyticsHelper.h"
#import "DataManager.h"
#import "ReservationFormConfig.h"
#import "UITextView+LocalizeConstrint.h"
static int kTagForGlobalDoubleSpacing = 2;
static int kTagForGlobalSpacing = 1;
static int kTagForNoSpacing = -1;
static int kTagForPreviousSpacing = -2;

enum TAGS_RESERVATION_FORM {
    TAGS_RESERVATION_FORM_TITLE,
    TAGS_RESERVATION_FORM_NAME,
    TAGS_RESERVATION_FORM_EMAIL,
    TAGS_RESERVATION_FORM_MESSAGE_TITLE,
    TAGS_RESERVATION_FORM_MESSAGE,
    TAGS_RESERVATION_FORM_DATE,
    TAGS_RESERVATION_FORM_PERS,
    TAGS_RESERVATION_FORM_HOUR,
    TAGS_RESERVATION_FORM_T332,
    TAGS_RESERVATION_FORM_CONTACT,
    TAGS_RESERVATION_FORM_BOOKING_NAME
};


@interface ViewControllerReservationForm () {
    NSMutableArray* _viewsAdded;
    UIButton *customBackButton;
    
    
    ReservationForm* objName;
    ReservationForm* objEmail;
    ReservationForm* objMessage;
    ReservationForm* objDate;
    ReservationForm* objPers;
    ReservationForm* objHour;
    ReservationForm* objT332;
    ReservationForm* objContact;
    ReservationForm* objBookingName;
    
    
}
@end
@implementation ViewControllerReservationForm
#pragma mark Default Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [Utility getUIColor:kUIColorThemeFont], NSForegroundColorAttributeName, [Utility getUIFont:kUIFontType24 isBold:false], NSFontAttributeName, nil]];
    [self.currentItemHeading setTitle:@"   "];
    
    self.labelViewHeading = [[UILabel alloc] init] ;
    [self.labelViewHeading setFrame:CGRectMake(0, 20, [[MyDevice sharedManager] screenSize].width, self.navigationBar.frame.size.height)];
    [self.labelViewHeading setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [self.labelViewHeading setUIFont:kUIFontType24 isBold:false];
    [self.labelViewHeading setTextColor:[Utility getUIColor:kUIColorThemeFont]];
    [self.labelViewHeading setTextAlignment:NSTextAlignmentCenter];
    [self.labelViewHeading setText:@"    "];
    [self.view addSubview:self.labelViewHeading];
    
    [self.navigationBar setClipsToBounds:false];
    [self.lineView setBackgroundColor:[Utility getUIColor:kUIColorBorder]];
    [_scrollView setBackgroundColor:[Utility getUIColor:kUIColorBgTheme]];
    [self.view setBackgroundColor:[Utility getUIColor:kUIColorBgHeader]];
    [self.navigationBar setBarTintColor:[Utility getUIColor:kUIColorBgHeader]];
    customBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customBackButton setImage:[[UIImage imageNamed:@"img_arrow_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [customBackButton addTarget:self action:@selector(barButtonBackPressed:)forControlEvents:UIControlEventTouchUpInside];
    [customBackButton setTitle:[NSString stringWithFormat:@"  %@  ", Localize(@"i_back")] forState:UIControlStateNormal];
    [customBackButton setTintColor:[Utility getUIColor:kUIColorThemeFont]];
    [customBackButton setTitleColor:[Utility getUIColor:kUIColorThemeFont] forState:UIControlStateNormal];
    [customBackButton.titleLabel setUIFont:kUIFontType18 isBold:false];
    
    [customBackButton sizeToFit];
    [self.previousItemHeading setCustomView:customBackButton];
    [self.previousItemHeading setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[Utility getUIColor:kUIColorThemeFont], NSForegroundColorAttributeName, [Utility getUIFont:kUIFontType18 isBold:false], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [self initVariables];
    [self loadAllViews];
}
- (void)viewDidAppear:(BOOL)animated{
#if ENABLE_FIREBASE_TAG_MANAGER
    [[AnalyticsHelper sharedInstance] registerVisitScreenEvent:@"Reservation Form"];
#endif
}
- (void)viewWillAppear:(BOOL)animated {
    RLOG(@"%s", __PRETTY_FUNCTION__);
    [super viewWillAppear:animated];
#if ENABLE_FIREBASE_TAG_MANAGER
    [[AnalyticsHelper sharedInstance] registerVisitScreenEvent:@"Reservation Form"];
#endif
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)viewWillDisappear:(BOOL)animated {
    RLOG(@"%s", __PRETTY_FUNCTION__);
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Adjust Orientation
- (void)saveTempVariables {
    tempEmail = textFieldEmail.text;
    tempMessage = textViewMessage.text;
    tempBookingName = textFieldBookingName.text;
    tempPers = textFieldPers.text;
    tempContact = textFieldContact.text;
    tempDate = buttonDate.titleLabel.text;
    tempHour = buttonHour.titleLabel.text;
    tempT332 = buttonT332.titleLabel.text;
}
- (void)beforeRotation {
    [self saveTempVariables];
    UIView* lastView = [_viewsAdded lastObject];
    for(UIView *view in _viewsAdded)
    {
        [UIView animateWithDuration:0.1f animations:^{
            [view setAlpha:0.0f];
        }completion:^(BOOL finished){
            [view removeFromSuperview];
            if (view == lastView) {
                [_scrollView setAlpha:0.0f];
                [_viewsAdded removeAllObjects];
                [self loadAllViews];
                for(UIView *vieww in _viewsAdded)
                {
                    [vieww setAlpha:0.0f];
                }
                [_scrollView setAlpha:1.0f];
            }
        }];
    }
}
- (void)afterRotation {
    for(UIView *vieww in _viewsAdded)
    {
        [UIView animateWithDuration:0.1f animations:^{
            [vieww setAlpha:1.0f];
        }completion:^(BOOL finished){
            
        }];
    }
}
- (void)adjustViewsForOrientation:(UIDeviceOrientation) orientation {
    RLOG(@"====adjustViewsForOrientation====");
    [self beforeRotation];
}
- (void)adjustViewsAfterOrientation:(UIDeviceOrientation) orientation {
    RLOG(@"%s", __PRETTY_FUNCTION__);
    RLOG(@"====adjustViewsAfterOrientation====");
    [self afterRotation];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    if ([[AppDelegate getInstance] isAppEnteredInBackground]) {
        return;
    }
    [self adjustViewsAfterOrientation:[[UIDevice currentDevice] orientation]];
    [self resetMainScrollView];
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if ([[AppDelegate getInstance] isAppEnteredInBackground]) {
        return;
    }
    [self adjustViewsForOrientation:[[UIDevice currentDevice] orientation]];
    [self resetMainScrollView];
}
- (void)resetMainScrollView {
    float globalPosY = 0.0f;
    float previousPosY = 0.0f;
    UIView* tempView = nil;
    int i = 0;
    for (tempView in _viewsAdded) {
        CGRect rect = [tempView frame];
        if (i == 0) {
            globalPosY = 20;
        }
        if ([tempView tag] == kTagForPreviousSpacing) {
            globalPosY = previousPosY;
        }
        rect.origin.y = globalPosY;
        [tempView setFrame:rect];
        globalPosY += rect.size.height;
        previousPosY = rect.origin.y;
        if ([tempView tag] == kTagForGlobalSpacing) {
            globalPosY += 20;//[LayoutProperties globalVerticalMargin];
        }
        if ([tempView tag] == kTagForGlobalDoubleSpacing) {
            globalPosY += 40;//[LayoutProperties globalVerticalMargin];
        }
        if ([tempView tag] == kTagForPreviousSpacing) {
            globalPosY += 20;//[LayoutProperties globalVerticalMargin];
        }
        i++;
    }
    [_scrollView setContentSize:CGSizeMake(_scrollView.contentSize.width, globalPosY)];
}
#pragma mark - Create & Manage View
- (void)initVariables {
    objName = nil;
    objEmail = nil;
    objMessage = nil;
    objDate = nil;
    objPers = nil;
    objHour = nil;
    objT332 = nil;
    objContact = nil;
    objBookingName = nil;
    
    tempBookingName = @"";
    tempEmail = @"";
    tempPers = @"";
    tempMessage = @"";
    tempContact = @"";
    tempDate = @"";
    tempHour = @"";
    tempT332 = @"";
    
    _viewsAdded = [[NSMutableArray alloc] init];
    [self.labelViewHeading setText:Localize(@"title_reservation")];
}
- (void)loadAllViews {
    for (UIView* view in _viewsAdded) {
        [view removeFromSuperview];
    }
    [_viewsAdded removeAllObjects];
    
    if ([[ReservationFormConfig getInstance] isDataFetched]) {
        [self createView];
        [self loadDataInView];
    } else {
        [self fetchData];
    }
    [self resetMainScrollView];
}
- (void)createView {
    ReservationFormConfig* config = [ReservationFormConfig getInstance];
    
    objName = [config getReservationForm_Name];
    objEmail = [config getReservationForm_Email];
    objMessage = [config getReservationForm_Message];
    objDate = [config getReservationForm_Date];
    objPers = [config getReservationForm_Person];
    objHour = [config getReservationForm_Hour];
    objT332 = [config getReservationForm_t332];
    objContact = [config getReservationForm_Contact];
    objBookingName = [config getReservationForm_BookingName];
    
    
    NSString* placeholderName = objName.label;
    placeholderName = [NSString stringWithFormat:@"*%@", placeholderName];
    NSString* placeholderEmail = objEmail.label;
    placeholderEmail = [NSString stringWithFormat:@"*%@", placeholderEmail];
    NSString* placeholderMessage = objMessage.label;
    placeholderMessage = [NSString stringWithFormat:@"*%@", placeholderMessage];
    NSString* placeholderBookingName = objBookingName.label;
    placeholderBookingName = [NSString stringWithFormat:@"*%@", placeholderBookingName];
    NSString* placeholderContact = objContact.label;
    placeholderContact = [NSString stringWithFormat:@"*%@", placeholderContact];
    NSString* placeholderDate = objDate.label;
    placeholderDate = [NSString stringWithFormat:@"*%@", placeholderDate];
    NSString* placeholderPers = objPers.label;
    placeholderPers = [NSString stringWithFormat:@"*%@", placeholderPers];
    NSString* placeholderHour = objHour.label;
    placeholderHour = [NSString stringWithFormat:@"*%@", placeholderHour];
    NSString* placeholderT332 = objT332.label;
    placeholderT332 = [NSString stringWithFormat:@"*%@", placeholderT332];
    
    
    NSString* submitButtonTitle = [config submit_button_title];
    
    float posX = self.view.frame.size.width * .02f;
    float posY = self.view.frame.size.width * .04f;
    float width = self.view.frame.size.width * .96f;
    float height = 50;
    int fontType;
//    if ([[MyDevice sharedManager] isIpad]) {
//        fontType = kUIFontType18;
//    } else {
//        fontType = kUIFontType24;
//    }
    fontType = kUIFontType18;
    NSString* mandatorySymbol = @"";
    
    
    labelFormTitle = [[UILabel alloc] initWithFrame:CGRectMake(posX, posY, width - 10, height)];
    [labelFormTitle setUIFont:fontType isBold:true];
    [labelFormTitle setTextColor:[Utility getUIColor:kUIColorFontDark]];
    [labelFormTitle setText:Localize(@"reservation_form_desc")];
    [labelFormTitle setNumberOfLines:0];
    [labelFormTitle setLineBreakMode:NSLineBreakByWordWrapping];
    [labelFormTitle sizeToFitUI];
    [_scrollView addSubview:labelFormTitle];
    [_viewsAdded addObject:labelFormTitle];
    [labelFormTitle setTag:kTagForGlobalSpacing];
    posY = CGRectGetMaxY(labelFormTitle.frame) + height;
    
    
    textFieldBookingName = [self createTextField:_scrollView fontType:fontType fontColorType:kUIColorFontLight frame:CGRectMake(posX, posY, width, height) tag:TAGS_RESERVATION_FORM_BOOKING_NAME textStrPlaceHolder:[NSString stringWithFormat:@"%@%@", mandatorySymbol, placeholderBookingName]];
    [_viewsAdded addObject:textFieldBookingName];
    [textFieldBookingName setTag:kTagForGlobalSpacing];
    posY = CGRectGetMaxY(textFieldBookingName.frame) + height;
    
    textFieldEmail = [self createTextField:_scrollView fontType:fontType fontColorType:kUIColorFontLight frame:CGRectMake(posX, posY, width, height) tag:TAGS_RESERVATION_FORM_EMAIL textStrPlaceHolder:[NSString stringWithFormat:@"%@%@", mandatorySymbol, placeholderEmail]];
    [_viewsAdded addObject:textFieldEmail];
    [textFieldEmail setTag:kTagForGlobalSpacing];
    posY = CGRectGetMaxY(textFieldEmail.frame) + height;
    
    {
        buttonDate = [[UIButton alloc] init];
        [buttonDate setFrame:CGRectMake(posX, posY, width/2 - 5, height)];
        [buttonDate setTitle:placeholderDate forState:UIControlStateNormal];
        [buttonDate setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
        [buttonDate.titleLabel setUIFont:fontType isBold:false];
        [buttonDate addTarget:self action:@selector(dateSelectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonDate setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [buttonDate setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [buttonDate setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        [_scrollView addSubview:buttonDate];
        [_viewsAdded addObject:buttonDate];
        [buttonDate setTag:kTagForNoSpacing];
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0.0f, buttonDate.frame.size.height - 1, buttonDate.frame.size.width - 5.0f, 1.0f);
        bottomBorder.backgroundColor = [[Utility sharedManager] getTextFieldBorderColor].CGColor;
        [buttonDate.layer setValue:bottomBorder forKey:@"BOTTOM_BORDER"];
        [buttonDate.layer addSublayer:bottomBorder];
        buttonDateDD = [[UIButton alloc] init];
        [buttonDateDD setFrame:CGRectMake(buttonDate.frame.size.width - buttonDate.frame.size.height, 0, buttonDate.frame.size.height, buttonDate.frame.size.height - 10)];
        [buttonDateDD addTarget:self action:@selector(dateSelectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonDateDD.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [buttonDateDD setImage:[[UIImage imageNamed:@"img_arrow_down_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [buttonDateDD setTintColor:[Utility getUIColor:kUIColorFontLight]];
        [buttonDateDD setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [buttonDateDD setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        //        [buttonDateDD setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 10, 0)];
        [buttonDate addSubview:buttonDateDD];
    }
    
    textFieldPers = [self createTextField:_scrollView fontType:fontType fontColorType:kUIColorFontLight frame:CGRectMake(posX + width/2 + 5, posY, width/2 - 5, height) tag:TAGS_RESERVATION_FORM_PERS textStrPlaceHolder:[NSString stringWithFormat:@"%@%@", mandatorySymbol, placeholderPers]];
    [_viewsAdded addObject:textFieldPers];
    [textFieldPers setTag:kTagForPreviousSpacing];
    posY = CGRectGetMaxY(textFieldPers.frame) + height;
    
    {
        buttonHour = [[UIButton alloc] init];
        [buttonHour setFrame:CGRectMake(posX, posY, width/2 - 5, height)];
        [buttonHour setTitle:placeholderHour forState:UIControlStateNormal];
        [buttonHour setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
        [buttonHour.titleLabel setUIFont:fontType isBold:false];
        [buttonHour addTarget:self action:@selector(hourSelectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonHour setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [buttonHour setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [buttonHour setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        [_scrollView addSubview:buttonHour];
        [_viewsAdded addObject:buttonHour];
        [buttonHour setTag:kTagForNoSpacing];
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0.0f, buttonHour.frame.size.height - 1, buttonHour.frame.size.width - 5.0f, 1.0f);
        bottomBorder.backgroundColor = [[Utility sharedManager] getTextFieldBorderColor].CGColor;
        [buttonHour.layer setValue:bottomBorder forKey:@"BOTTOM_BORDER"];
        [buttonHour.layer addSublayer:bottomBorder];
        buttonHourDD = [[UIButton alloc] init];
        [buttonHourDD setFrame:CGRectMake(buttonHour.frame.size.width - buttonHour.frame.size.height, 0, buttonHour.frame.size.height, buttonHour.frame.size.height - 10)];
        [buttonHourDD addTarget:self action:@selector(hourSelectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonHourDD.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [buttonHourDD setImage:[[UIImage imageNamed:@"img_arrow_down_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [buttonHourDD setTintColor:[Utility getUIColor:kUIColorFontLight]];
        [buttonHourDD setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [buttonHourDD setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        //        [buttonHourDD setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 10, 0)];
        [buttonHour addSubview:buttonHourDD];
    }
    
    {
        buttonT332 = [[UIButton alloc] init];
        [buttonT332 setFrame:CGRectMake(posX + width/2 + 5, posY, width/2 - 5, height)];
        [buttonT332 setTitle:placeholderT332 forState:UIControlStateNormal];
        [buttonT332 setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
        [buttonT332.titleLabel setUIFont:fontType isBold:false];
        [buttonT332 addTarget:self action:@selector(t332SelectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonT332 setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [buttonT332 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [buttonT332 setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        [_scrollView addSubview:buttonT332];
        [_viewsAdded addObject:buttonT332];
        [buttonT332 setTag:kTagForPreviousSpacing];
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0.0f, buttonT332.frame.size.height - 1, buttonT332.frame.size.width - 5.0f, 1.0f);
        bottomBorder.backgroundColor = [[Utility sharedManager] getTextFieldBorderColor].CGColor;
        [buttonT332.layer setValue:bottomBorder forKey:@"BOTTOM_BORDER"];
        [buttonT332.layer addSublayer:bottomBorder];
        buttonT332DD = [[UIButton alloc] init];
        [buttonT332DD setFrame:CGRectMake(buttonT332.frame.size.width - buttonT332.frame.size.height, 0, buttonT332.frame.size.height, buttonT332.frame.size.height - 10)];
        [buttonT332DD addTarget:self action:@selector(t332SelectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonT332DD.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [buttonT332DD setImage:[[UIImage imageNamed:@"img_arrow_down_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [buttonT332DD setTintColor:[Utility getUIColor:kUIColorFontLight]];
        [buttonT332DD setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [buttonT332DD setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
        //        [buttonT332DD setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 10, 0)];
        [buttonT332 addSubview:buttonT332DD];
    }
    
    posY = CGRectGetMaxY(buttonT332.frame) + height;
    
    
    
    
    
    
    textFieldContact = [self createTextField:_scrollView fontType:fontType fontColorType:kUIColorFontLight frame:CGRectMake(posX, posY, width, height) tag:TAGS_RESERVATION_FORM_CONTACT textStrPlaceHolder:[NSString stringWithFormat:@"%@%@", mandatorySymbol, placeholderContact]];
    [_viewsAdded addObject:textFieldContact];
    [textFieldContact setTag:kTagForGlobalDoubleSpacing];
    posY = CGRectGetMaxY(textFieldContact.frame) + height;
    
    
    UILabel* labelTextViewTitle = [[UILabel alloc] initWithFrame:CGRectMake(posX + 10, posY, width - 10, height)];
    [labelTextViewTitle setUIFont:fontType isBold:false];
    [labelTextViewTitle setTextColor:[Utility getUIColor:kUIColorFontLight]];
    [labelTextViewTitle setText:placeholderMessage];
    [labelTextViewTitle setNumberOfLines:0];
    [labelTextViewTitle setLineBreakMode:NSLineBreakByWordWrapping];
    [labelTextViewTitle sizeToFitUI];
    [_scrollView addSubview:labelTextViewTitle];
    [_viewsAdded addObject:labelTextViewTitle];
    [labelTextViewTitle setTag:kTagForNoSpacing];
    posY = CGRectGetMaxY(labelTextViewTitle.frame) + height;
    
    textViewMessage = nil;
    textViewMessage = [self createTextView:_scrollView fontType:fontType fontColorType:kUIColorFontLight frame:CGRectMake(posX, posY, width, height * 5) tag:TAGS_RESERVATION_FORM_MESSAGE textStrPlaceHolder:placeholderMessage textView:textViewMessage];
    [textViewMessage setKeyboardType:UIKeyboardTypeDefault];
    [textViewMessage setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_viewsAdded addObject:textViewMessage];
    [textViewMessage setTag:kTagForGlobalSpacing];
    posY = CGRectGetMaxY(textViewMessage.frame) + height;
    
    float buttonWidth = [[MyDevice sharedManager] screenWidthInPortrait] * 0.6f;
    float buttonHeight = [[MyDevice sharedManager] screenHeightInPortrait] * .075f;
    float buttonPosX = (self.view.frame.size.width - buttonWidth) / 2;
    UIButton* btnProceed = [[UIButton alloc] initWithFrame:CGRectMake(buttonPosX, posY, buttonWidth, buttonHeight)];
    [btnProceed setBackgroundColor:[Utility getUIColor:kUIColorBuyButtonNormalBg]];
    [[btnProceed titleLabel] setUIFont:kUIFontType22 isBold:false];
    [btnProceed setTitle:submitButtonTitle forState:UIControlStateNormal];
    [btnProceed setTitleColor:[Utility getUIColor:kUIColorBuyButtonFont] forState:UIControlStateNormal];
    [btnProceed addTarget:self action:@selector(submit:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:btnProceed];
    [_viewsAdded addObject:btnProceed];
    [btnProceed setTag:kTagForGlobalSpacing];
    
    if ([buttonT332.titleLabel.text isEqualToString:@"*"]) {
        [buttonT332 setTitle:[objT332.options objectAtIndex:0] forState:UIControlStateNormal];
    }
}
- (void)loadDataInView {
    if (![tempBookingName isEqualToString:@""]) {
        textFieldBookingName.text = tempBookingName;
    }
    if (![tempEmail isEqualToString:@""]) {
        textFieldEmail.text = tempEmail;
    }
    if (![tempMessage isEqualToString:@""]) {
        textViewMessage.text = tempMessage;
    }
    if (![tempPers isEqualToString:@""]) {
        textFieldPers.text = tempPers;
    }
    if (![tempContact isEqualToString:@""]) {
        textFieldContact.text = tempContact;
    }
    if (![tempDate isEqualToString:@""]) {
        buttonDate.titleLabel.text = tempDate;
    }
    if (![tempHour isEqualToString:@""]) {
        buttonHour.titleLabel.text = tempHour;
    }
    if (![tempT332 isEqualToString:@""]) {
        buttonT332.titleLabel.text = tempT332;
    }
}
#pragma mark - UITextField Methods & Delegate Responses
- (UITextField*)createTextField:(UIView*)parentView fontType:(int)fontType fontColorType:(int)fontColorType frame:(CGRect)frame tag:(int)tag textStrPlaceHolder:(NSString*)textStrPlaceHolder {
    if (CGRectEqualToRect(frame, CGRectMake(0, 0, 0, 0))) {
        frame = parentView.frame;
    }
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = textStrPlaceHolder;
    textField.backgroundColor = [UIColor clearColor];
    textField.textColor = [Utility getUIColor:fontColorType];
    if ([[MyDevice sharedManager] isIphone]) {
        fontType--;
    }
    textField.borderStyle = UITextBorderStyleNone;
    textField.layer.borderWidth = 0;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.returnKeyType = UIReturnKeyDone;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    textField.tag = tag;
    textField.delegate = self;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [textField setUIFont:fontType isBold:false];
    [parentView addSubview:textField];
    UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, textField.frame.size.height - 1, textField.frame.size.width - 5.0f, 1.0f);
    bottomBorder.backgroundColor = [[Utility sharedManager] getTextFieldBorderColor].CGColor;
    [textField.layer setValue:bottomBorder forKey:@"BOTTOM_BORDER"];
    [textField.layer addSublayer:bottomBorder];
    if ([[TMLanguage sharedManager] isRTLEnabled]) {
        [textField setRightViewMode:UITextFieldViewModeAlways];
        [textField setRightView:spacerView];
    } else {
        [textField setLeftViewMode:UITextFieldViewModeAlways];
        [textField setLeftView:spacerView];
    }
    return textField;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _textFieldFirstResponder = textField;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [self setViewMovedUp:NO];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if (textField.tag == TAGS_RESERVATION_FORM_CONTACT)
//    {
//        if(string.length > 0)
//        {
//            NSCharacterSet *numbersOnly = [NSCharacterSet characterSetWithCharactersInString:@"+0123456789"];
//            NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:string];
//            
//            BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
//            return stringIsValid;
//        }
//    }
    return YES;
}
-(void)cancelNumberPad:(UIBarButtonItem*)button {
    [self textFieldShouldReturn:_textFieldFirstResponder];
}
-(void)doneWithNumberPad:(UIBarButtonItem*)button {
    [self textFieldShouldReturn:_textFieldFirstResponder];
}
- (void)setViewMovedUp:(BOOL)movedUp {
    RLOG(@"%s", __PRETTY_FUNCTION__);
    RLOG(@"setViewMovedUp:%d", movedUp);
    [UIView beginAnimations:nil context:NULL];
    if (movedUp == false) {
        [UIView setAnimationDuration:0.0f];
    } else {
        [UIView setAnimationDuration:_duration];
    }
    
    
    [UIView setAnimationCurve:_curve];
    CGRect rect = _scrollView.frame;
    if (movedUp) {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        CGPoint p = [_textFieldFirstResponder convertPoint:_textFieldFirstResponder.center toView:window];
        float textViewPos = p.y;
        float windowViewHeight = [[MyDevice sharedManager] screenSize].height;
        float keyboardPos = windowViewHeight - _keyboardHeight;
        
        if (textViewPos > keyboardPos) {
            if ([[MyDevice sharedManager] isIphone]) {
                rect.origin.y = - MIN(_keyboardHeight, (textViewPos - keyboardPos));
                _scrollView.frame = rect;
            }
        }
    }
    else {
        if ([[MyDevice sharedManager] isIphone]) {
            rect.origin.y = 0;
            _scrollView.frame = rect;
            _scrollView.center = CGPointMake([[MyDevice sharedManager] screenSize].width/2, [[MyDevice sharedManager] screenSize].height/2);
        }
    }
    
    [UIView commitAnimations];
}
- (void)keyboardWillShow:(NSNotification *)notification {
    RLOG(@"%s", __PRETTY_FUNCTION__);
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    CGRect rawFrame      = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    RLOG(@"keyboardFrame: %@", NSStringFromCGRect(keyboardFrame));
    _keyboardHeight = keyboardFrame.size.height;
    _duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    _curve = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    // Animate the current view out of the way
    [self setViewMovedUp:YES];
}
- (void)keyboardWillHide {
    RLOG(@"%s", __PRETTY_FUNCTION__);
    [self setViewMovedUp:NO];
}
#pragma mark - UITextView Methods & Delegate Responses
- (UITextView*)createTextView:(UIView*)parentView fontType:(int)fontType fontColorType:(int)fontColorType frame:(CGRect)frame tag:(int)tag textStrPlaceHolder:(NSString*)textStrPlaceHolder textView:(UITextView*)textView {
    if (CGRectEqualToRect(frame, CGRectMake(0, 0, 0, 0))) {
        frame = parentView.frame;
    }
    if (textView == nil) {
        textView = [[UITextView alloc] init];
    }
    textView.frame = frame;
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [Utility getUIColor:fontColorType];
    if ([[MyDevice sharedManager] isIphone]) {
        fontType--;
    }
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [[Utility sharedManager] getTextFieldBorderColor].CGColor;
    textView.textAlignment = NSTextAlignmentLeft;
    textView.tag = tag;
    textView.delegate = self;
    [textView setUIFont:fontType isBold:false];
    [parentView addSubview:textView];
    [textView setTextContainerInset:UIEdgeInsetsMake(5, 5, 5, 5)];
    
    if ([[MyDevice sharedManager] isIphone]) {
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.backgroundColor = [UIColor lightGrayColor];
        UIBarButtonItem* doneBtn = [[UIBarButtonItem alloc]initWithTitle:Localize(@"done") style:UIBarButtonItemStyleBordered target:self action:@selector(doneWithNumberPadTextView:)];
        numberToolbar.items = @[
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                doneBtn];
        [numberToolbar sizeToFit];
        textView.inputAccessoryView = numberToolbar;
    }
    return textView;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _textViewFirstResponder = textView;
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [self setViewMovedUp:NO];
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return YES;
}
- (void)doneWithNumberPadTextView:(UIBarButtonItem*)button {
    [self textViewShouldEndEditing:_textViewFirstResponder];
    [_textViewFirstResponder resignFirstResponder];
}
#pragma mark - Fetch Data
- (void)fetchData {
//    [Utility showProgressView:@""];
//    [[[DataManager sharedManager] tmDataDoctor] getReservationFormInBackground:0 success:^(id data) {
//        RLOG_DESC(@"data: %@", data);
//        [Utility hideProgressView];
//        [self createView];
//        [self resetMainScrollView];
//    } failure:^(NSString *error) {
//        RLOG_DESC(@"error: %@", error);
//        [Utility hideProgressView];
//    }];
    [Utility showProgressView:@""];
    if ([[ReservationFormConfig getInstance] isDataFetched] == false) {
        [[[DataManager sharedManager] tmDataDoctor] getReservationFormInBackground:0 success:^(id data) {
            RLOG_DESC(@"data: %@", data);
            [Utility hideProgressView];
            [self createView];
            [self resetMainScrollView];
        } failure:^(NSString *error) {
            RLOG_DESC(@"error: %@", error);
            [Utility hideProgressView];
        }];
    } else {
        [Utility hideProgressView];
        [self createView];
        [self resetMainScrollView];
    }
}
#pragma mark - Events
- (IBAction)barButtonBackPressed:(id)sender {
    [[Utility sharedManager] popScreen:self];
    ViewControllerMain* mainVC = [ViewControllerMain getInstance];
    [mainVC resetPreviousState];
}
- (void)submit:(id)sender {
    if ([textFieldBookingName.text isEqualToString:@""] ||
        [textFieldEmail.text isEqualToString:@""] ||
        [textFieldContact.text isEqualToString:@""] ||
        [textViewMessage.text isEqualToString:@""] ||
        [textFieldPers.text isEqualToString:@""] ||
        ([buttonDate.titleLabel.text isEqualToString:@""] || [buttonDate.titleLabel.text isEqualToString:[NSString stringWithFormat:@"*%@", objDate.label]]) ||
        ([buttonHour.titleLabel.text isEqualToString:@""] || [buttonHour.titleLabel.text isEqualToString:[NSString stringWithFormat:@"*%@", objHour.label]]) ||
        ([buttonT332.titleLabel.text isEqualToString:@""] || [buttonT332.titleLabel.text isEqualToString:[NSString stringWithFormat:@"*%@", objT332.label]])
        ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:Localize(@"i_field_compulsary") delegate:self cancelButtonTitle:Localize(@"i_cok") otherButtonTitles:nil];
        [alert show];
        return;
    }
    if (![[Utility sharedManager] isValidEmailId:textFieldEmail.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:Localize(@"enter_valid_email") delegate:self cancelButtonTitle:Localize(@"i_cok") otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    [Utility showProgressView:@""];
    
    [[[DataManager sharedManager] tmDataDoctor] postReservationFormInBackground:0 name:textFieldBookingName.text email:textFieldEmail.text dateStr:buttonDate.titleLabel.text date_pers:textFieldPers.text timeStr:buttonHour.titleLabel.text timePeriod:buttonT332.titleLabel.text phone:textFieldContact.text message:textViewMessage.text success:^(id data) {
        [Utility hideProgressView];
        RLOG_DESC(@"success:%@", data);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:Localize(@"i_success") message:data delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        [alertView show];
        [self performSelector:@selector(dismissAlert:) withObject:alertView afterDelay:1.0f];
    } failure:^(NSString *error) {
        [Utility hideProgressView];
        RLOG_DESC(@"failure:%@", error);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Localize(@"sorry") message:error delegate:self cancelButtonTitle:Localize(@"i_cok") otherButtonTitles:nil];
        [alert show];
    }];
}
-(void)dismissAlert:(UIAlertView *) alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    [self barButtonBackPressed:nil];
}
- (void)dateSelectionButtonClicked:(id)sender {
    CGSize datePickerSize = CGSizeMake(320, 216);
    
    UIViewController *viewController = [[UIViewController alloc] init];
    UIView *viewForDatePicker = [[UIView alloc]initWithFrame:CGRectMake(0, 0, datePickerSize.width, datePickerSize.height)];
    UIDatePicker* datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, datePickerSize.width, datePickerSize.height)];
    NSString* userLocale = [[NSUserDefaults standardUserDefaults] valueForKey:USER_LOCALE];
    NSString* defaultLocale = [[NSUserDefaults standardUserDefaults] valueForKey:DEFAULT_LOCALE];
    NSString* selectedLocale = @"";
    if (userLocale && ![userLocale isEqualToString:@""]) {
        selectedLocale = userLocale;
    } else if (defaultLocale && ![defaultLocale isEqualToString:@""]) {
        selectedLocale = defaultLocale;
    } else {
        selectedLocale = @"en_US";
    }
    [datePicker setLocale: [NSLocale localeWithLocaleIdentifier:selectedLocale]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.hidden = NO;
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventAllTouchEvents];
    
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSDate *minDate = [NSDate date];
    datePicker.minimumDate = minDate;
    datePicker.date = minDate;
    [viewForDatePicker addSubview:datePicker];
    [viewController.view addSubview:viewForDatePicker];
    
    FPPopoverController *popOverForDatePicker = [[FPPopoverController alloc] initWithViewController:viewController];
    popOverForDatePicker.contentSize = CGSizeMake(datePickerSize.width,datePickerSize.height);
    popOverForDatePicker.arrowDirection = FPPopoverArrowDirectionUp | FPPopoverArrowDirectionDown | FPPopoverArrowDirectionLeft | FPPopoverArrowDirectionRight;
    popOverForDatePicker.delegate = self;
    [popOverForDatePicker presentPopoverFromView:buttonDate];
    popOverForDatePicker.border = NO;
    popOverForDatePicker.tint = FPPopoverWhiteTint;
    [popOverForDatePicker.view setTag:TAGS_RESERVATION_FORM_DATE];
}
- (void)hourSelectionButtonClicked:(id)sender {
    CGFloat height = [[MyDevice sharedManager] screenHeightInPortrait] * .30f;
    NIDropDown* niDD = [[NIDropDown alloc] init:buttonHour viewheight:height strArr:objHour.options imgArr:nil direction:NIDropDownDirectionDown pView:_scrollView];
    niDD.delegate = self;
    niDD.tag = TAGS_RESERVATION_FORM_HOUR;
    niDD.fontColor = [Utility getUIColor:kUIColorBgTheme];
}
- (void)t332SelectionButtonClicked:(id)sender {
    CGFloat height = [[MyDevice sharedManager] screenHeightInPortrait] * .30f;
    NIDropDown* niDD = [[NIDropDown alloc] init:buttonT332 viewheight:height strArr:objT332.options imgArr:nil direction:NIDropDownDirectionDown pView:_scrollView];
    niDD.delegate = self;
    niDD.tag = TAGS_RESERVATION_FORM_T332;
    niDD.fontColor = [Utility getUIColor:kUIColorBgTheme];
}
#pragma mark - UIDatePickerDelegate
- (void)dateChanged:(UIDatePicker*)uiDatePicker{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSDate* todayDate = [NSDate date];
    if (uiDatePicker.date.timeIntervalSince1970 < todayDate.timeIntervalSince1970) {
        [uiDatePicker setDate:todayDate animated:true];
    }
    NSDate* date = uiDatePicker.date;
    NSString* dateString = [dateFormat stringFromDate:date];
    [buttonDate setTitle:dateString forState:UIControlStateNormal];
    [buttonDate setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
    [buttonDate.titleLabel setUIFont:kUIFontType18 isBold:false];
    [buttonDateDD setTintColor:[Utility getUIColor:kUIColorFontLight]];
}
#pragma mark - FPPopoverControllerDelegate
- (void)popoverControllerDidDismissPopover:(FPPopoverController *)popoverController {
    if (popoverController.view.tag == TAGS_RESERVATION_FORM_DATE) {
        NSString* placeholderDate = objDate.label;
        placeholderDate = [NSString stringWithFormat:@"*%@", placeholderDate];
        if ([buttonDate.titleLabel.text isEqualToString:placeholderDate]) {
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd/MM/yyyy"];
            NSDate *selectedDate = [NSDate date];
            NSString* dateString = [dateFormat stringFromDate:selectedDate];
            [buttonDate setTitle:dateString forState:UIControlStateNormal];
            [buttonDate setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
            [buttonDate.titleLabel setUIFont:kUIFontType18 isBold:false];
            [buttonDateDD setTintColor:[Utility getUIColor:kUIColorFontLight]];
        }
    }
}

#pragma mark - NIDropDownDelegates
- (void)reponseDropDownDelegate:(NIDropDown *)sender clickedItemId:(int)clickedItemId {
    switch (sender.tag) {
        case TAGS_RESERVATION_FORM_HOUR:
        {
            NSString* selectedString = [objHour.options objectAtIndex:clickedItemId];
            [buttonHour setTitle:selectedString forState:UIControlStateNormal];
            [buttonHour setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
            [buttonHour.titleLabel setUIFont:kUIFontType18 isBold:false];
            [buttonHourDD setTintColor:[Utility getUIColor:kUIColorFontLight]];
        }break;
        case TAGS_RESERVATION_FORM_T332:
        {
            NSString* selectedString = [objT332.options objectAtIndex:clickedItemId];
            [buttonT332 setTitle:selectedString forState:UIControlStateNormal];
            [buttonT332 setTitleColor:[Utility getUIColor:kUIColorFontLight] forState:UIControlStateNormal];
            [buttonT332.titleLabel setUIFont:kUIFontType18 isBold:false];
            [buttonT332DD setTintColor:[Utility getUIColor:kUIColorFontLight]];
        }break;
        default:
            break;
    }
}
@end