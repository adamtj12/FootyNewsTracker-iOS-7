//
//  ShareViewController.m
//  help me
//
//  Created by Adam Johnston on 06/12/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

@synthesize sharefacebooklink;
@synthesize sharetotwitter;

@synthesize sharetomail;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//load content
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    sharetotwitter  = sharefacebooklink ; // setting the witter value

    sharetomail = sharefacebooklink;
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    //[_facebookbutton release];
    //[_sharetofacebook release];
    //[_sharestufftwitter release];
    //[sharetomail release];
    [super dealloc];
}


//share links to facebook
- (IBAction)sharestufftofacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) //check if Facebook Account is linked
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook]; //determine what social media to share to
        if(sharefacebooklink == NULL)
        {
            [mySLComposerSheet setInitialText:[NSString stringWithFormat:
                                               @"Posted from the PremierFootyNewsTracker for iPad, Download now from the App Store!"]];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:@"There is no link currently selected" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        else
        {
            [mySLComposerSheet setInitialText:[NSString stringWithFormat:
                                               @"Posted from the PremierFootyNewsTracker for iPad %@", sharefacebooklink]];
            
            
            
        }
        //for more instance methodes, go here:https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Reference/SLComposeViewController_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40012205
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }

}
//share to twitter
- (IBAction)sharestufftotwitter:(id)sender {
    
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) //check if Twitter Account is signed in on iOS
    {
        mySLComposerSheet = [[SLComposeViewController alloc] init]; //initiate the Social Controller
        mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter]; //choose social media platform to share to
        if(sharefacebooklink == NULL)
        {//message to post
            [mySLComposerSheet setInitialText:[NSString stringWithFormat:
                                               @"Posted from the PremierFootyNewsTracker for iPad, Download now from the App Store!"]];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:@"There is no link currently selected" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
        else
        {
            [mySLComposerSheet setInitialText:[NSString stringWithFormat:
                                               @"Posted from FootyNewsTracker %@", sharetotwitter]];
        }
        //for more instance methodes, go here:https://developer.apple.com/library/ios/#documentation/NetworkingInternet/Reference/SLComposeViewController_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40012205
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }

}
@end
