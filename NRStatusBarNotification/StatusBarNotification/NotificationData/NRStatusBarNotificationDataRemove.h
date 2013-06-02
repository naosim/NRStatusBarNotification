//
//  NRStatusBarNotificationDataRemove.h
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NRStatusBarNotificationData;

@protocol NRStatusBarNotificationDataRemove <NSObject>
- (void)removeNotificationData:(NSObject<NRStatusBarNotificationData>*)data;
@end
