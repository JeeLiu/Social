//
//  ViewController.h
//  Social
//
//  Created by Xiaosen on 13-6-17.
//  Copyright (c) 2013年 WonderShare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

#import "TabBarController.h"

@interface ComposeViewController : UIViewController

@property (assign, nonatomic) TabBarController *tabbarController;
@property (retain, nonatomic) UIButton *sendTextBtn;
@property (retain, nonatomic) UILabel *result;

- (void)sendTextViaComposeViewController;

	// change sendTextBtn status after users changed their accounts setting
- (void) refreshButtonStatus;
@end
