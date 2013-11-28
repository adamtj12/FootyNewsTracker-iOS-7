//
//  MasterViewController.h
//  help me
//
//  Created by Adam Johnston on 27/11/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class PopOverViewController;
@class ShareViewController;

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    
    
    UIActivityIndicatorView * activityIndicator;
	
	CGSize cellSize;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
    
    NSMutableArray *_objects;
    
    NSString *path ;
    
	
	
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
    NSString * storyLink ;
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *button1;
//- (IBAction)changetablemenu:(id)sender;
//- (IBAction)changesource:(id)sender;

- (IBAction)changesources:(id)sender;

- (IBAction)shareLink:(id)sender;



@property (retain, nonatomic) IBOutlet UIBarButtonItem *buttonbar;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property(nonatomic,retain)NSString *storyLink;
@property(strong, nonatomic)NSString *path;
//@property (retain, nonatomic) IBOutlet UITableView *newsTable;
@property (retain, nonatomic) IBOutlet UITableView *newsTable;

//@property (retain, nonatomic) IBOutlet UITableView *newsTable;

@property (strong, nonatomic) ShareViewController *shareviewcontroller;

@property (strong, nonatomic) id detailItem2;

@property(nonatomic,retain)NSString *sourcelink;

- (IBAction)reload:(id)sender;

- (IBAction)changestuff:(id)sender;


//the table view for data to load into 
@property (retain, nonatomic) IBOutlet UITableView *tableview;

@end
