//
//  GrouponApiAppDelegate.h
//  GrouponApi
//
//  Created by Vivian Aranha on 9/29/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Reachability.h"
#import "MainViewController.h"

@interface GrouponApiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {
    CLLocation *currentLocation;
    CLLocationManager *locationManager;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) CLLocation *currentLocation;

@end


//Category Implementation for UINavigationBar
@implementation UINavigationBar (CustomImage)
- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed: @"top_bar.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end