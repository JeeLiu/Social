//
//  ViewController.m
//  Social
//
//  Created by Xiaosen on 13-6-17.
//  Copyright (c) 2013年 WonderShare. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(refreshButtonStatus)
												 name:ACAccountStoreDidChangeNotification
											   object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(refreshButtonStatus)
												 name:kSocialTypeDidChangedNotification
											   object:nil];
	
	self.sendTextBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[_sendTextBtn setTitle:@"SendTextViaComposeViewController" forState:UIControlStateNormal];
	_sendTextBtn.frame = CGRectMake(20, 80, 280, 40);
	[_sendTextBtn addTarget:self
					 action:@selector(sendTextViaComposeViewController)
		   forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_sendTextBtn];
	NSLog(@"%@",_sendTextBtn);
	
	
	self.result = [[[UILabel alloc] initWithFrame:CGRectMake(20, 160, 280, 40)] autorelease];
	_result.backgroundColor = [UIColor clearColor];
	_result.font = [UIFont systemFontOfSize:15];
	[self.view addSubview:_result];
	
}


- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[_sendTextBtn release];
	[_result release];
    [super dealloc];
}


- (void)sendTextViaComposeViewController
{
	_result.text = @"";
	SLComposeViewController *currentComposeViewController = [SLComposeViewController composeViewControllerForServiceType:_tabbarController.currentSNSIndentifier];
	[currentComposeViewController setInitialText:@"Hello social framework!"];
	[currentComposeViewController addURL:[NSURL URLWithString:@"http://www.baidu.com"]];
	currentComposeViewController.completionHandler = ^(SLComposeViewControllerResult result){
		switch (result)
		{
			case SLComposeViewControllerResultDone:
				_result.text = @"Done!";
				break;
			case SLComposeViewControllerResultCancelled:
				_result.text = @"Canceled";
			default:
				break;
		}
		[currentComposeViewController	dismissViewControllerAnimated:YES
														 completion:nil];
	};
	[self presentViewController:currentComposeViewController
					   animated:YES
					 completion:nil];
}

- (void) refreshButtonStatus
{
	if ([SLComposeViewController isAvailableForServiceType:_tabbarController.currentSNSIndentifier])
	{
		_sendTextBtn.enabled = YES;
		_sendTextBtn.alpha = 1.0;
	}
	else
	{
		_sendTextBtn.enabled = NO;
		_sendTextBtn.alpha = 0.5;
	}
}

@end
