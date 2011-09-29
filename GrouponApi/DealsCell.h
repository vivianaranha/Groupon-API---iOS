//
//  DealsCell.h
//  WouldYouMe
//
//  Created by Vivian Aranha on 6/14/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealsCell : UITableViewCell {
    //UIWebView *dealWebView;
    UIImageView *backgroundImageView;

    UILabel *dealLabel;
    UILabel *priceLabel;
    UILabel *daysLeftLabel;
    UILabel *purchasedLabel;
    UIImageView *buyItButton;
    UIImageView *dealImage;
    
    UIActivityIndicatorView *activityIndicator;
    UILabel *questionLabel;
    NSDictionary *dataDictionary;

}
//@property (nonatomic, retain) UIWebView *dealWebView;

@property (nonatomic, retain) UIImageView *backgroundImageView;

@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UILabel *questionLabel;
@property (nonatomic, retain) NSDictionary *dataDictionary;


@property (nonatomic, retain) UILabel *dealLabel;
@property (nonatomic, retain) UILabel *priceLabel;
@property (nonatomic, retain) UILabel *daysLeftLabel;
@property (nonatomic, retain) UILabel *purchasedLabel;
@property (nonatomic, retain) UIImageView *buyItButton;
@property (nonatomic, retain) UIImageView *dealImage;

-(void)setData:(NSDictionary *)dict;
-(void) interestedInDeal;

@end
