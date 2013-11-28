//
//  GoogleNewsViewController.m
//  Man United News
//
//  Created by Adam Johnston on 13/01/2013.
//  Copyright (c) 2013 Adam Johnston. All rights reserved.
//

#import "GoogleNewsViewController.h"

@interface GoogleNewsViewController ()

@end

@implementation GoogleNewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//load google news 
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    NSString *url = @"https://www.google.com/search?hl=en&gl=ie&tbm=nws&q=manchester+united&oq=manchester+united&gs_l=news-cc.3..43j0l3j43i400.1593.6109.0.6356.23.6.1.16.13.1.118.463.4j2.6.0...0.0...1ac.1.EpJuJ_OzeyIScheme";
    
    
    
    UIImageView *tempImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [tempImg setImage:[UIImage imageNamed:@"red.jpg"]];
    
     [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    //[theview setBackgroundView:tempImg];
    
    //_twitsfeed.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"bamboowood.jpg"]]];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webview release];
    [super dealloc];
}
@end
