//
//  NRStatusBarNotification.h
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NRStatusBarNotificationDataRemove.h"
#import "NRStatusBarNotificationData.h"



@interface NRStatusBarNotification : NSObject <NRStatusBarNotificationDataRemove>
+ (void)showWithNotificationData:(NSObject<NRStatusBarNotificationData>*)data;
@end
