//
//  MasterViewController.h
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
