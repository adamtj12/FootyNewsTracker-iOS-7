//
//  DetailViewController.m
//  help me
//
//  Created by Adam Johnston on 27/11/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.

#import "DetailViewController.h"
#import "ShareViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize url;
@synthesize headerdetail;
@synthesize theview;

- (void)dealloc
{
    [_detailItem release];
    [_detailDescriptionLabel release];
    [_masterPopoverController release];
    [_webview release];
    [headerdetail release];
    [theview release];
    [_webview release];
    [_webview release];
    [_twitter release];
    [_sharebutton release];
    [_twitbutton release];
    [_imageview release];
    [_sharebutton release];
    
    [_sharebutton2 release];
    [_sharebutton3 release];
    [super dealloc];
    [DetailViewController release];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];

        // Update the view.
        [self configureView];
        
    }
  
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}
//load page from source
-(void)loadSelectedPage
{
    
    self.imageview.hidden = YES ;
    self.sharebutton3.hidden = NO;
    url = [NSString stringWithFormat:@"%@", [_detailItem description]];
    self.object = url ;
    NSLog(@"%@ meh meh meh", self.url);
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [self.webview setNeedsDisplay];
    
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        _detailDescriptionLabel.text = @"Adam Johnston";
        [self loadSelectedPage];
    }
}

//load view 
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view setNeedsDisplay];
    
    self.sharebutton3.hidden = YES;
   
    //[theview setBackgroundView:tempImg];
    
    //_webview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bamboowood.jpg"]]];
    
    
    theview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"red.jpg"]]];

    
    [self.view setNeedsLayout];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];

 
        [self.imageview setImage:[UIImage imageNamed:@"landscape5.png"]];
    
    
    //if(sel)
    
    
    
    NSLog(@"mamamamamamama %@", url);
    
    //headerdetail = url ;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view
//code for enabling the split view controller
- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Stories", @"Stories");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


- (IBAction)sharelink2:(id)sender {
    
    NSLog(@"gggggg %@ khyohiyhhhhhh", url);
    
    
    [self performSegueWithIdentifier:@"movelink" sender:url];
    
}




/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@", NSStringFromClass([[segue destinationViewController] class]));
    
    if ([segue.identifier isEqualToString:@"movelink"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ShareViewController *controller = (ShareViewController *)segue.destinationViewController;
        controller.sharefacebooklink = sender;
        NSLog(@"to to to %@ ha ha ha", url);
        
    }
    
    
    
}*/

//did not implement
- (IBAction)problemmail:(id)sender {
    
    
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"A Suggestion or Bug in FootyNewsTracker"];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"adamjoasis@icloud.com", nil];
        [mailer setToRecipients:toRecipients];
        //UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
        //NSData *imageData = UIImagePNGRepresentation(myImage);
        //[mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
        NSString *emailBody = @"What I want to say about FootyNewsTracker is:";
        [mailer setMessageBody:emailBody isHTML:NO];
        mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:mailer animated:YES];
        [mailer release];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        [alert release];
        
        
    }
    

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self dismissModalViewControllerAnimated:YES];
}

// send data to new view
- (IBAction)sharelink3:(id)sender {
    
    
    [self performSegueWithIdentifier:@"movelink2" sender:url];
    
}



//prepare for switch of view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@", NSStringFromClass([[segue destinationViewController] class]));
    
    if ([segue.identifier isEqualToString:@"movelink2"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ShareViewController *controller = (ShareViewController *)segue.destinationViewController;
        controller.sharefacebooklink = sender;
        NSLog(@"to to to %@ ha ha ha", url);
        
    }
    
    
    
}@end
