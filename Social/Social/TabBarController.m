//
//  RootViewController.m
//  Social
//
//  Created by Xiaosen on 13-6-18.
//  Copyright (c) 2013年 WonderShare. All rights reserved.
//

#import "TabBarController.h"
#import "ComposeViewController.h"
NSString *kSocialTypeDidChangedNotification = @"SocialTypeDidChangedNotification";
@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	self.SNSTypes = [[[UISegmentedControl alloc] initWithItems:@[@"Sina",@"Twitter",@"Facebook"]] autorelease];
	_SNSTypes.frame = CGRectMake(20, 40, 280, 40);
	_SNSTypes.selectedSegmentIndex = 0;
	[_SNSTypes addTarget:self
				  action:@selector(changeSNS:)
		forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:_SNSTypes];
	_currentSNSIndentifier = SLServiceTypeSinaWeibo;
    // Do any additional setup after loading the view from its nib.
}



- (void)changeSNS:(id)sender
{
	switch (_SNSTypes.selectedSegmentIndex)
	{
		case 0:
			_currentSNSIndentifier = SLServiceTypeSinaWeibo;
			break;
		case 1:
			_currentSNSIndentifier = SLServiceTypeTwitter;
			break;
		case 2:
			_currentSNSIndentifier = SLServiceTypeFacebook;
			break;
		default:
			break;
	}
	[[NSNotificationCenter defaultCenter] postNotificationName:kSocialTypeDidChangedNotification object:_currentSNSIndentifier];
}

- (void)dealloc
{
	[_currentSNSIndentifier release];
	[_SNSTypes release];
	[super dealloc];
}
@end
