//
//  DealsCell.m
//  WouldYouMe
//
//  Created by Vivian Aranha on 6/14/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "DealsCell.h"

@implementation DealsCell

@synthesize activityIndicator, questionLabel, dataDictionary, backgroundImageView;

@synthesize dealLabel, priceLabel, daysLeftLabel, purchasedLabel, buyItButton, dealImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.contentView.backgroundColor = [UIColor blackColor];
        
               
        self.backgroundImageView = [[UIImageView alloc] init];
		self.backgroundImageView.image = [UIImage imageNamed:@"background.png"];
		self.backgroundImageView.frame = CGRectMake(0, 0, 320, 480);
		[self.contentView addSubview:self.backgroundImageView];
		[self.backgroundImageView release];
        
        UIImageView *yipitBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yipitBg.png"]];
        yipitBg.frame = CGRectMake(0, 20, 320, 260);
        [self.contentView addSubview:yipitBg];
        [yipitBg release];
        
        buyItButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buyItBtn.png"]];
        buyItButton.frame = CGRectMake(190, 165, 60, 32);
        [self.contentView addSubview:buyItButton];
        [buyItButton release];
        
        UIButton *btnLayer = [UIButton buttonWithType:UIButtonTypeCustom];
        btnLayer.frame = CGRectMake(0, 20, 320, 260);
        [btnLayer addTarget:self action:@selector(interestedInDeal) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btnLayer];
        
        UIButton *btnGrouponLayer = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btnGrouponLayer.frame = CGRectMake(20, 210, 150, 50);
        [btnGrouponLayer addTarget:self action:@selector(grouponLink) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btnGrouponLayer];
        
        
        //Activity Indicator
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.center = self.contentView.center;
        [self.contentView addSubview:activityIndicator];
        //[activityIndicator startAnimating];
        
        
        //Deal Label
        dealLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 35, 270, 40)];
        dealLabel.backgroundColor = [UIColor clearColor];
        dealLabel.textAlignment = UITextAlignmentLeft;
        dealLabel.textColor = [UIColor darkGrayColor];
        dealLabel.lineBreakMode = UILineBreakModeWordWrap;
        dealLabel.numberOfLines = 2;
        dealLabel.font = [UIFont boldSystemFontOfSize:15.0];
        [self.contentView addSubview:dealLabel];
        
        
        self.dealImage = [[UIImageView alloc] init];
        self.dealImage.contentMode = UIViewContentModeScaleAspectFit;
		self.dealImage.frame = CGRectMake(20, 82, 100, 100);
		[self.contentView addSubview:self.dealImage];
		[self.dealImage release];

        
        priceLabel  = [[UILabel alloc] initWithFrame:CGRectMake(160, 80, 120, 15)];
        priceLabel.backgroundColor = [UIColor clearColor];
        priceLabel.textAlignment = UITextAlignmentCenter;
        priceLabel.textColor = [UIColor colorWithRed:105.0/255.0 green:155.0/255.0 blue:5.0/255.0 alpha:1.0];
        priceLabel.font = [UIFont boldSystemFontOfSize:13.0];
        [self.contentView addSubview:priceLabel];
        
        daysLeftLabel =  [[UILabel alloc] initWithFrame:CGRectMake(160, 105, 120, 15)];
        daysLeftLabel.backgroundColor = [UIColor clearColor];
        daysLeftLabel.textAlignment = UITextAlignmentCenter;
        daysLeftLabel.textColor = [UIColor colorWithRed:176.0/255.0 green:69.0/255.0 blue:57.0/255.0 alpha:1.0];
        daysLeftLabel.font = [UIFont boldSystemFontOfSize:13.0];
        [self.contentView addSubview:daysLeftLabel];
        
        purchasedLabel =  [[UILabel alloc] initWithFrame:CGRectMake(160, 130, 120, 15)];
        purchasedLabel.backgroundColor = [UIColor clearColor];
        purchasedLabel.textAlignment = UITextAlignmentCenter;
        purchasedLabel.textColor = [UIColor blackColor];
        purchasedLabel.font = [UIFont boldSystemFontOfSize:13.0];
        [self.contentView addSubview:purchasedLabel];
        
        //Photo Caption
        
        UIButton *btnQuestion = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnQuestionImg = [UIImage imageNamed:@"questionLayer.png"];
        [btnQuestion setImage:btnQuestionImg forState:UIControlStateNormal];
        [btnQuestion setImage:btnQuestionImg forState:UIControlStateHighlighted];
        
        btnQuestion.frame = CGRectMake(0, 300, 185, 100);
        btnQuestion.enabled = NO;
        
        questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 150, 60)];
        questionLabel.backgroundColor = [UIColor clearColor];
        questionLabel.textColor = [UIColor whiteColor];
        questionLabel.textAlignment = UITextAlignmentCenter;
        questionLabel.numberOfLines = 3;
        questionLabel.font = [UIFont fontWithName:@"Arial" size:13.0];
        questionLabel.lineBreakMode = UILineBreakModeWordWrap;
        
        btnQuestion.tag = 1;
        [btnQuestion addSubview:questionLabel];
        [self.contentView addSubview:btnQuestion];
        
        
        UILabel *swipeLabel = [[UILabel alloc] initWithFrame:CGRectMake(175, 320, 130, 60)];
        swipeLabel.backgroundColor = [UIColor clearColor];
        swipeLabel.textColor = [UIColor whiteColor];
        swipeLabel.textAlignment = UITextAlignmentCenter;
        swipeLabel.numberOfLines = 3;
        swipeLabel.font = [UIFont fontWithName:@"Arial" size:13.0];
        swipeLabel.lineBreakMode = UILineBreakModeWordWrap;
        swipeLabel.text = @"SWIPE TO SEE MORE DEALS";
        [self.contentView addSubview:swipeLabel];
        
       
        
        
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)downloadImage:(id)path{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init ];
	
	NSURL *url = [NSURL URLWithString:path];
	NSData *data = [NSData dataWithContentsOfURL:url];
	
	UIImage *img = [[UIImage alloc] initWithData:data];
	self.dealImage.image = img;
	[img release];
	[pool release];
	
}

