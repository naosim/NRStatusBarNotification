//
//  NRStatusBarNotificationData.h
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NRStatusBarNotificationDataRemove.h"

@protocol NRStatusBarNotificationData <NSObject>
@property (nonatomic, readonly)UIView* notificationView;
@property (nonatomic, assign)id<NRStatusBarNotificationDataRemove> notofication;
- (void)start;
@end
