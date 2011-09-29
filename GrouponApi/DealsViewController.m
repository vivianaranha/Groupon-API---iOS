//
//  DealsViewController.m
//  WouldYouMe
//
//  Created by Vivian Aranha on 6/14/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "DealsViewController.h"


@implementation DealsViewController

@synthesize dealsArray, myCellArray;
@synthesize currentLocation;

int dealCount = 5;


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

- (void)viewDidLoad
{
    [super viewDidLoad];
    


    self.tableView.frame = CGRectMake(-75, 85, 470, 320);
    self.tableView.transform=CGAffineTransformMakeRotation(-M_PI/2);
    self.tableView.pagingEnabled = YES;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.separatorColor = [UIColor blackColor];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showDeal:) name:@"show deal" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(grouponLink) name:@"grouponlink" object:nil];
    
    
    myCellArray = [NSMutableArray new];
	for (int i = 0; i < [dealsArray count]; ++i) {
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
		UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
		[myCellArray addObject:cell];
		
	}
    
    UIImage *menuImage = [UIImage imageNamed:@"menu.png"];
	UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[leftButton setBackgroundImage: [menuImage stretchableImageWithLeftCapWidth:7.0 topCapHeight:0.0] forState:UIControlStateNormal];
	leftButton.frame= CGRectMake(0.0, 0.0, menuImage.size.width, menuImage.size.height);
	[leftButton addTarget:self action:@selector(loadMenu)    forControlEvents:UIControlEventTouchUpInside];
	UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, menuImage.size.width*2, menuImage.size.height) ];
	[backView addSubview:leftButton];
    
    UIBarButtonItem *back	= [[UIBarButtonItem alloc] initWithCustomView:backView];
    [backView release];
	self.navigationItem.leftBarButtonItem = back;
    [back release];
    self.title = @"DEALS";
    
    
//    [self performSelectorInBackground:@selector(getMoreDeals) withObject:nil];

        
    
}



-(void)grouponLink{
    
    NSString *stringURL = @"http://touch.groupon.com/";
    NSURL *url = [NSURL URLWithString:stringURL];
    
    WebPageViewController *webStats = [[WebPageViewController alloc] init];
    webStats.appURL = url;
    webStats.title = @"Groupon";
    [self.navigationController pushViewController:webStats animated:YES];
    [webStats release];
    
}


-(void)showDeal:(id)sender{
	DealsCell *dealCell = [sender object];
    
    NSString * dealStr = (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[dealCell.dataDictionary objectForKey:@"dealUrl"],NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8);

    
    NSString *stringURL = [NSString stringWithFormat:@"http://www.anrdoezrs.net/click-5304097-10804307?url=%@",dealStr];
    
    NSLog(@"%@",stringURL);

    NSURL *url = [NSURL URLWithString:stringURL];
        
    WebPageViewController *webStats = [[WebPageViewController alloc] init];
    webStats.appURL = url;
    webStats.title = @"Deal Details";
    [self.navigationController pushViewController:webStats animated:YES];
    [webStats release];
    
}

- (void)loadMenu
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [dealsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    DealsCell *cell = (DealsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ([myCellArray count] > indexPath.row) {
        return [myCellArray objectAtIndex:indexPath.row];
    } else {
        cell = [[[DealsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    [cell setData:[dealsArray objectAtIndex:indexPath.row]]; 
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    cell.transform=CGAffineTransformMakeRotation(+M_PI/2);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 320;
}





@end