-(void)setData:(NSDictionary *)dict{
    self.dataDictionary = dict;
    
    
    id path = [dict objectForKey:@"mediumImageUrl"];
	[self performSelectorInBackground:@selector(downloadImage:) withObject:path];

    if([[dict objectForKey:@"announcementTitle"] isEqualToString:@""]){
            dealLabel.text = [dict objectForKey:@"title"];
    } else {
        dealLabel.text = [dict objectForKey:@"announcementTitle"];
    }
    
    
    priceLabel.text = [NSString stringWithFormat:@"Value: %@",[[[[dict objectForKey:@"options"] objectAtIndex:0] objectForKey:@"price"] objectForKey:@"formattedAmount"]];
    
    daysLeftLabel.text = [NSString stringWithFormat:@"Discount: %@%%",[[[dict objectForKey:@"options"] objectAtIndex:0] objectForKey:@"discountPercent"]];
    
    
    purchasedLabel.text = [NSString stringWithFormat:@"You Save: %@",[[[[dict objectForKey:@"options"] objectAtIndex:0] objectForKey:@"discount"] objectForKey:@"formattedAmount"]];
    
    
    if([[[[dict objectForKey:@"options"] objectAtIndex:0]objectForKey:@"redemptionLocations"] count] == 0){
        
        questionLabel.text = @"No Location Available";
    } else {
        questionLabel.text = [[[[[[dict objectForKey:@"options"] objectAtIndex:0]objectForKey:@"redemptionLocations"] objectAtIndex:0] objectForKey:@"streetAddress1"] stringByAppendingFormat:@", %@, %@", [[[[[dict objectForKey:@"options"] objectAtIndex:0] objectForKey:@"redemptionLocations"] objectAtIndex:0] objectForKey:@"state"], [[[[[dict objectForKey:@"options"] objectAtIndex:0] objectForKey:@"redemptionLocations"] objectAtIndex:0] objectForKey:@"city"] ] ;
    
    }
    
  
}


- (void)dealloc
{
    [super dealloc];
}

-(void) interestedInDeal{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"show deal" object:self];
}

-(void) grouponLink{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"grouponlink" object:self];
}


@end
