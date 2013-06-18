//
//  RootViewController.h
//  Social
//
//  Created by Xiaosen on 13-6-18.
//  Copyright (c) 2013年 WonderShare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
extern NSString *kSocialTypeDidChangedNotification;
@interface TabBarController : UITabBarController

@property (copy, nonatomic) NSString *currentSNSIndentifier;
@property (retain, nonatomic)  UISegmentedControl *SNSTypes;

-(void) changeSNS:(id)sender;
@end
