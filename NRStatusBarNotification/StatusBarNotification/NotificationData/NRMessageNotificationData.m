//
//  MessageNotificationData.m
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "NRMessageNotificationData.h"

#define NOTIFICATION_DEFAULT_MESSAGE_COLOR [UIColor whiteColor]
#define NOTIFICATION_DEFAULT_BACKGROUND_COLOR [UIColor blackColor]
#define NOTIFICATION_DEFAULT_DURATION (1.5)
#define NOTIFICATION_DEFAULT_FONT [UIFont fontWithName:@"Arial-BoldMT" size:15]
#define NOTIFICATION_STATUSBAR_WIDTH (320)
#define NOTIFICATION_STATUSBAR_HEIGHT (20)

@interface NRMessageNotificationData() {
    UILabel* _notificationView;
}
@end

@implementation NRMessageNotificationData
@synthesize notofication;

- (id)init {
    if(self = [super init]) {
        _notificationView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, NOTIFICATION_STATUSBAR_WIDTH, NOTIFICATION_STATUSBAR_HEIGHT)];
        _notificationView.textColor = NOTIFICATION_DEFAULT_MESSAGE_COLOR;
        _notificationView.backgroundColor = NOTIFICATION_DEFAULT_BACKGROUND_COLOR;
        _notificationView.font = NOTIFICATION_DEFAULT_FONT;
        _notificationView.textAlignment = NSTextAlignmentCenter;
        self.duration = NOTIFICATION_DEFAULT_DURATION;
    }
    return self;
}

- (void)setMessage:(NSString *)message {
    _notificationView.text = message;
}

- (NSString*)message {
    return _notificationView.text;
}

- (void)start {
    [(NSObject*)self.notofication performSelector:@selector(removeNotificationData:) withObject:self afterDelay:self.duration];
}
@end

