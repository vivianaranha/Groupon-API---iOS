//
//  GrouponApiAppDelegate.m
//  GrouponApi
//
//  Created by Vivian Aranha on 9/29/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "GrouponApiAppDelegate.h"

@implementation GrouponApiAppDelegate


@synthesize window=_window;
@synthesize currentLocation;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    Reachability *r = [Reachability reachabilityWithHostName:@"www.google.com"];
	NetworkStatus internetStatus = [r currentReachabilityStatus];
	
	if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN))
	{
		UIAlertView *myAlert = [[UIAlertView alloc]
								initWithTitle:@"Oops" message:@"No Internet Connection Available"
								delegate:self
								cancelButtonTitle:@"Ok"
								otherButtonTitles:nil];
		[myAlert show];
		[myAlert release];
	} 
	else
	{
		
		if ([CLLocationManager locationServicesEnabled]) {
			locationManager = [[CLLocationManager alloc] init];
			[locationManager setDelegate:self];
			[locationManager setDistanceFilter:kCLDistanceFilterNone];
			[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
			[locationManager startUpdatingLocation];
		} 
        
	}
    
    MainViewController *mainVc = [[MainViewController alloc] init];
    mainVc.title = @"Groupon Deals";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainVc];
    [mainVc release];
    self.window.rootViewController = navigationController;
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{ 
	CLLocationCoordinate2D coordinate = [locationManager.location coordinate];
	
	if ((coordinate.latitude !=0 ) && (coordinate.longitude != 0)) {
		self.currentLocation = newLocation;
        [manager stopUpdatingLocation]; 
        
	}
	
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{ 
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting location" message:@"Location cant be determined. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[manager stopUpdatingLocation];
}



- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
