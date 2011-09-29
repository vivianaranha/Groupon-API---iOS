//
//  DealsViewController.h
//  WouldYouMe
//
//  Created by Vivian Aranha on 6/14/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrouponApiAppDelegate.h"
#import "JSON.h"
#import "DealsCell.h"
#import "WebPageViewController.h"

@interface DealsViewController : UITableViewController {
    NSArray *dealsArray;
    NSMutableArray *myCellArray;
    CLLocation *currentLocation;

}

@property (nonatomic, retain) CLLocation *currentLocation;
@property (nonatomic, retain) NSArray *dealsArray;
@property (nonatomic, retain) NSMutableArray *myCellArray;

@end
