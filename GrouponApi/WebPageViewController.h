//
//  WebPageViewController.h
//  WouldYou
//
//  Created by Vivian Aranha on 11/17/10.
//  Copyright 2010 Self. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebPageViewController : UIViewController <UIWebViewDelegate>{
	NSURL* appURL;
    UIView *modalView;
}

@property (nonatomic, retain) NSURL* appURL;;
@end

