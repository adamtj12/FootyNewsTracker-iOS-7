//
//  MasterViewController.m
//  help me
//
//  Created by Adam Johnston on 27/11/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "PopOverViewController.h"

#import "ShareViewController.h"

@interface MasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MasterViewController

@synthesize path;
@synthesize storyLink;
@synthesize newsTable;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)dealloc
{
    //[tableview release];
    //[newsTable release];
    [newsTable release];
    [super dealloc];
    [_detailViewController release];
    [_fetchedResultsController release];
    [_managedObjectContext release];
    //[newsTable release];
    [_button1 release];
    [_buttonbar release];
    
    [MasterViewController release];
    [path release];
}

//Loading all content into the view

- (void)viewDidLoad
{
       [super viewDidLoad];
    
     [self.tableView reloadData];
    //setting background image
    UIImageView *tempImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    //[tempImg setImage:[UIImage imageNamed:@"red.jpg"]];
    //[newsTable setBackgroundView:tempImg];
   
    self.buttonbar.title = @"stories";
    
    
   
    
    [self.navigationItem setHidesBackButton:TRUE];
    
   
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
 }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

//how many sections will be in the table?
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // [[self.fetchedResultsController sections] count];
    
    return 1 ;
}
//number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    //return [sectionInfo numberOfObjects];
    
    return [stories count];//number of rows will be loaded from the amount of stories loaded from source
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
   
    
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
	[cell setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
    
    
    
    return cell;
}
//can table be edited?
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

 //is the table reorderable
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}
//is object selected at path?
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    //self.detailViewController.detailItem = object;
    
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    
    storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
    
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
    
   
    NSString *object = storyLink;
    self.detailViewController.detailItem = object ;
    
   
}



- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"timeStamp"] description];
}
//if view has appeared on screen then perform these actions
- (void)viewDidAppear:(BOOL)animated {
	//[super viewDidAppear:animated];
	
    NSLog(@"jghkhsrtkhjtsrlhj %@", path);
    
    //if the path doesnt contain anything then skip to the selection of sources. path will only contain something once a source and story have been selected.
	if (path == nil) {
       // path = @"http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/football/teams/m/man_utd/rss.xml";
        
        //if there is no source then move to the source table
         [self performSegueWithIdentifier:@"skipifnosource" sender:self];
    }
    
   [self parseXMLFileAtURL:path];
    
    
	
	
	cellSize = CGSizeMake([newsTable bounds].size.width, 60);
}

//this is where the movement of views occurs
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@", NSStringFromClass([[segue destinationViewController] class]));
    //move to detail view controller
    if ([segue.identifier isEqualToString:@"skipifnosource"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *controller = (DetailViewController *)segue.destinationViewController;
        //controller.path = sender;
        //NSLog(@"ha ha ha %@ haha ", controller.path);
        
    }
}


- (void)viewDidDisappear:(BOOL)animated {
}



- (void)parserDidStartDocument:(NSXMLParser *)parser{
	NSLog(@"found file and started parsing");
	
}

/* these sources were used a lot to help with the following code: http://www.tekritisoftware.com/ios-xml-parsing-for-iphone-application-development 
 
 http://jmsliu.com/1134/iphone-rss-reader-app-ios-tutorial-3-xml-parser-in-ios.html*/


//begin parsing xml content 
- (void)parseXMLFileAtURL:(NSString *)URL
{
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}
//if an error occurs..
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * SourceSelect = [[UIAlertView alloc] initWithTitle:@"Please Choose A Source from the Options To the Left" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[SourceSelect show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
	
}
//store elements in order in an array for loading into table
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	
}
//finished loading stories
- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
	[newsTable reloadData];
}


//reload view
- (IBAction)reload:(id)sender {
    [self.tableView reloadData];
    
    
}



@end
