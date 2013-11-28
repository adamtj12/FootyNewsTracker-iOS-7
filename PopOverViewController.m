//
//  PopOverViewController.m
//  help me
//
//  Created by Adam Johnston on 03/12/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import "PopOverViewController.h"

#import "MasterViewController.h"

#import "ShareViewController.h"

@interface PopOverViewController ()

@end

@implementation PopOverViewController
{
     NSArray *tableData ;
    NSMutableArray *listOfSites;
     NSArray *linktofeed ;
}

@synthesize sourcetables;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
    static NSString *CellIdentifier = @"Cell";
    
    //---try to get a reusable cell---
    
    UITableViewCell *cell = [tableView
                             
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    //---create new cell if no reusable cell is available---
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc]
                 
                 initWithStyle:UITableViewCellStyleDefault
                 
                 reuseIdentifier:CellIdentifier] autorelease];
        
    }
    
    
    
    //---set the text to display for the cell---
    
    NSString *cellValue = [listOfSites objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cellValue;
    
    
    
    return cell;
    
}

//---set the number of rows in the table view---

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    
    return [listOfSites count];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    //self.detailViewController.detailItem = object;
    
    int i = 0 ;
    int k = 4 ;
   
    
    for(i =0;i<k;i++)
    {
        linktofeed[i];
        
        
    }
    
    NSString *object = [linktofeed objectAtIndex:indexPath.row];
    
    //self.masterviewcontroller.sourcelink = object ;
    //NSLog(@"%@ cat cat cat %d", object, i);
    
    [self performSegueWithIdentifier:@"mypush" sender:object];
    NSLog(@"%@", linktofeed[0]);
    
   

    
        
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@", NSStringFromClass([[segue destinationViewController] class]));
    
    if ([segue.identifier isEqualToString:@"mypush"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MasterViewController *controller = (MasterViewController *)segue.destinationViewController;
        controller.path = sender;
        NSLog(@"ha ha ha %@ haha ", controller.path);
        
    }
}


//load inforamtion when view first appears

- (void)viewDidLoad {
    
    
    //_labeltext.textColor=[UIColor whiteColor];
    
    //---initialize the array---
    
    listOfSites = [[NSMutableArray alloc] init];
    
    UIImageView *tempImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    //[tempImg setImage:[UIImage imageNamed:@"red.jpg"]];
    //[sourcetables setBackgroundView:tempImg];
    
    
    
    //---add items to list of sources---
    
    [listOfSites addObject:@"BBC Sport"];
    
    [listOfSites addObject:@"Sky Sports News"];
    
   // [listOfSites addObject:@"Manchester Evening News"];
    
    [listOfSites addObject:@"Manchester United Official"];
    
    [listOfSites addObject:@"Daily Mail"];
    
    [listOfSites addObject:@"The Sun"];
    
    [listOfSites addObject:@"Talksport"];
    
    [listOfSites addObject:@"Football 365"];
    
    [listOfSites addObject:@"The Guardian"];
    
    [listOfSites addObject:@"The New York Times"];

    [listOfSites addObject:@"Transfer Discussion"];
    
    [listOfSites addObject:@"Google News Headlines"];

    
    [listOfSites addObject:@"Eye Football"];
    
    [listOfSites addObject:@"ESPN Blogs"];
    
    [listOfSites addObject:@"Teamtalk"];
    
    [listOfSites addObject:@"league table"];
   
    //add link of feed to load content from
    linktofeed = [[NSMutableArray alloc] init];
    
    [linktofeed addObject:@"http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/football/teams/m/man_utd/rss.xml"];
    [linktofeed addObject:@"http://www1.skysports.com/feeds/11667/news.xml"];
   // [linktofeed addObject:@"http://www.manchestereveningnews.co.uk/all-about/manchester united fc?service=rss"];
    [linktofeed addObject:@"http://www.manutd.com/rss"];
    [linktofeed addObject:@"http://www.dailymail.co.uk/sport/teampages/manchester-united.rss"];
    [linktofeed addObject:@"http://feedity.com/thesun-co-uk/V1RRUlNS.rss"];
    [linktofeed addObject:@"http://feeds.feedburner.com/talksport-ManchesterUnited"];
    [linktofeed addObject:@"http://www.football365.com/manchester-united/rss"];
    [linktofeed addObject:@"http://feeds.guardian.co.uk/theguardian/football/manchester-united/rss"];
    [linktofeed addObject:@"http://topics.nytimes.com/topics/news/sports/soccer/premier-league/manchester-united/index.html?rss=1"];
    
    [linktofeed addObject:@"http://www.stretfordendarising.com/forum/external.php?type=RSS2&forumids=9"];
    
    [linktofeed addObject:@"http://news.google.com/news?q=manchester+united&hl=en&gl=ie&bav=on.2,or.r_gc.r_pw.r_qf.&bvm=bv.1357700187,d.ZG4&biw=1299&bih=871&um=1&ie=UTF-8&output=rss"];
    
    [linktofeed addObject:@"http://www.eyefootball.com/man-utd.xml"];
    
    [linktofeed addObject:@"http://soccernet.espn.go.com/blog/rss/_/name/manchesterunited"];

    [linktofeed addObject:@"http://www.teamtalk.com/manchester-united/rss"];


    [linktofeed addObject:@"http://www.footballwebpages.co.uk/league.xml?comp=1"];
   
    
    
    
    
    

        
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	//
}




- (void)dealloc {
    
    [listOfSites release];
    
    [sourcetables release];
    
    //[_labeltext release];
    [super dealloc];
    
}

@end
