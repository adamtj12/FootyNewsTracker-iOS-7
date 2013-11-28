//
//  TwitterViewController.m
//  help me
//
//  Created by Adam Johnston on 06/12/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//load twitter feed
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
   
    
    NSString *url = @"https://twitter.com/search?q=manchesterunited&src=typd";
    
    
    
    UIImageView *tempImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [tempImg setImage:[UIImage imageNamed:@"red.jpg"]];
    //[theview setBackgroundView:tempImg];
    
    

    
    [self.twitsfeed loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_twitsfeed release];
    [super dealloc];
}
@end
