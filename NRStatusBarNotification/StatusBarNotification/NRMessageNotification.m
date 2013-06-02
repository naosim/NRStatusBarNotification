//
//  MessageNotificationData.m
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "NRMessageNotification.h"

@implementation NRMessageNotification
+ (void)showWithMessage:(NSString*)message {
    NRMessageNotificationData* data = [NRMessageNotificationData new];
    data.message = message;
    [NRStatusBarNotification showWithNotificationData:data];
}
@end


