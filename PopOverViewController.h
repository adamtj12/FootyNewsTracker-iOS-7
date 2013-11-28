//
//  PopOverViewController.h
//  help me
//
//  Created by Adam Johnston on 03/12/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MasterViewController;
@class ShareViewController;


@interface PopOverViewController : UITableViewController 


<UITableViewDataSource> {
    

}

@property (strong, nonatomic) MasterViewController *masterviewcontroller;

@property (strong, nonatomic) ShareViewController *shareviewcontroller;

//@property (retain, nonatomic) IBOutlet UITableView *sourcetable;
//@property (retain, nonatomic) IBOutlet UILabel *labeltext;

@property (retain, nonatomic) IBOutlet UITableView *sourcetables;


@end

