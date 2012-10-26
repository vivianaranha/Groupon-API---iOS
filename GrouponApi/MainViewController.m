//
//  MainViewController.m
//  GrouponApi
//
//  Created by Vivian Aranha on 9/29/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize currentLocation;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"background.png"];
	UIImageView *backView = [[UIImageView alloc] initWithFrame:[self.view bounds]];
	backView.image = bgImage;
	[self.view addSubview:backView];
	[backView release];	

    
    //DEALS BUTTON
	UIButton *btnDeals = [UIButton buttonWithType:UIButtonTypeCustom];
	[btnDeals addTarget:self action:@selector(searchDeals) forControlEvents:UIControlEventTouchDown];
	UIImage *btnDealsImage = [UIImage imageNamed:@"dealsBtn.png"];
	[btnDeals setBackgroundImage:btnDealsImage forState:UIControlStateNormal];
	btnDeals.frame = CGRectMake(120, 118, 84, 86);
    [self.view addSubview:btnDeals];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)searchDeals{
	[self performSelectorInBackground: @selector(getDeals) withObject:nil];
}

-(void) getDeals{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    CLLocationCoordinate2D coordinate = [self.currentLocation coordinate];
    NSMutableString *url_string = [[NSMutableString alloc] init];
    [url_string appendString:@"http://api.groupon.com/v2/deals.json?client_id=65fc16791036c3c53678ad31ad3e8bd03a072bb4"];
    
    if([CLLocationManager locationServicesEnabled]){
        [url_string appendFormat:@"&lat=%f&lon=%f&radius=100.0",coordinate.latitude, coordinate.longitude];
    } 
    
    
    NSURL *url = [NSURL URLWithString:url_string];
    [url_string release];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSURLResponse *response = NULL;
    NSError *requestError = NULL;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    
    SBJSON *json = [[SBJSON new] autorelease];
    NSError *jsonError;
    NSDictionary *parsedJSON = [json objectWithString:responseString error:&jsonError];
    [responseString release];
    
    
    
    if([parsedJSON objectForKey:@"deals"]){
        DealsViewController *deals = [[DealsViewController alloc] init];
        deals.dealsArray = [parsedJSON objectForKey:@"deals"];
        deals.currentLocation = self.currentLocation;
        [self performSelectorOnMainThread:@selector(displayDeals:) withObject:deals waitUntilDone:YES];
    } else {
        
        UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"No Deals Found" message:@"Unable to retrieve any deals. Try Again Later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[errorAlert show];
		[errorAlert release];
        [self performSelectorOnMainThread:@selector(removeLoadingScreen) withObject:nil waitUntilDone:YES];
        
    }
    
    
    [pool release];
    
}

-(void) displayDeals:(DealsViewController *)deals{
    [self.navigationController pushViewController:deals animated:YES];
    [deals release];
}

@end
