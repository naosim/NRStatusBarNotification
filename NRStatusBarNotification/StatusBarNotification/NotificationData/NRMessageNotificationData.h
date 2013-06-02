//
//  MessageNotificationData.h
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NRStatusBarNotificationData.h"


@interface NRMessageNotificationData : NSObject <NRStatusBarNotificationData>
@property (nonatomic, strong)NSString* message;
@property (nonatomic, assign)NSTimeInterval duration;
@property (nonatomic, readonly)UILabel* notificationView;
@end