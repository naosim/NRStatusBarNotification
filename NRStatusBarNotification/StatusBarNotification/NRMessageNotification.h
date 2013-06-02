//
//  MessageNotificationData.h
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NRStatusBarNotificationData.h"
#import "NRStatusBarNotification.h"
#import "NRMessageNotificationData.h"

@interface NRMessageNotification : NSObject
+ (void)showWithMessage:(NSString*)message;
@end
