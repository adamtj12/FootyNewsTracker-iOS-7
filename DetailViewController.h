//
//  DetailViewController.h
//  help me
//
//  Created by Adam Johnston on 27/11/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <MessageUI/MessageUI.h>


@class ShareViewController;

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id detailItem2;

//@property (retain, nonatomic) IBOutlet UIWebView *webview;
@property (retain, nonatomic) IBOutlet UIWebView *webview;

@property (retain, nonatomic) IBOutlet UIImageView *imageview;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
//- (IBAction)changeSource:(id)sender;


@property(strong,nonatomic) NSString *url;

@property (retain, nonatomic) ShareViewController  *shareviewcontroller;

@property (retain, nonatomic) IBOutlet UINavigationItem *headerdetail;
@property(strong,nonatomic)SLComposeViewController *mySLComposerSheet ;
@property (retain, nonatomic) IBOutlet UIButton *facebookbutton;
@property (retain,nonatomic) NSString *object;

//- (IBAction)sharelinktosocial:(id)sender;

//- (IBAction)problemmail:(id)sender;

- (IBAction)sharelink:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *twitter;

@property (retain, nonatomic) IBOutlet UIView *theview;

//- (IBAction)sendemail:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *sharebutton;
@property (retain, nonatomic) IBOutlet UIButton *twitbutton;


@property (retain, nonatomic) IBOutlet UIBarButtonItem *sharebutton2;

- (IBAction)sharelink2:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *sharebutton3;
- (IBAction)sharelink3:(id)sender;

@end
