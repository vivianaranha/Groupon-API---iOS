//
//  WebPageViewController.m
//  WouldYou
//
//  Created by Vivian Aranha on 11/17/10.
//  Copyright 2010 Self. All rights reserved.
//

#import "WebPageViewController.h"


@implementation WebPageViewController

@synthesize appURL;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    UIImage *menuImage = [UIImage imageNamed:@"back.png"];
	UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[leftButton setBackgroundImage: [menuImage stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
	leftButton.frame= CGRectMake(0.0, 0.0, menuImage.size.width, menuImage.size.height);
	[leftButton addTarget:self action:@selector(loadMenu)   forControlEvents:UIControlEventTouchUpInside];
	UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, menuImage.size.width, menuImage.size.height) ];
	[backView addSubview:leftButton];
	UIBarButtonItem *back	= [[UIBarButtonItem alloc] initWithCustomView:backView];
	self.navigationItem.leftBarButtonItem = back;
	
	UIWebView *webView  = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 450)];
	webView.scalesPageToFit = YES;
    webView.delegate = self;
	webView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[webView loadRequest:[NSURLRequest requestWithURL:appURL]];
    [self.view addSubview:webView];
	[webView release];
    
    NSLog(@"%@",[appURL absoluteString]);
    //[self performSelectorInBackground:@selector(sendEmail) withObject:nil];
    
    
    modalView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 320, 56)];

    modalView.opaque = NO;
//    modalView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7f];
  
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 220, 56)];
    imageView.image = [UIImage imageNamed:@"loadingBg.png"];
    [modalView addSubview:imageView];
    [imageView release];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 300, 40)];
    label.text = @"Loading Page...";
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.opaque = NO;
    [modalView addSubview:label];
    [label release];
    
    [self.view addSubview:modalView];
	
}


- (void)dealloc {
    [super dealloc];
}

- (void)loadMenu
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [modalView removeFromSuperview];
}

/*
 -(void)sendEmail{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
	
    
    NSString *url_string = [NSString stringWithFormat:@"http://remotetiger.net/apps/testmail.php?url=%@",[appURL absoluteString]];
    
	NSURL *url = [NSURL URLWithString:url_string];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	NSURLResponse *response = NULL;
	NSError *requestError = NULL;
	NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	
	[pool release];
    
}
*/
@end
