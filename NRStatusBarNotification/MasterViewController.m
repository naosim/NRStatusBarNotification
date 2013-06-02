//
//  MasterViewController.m
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "MasterViewController.h"
#import "NRMessageNotification.h"
#import "NRStatusBarNotificationData.h"

@interface CustomNotificationData : NSObject<NRStatusBarNotificationData> {
    int value;
    UILabel* label;
}
- (void)add;
@end

@implementation CustomNotificationData
@synthesize notofication;
@synthesize notificationView;
- (id)init {
    if(self = [super init]) {
        notificationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        notificationView.backgroundColor = [UIColor blackColor];
        
        UIActivityIndicatorView* aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        aiv.center = CGPointMake(40, 10);
        [aiv startAnimating];
        [notificationView addSubview:aiv];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200, 20)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
        [notificationView addSubview:label];
    }
    return self;
}

- (void)start {
    value = 0;
    [self updateLabel];
}

- (void)updateLabel {
    label.text = [NSString stringWithFormat:@"%d", value];
}

- (void)add {
    value += 20;
    [self updateLabel];
    if(value == 100) {
        [self.notofication removeNotificationData:self];
    }
}
@end

@interface MasterViewController() {
    CustomNotificationData* customNotificationData;
}

@end



@implementation MasterViewController

- (IBAction)hello {
    static int n = 0;
    [NRMessageNotification showWithMessage:[NSString stringWithFormat:@"hello %d", n++]];
}

- (IBAction)byebye {
    static int n = 0;
    NRMessageNotificationData* data = [NRMessageNotificationData new];
    data.message = [NSString stringWithFormat:@"byebye %d", n++];
    data.notificationView.backgroundColor = [UIColor yellowColor];
    data.notificationView.textColor = [UIColor blackColor];
    data.duration = 1;
    [NRStatusBarNotification showWithNotificationData:data];
}

- (IBAction)startLoad {
    customNotificationData = [CustomNotificationData new];
    [NRStatusBarNotification showWithNotificationData:customNotificationData];
}
- (IBAction)add {
    [customNotificationData add];
}
@end
