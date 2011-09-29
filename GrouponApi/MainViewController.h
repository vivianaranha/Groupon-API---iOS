//
//  MainViewController.h
//  GrouponApi
//
//  Created by Vivian Aranha on 9/29/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "JSON.h"
#import "DealsViewController.h"

@interface MainViewController : UIViewController {
    CLLocation *currentLocation;
}

@property (nonatomic, retain) CLLocation *currentLocation;

@end
