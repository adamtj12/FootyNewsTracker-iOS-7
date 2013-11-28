//
//  ShareViewController.h
//  help me
//
//  Created by Adam Johnston on 06/12/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <MessageUI/MessageUI.h>

@interface ShareViewController : UIViewController
{
    SLComposeViewController *mySLComposerSheet;
}


@property(strong,nonatomic)SLComposeViewController *mySLComposerSheet ;
//@property (retain, nonatomic) IBOutlet UIButton *facebookbutton;
@property (strong, nonatomic) NSString *sharelink;
//@property(strong, nonatomic)NSString *pathtoshare;
//@property (retain, nonatomic) IBOutlet UIButton *sharetofacebook;
@property (strong, nonatomic) NSString *sharefacebooklink;

//- (IBAction)sharestuff:(id)sender;
//- (IBAction)sharestufftwitter:(id)sender;

- (IBAction)sharestufftofacebook:(id)sender;
- (IBAction)sharestufftotwitter:(id)sender;


@property(strong,nonatomic)NSString *sharetotwitter;
@property(strong,nonatomic)NSString *sharetomail;

- (IBAction)sharelinktomail:(id)sender;

//- (IBAction)sharelinktomail:(id)sender;

@end
