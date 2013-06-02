//
//  NRStatusBarNotification.m
//  NRStatusBarNotification
//
//  Created by 藤田 直 on 13/06/02.
//  Copyright (c) 2013年 Naosim. All rights reserved.
//

#import "NRStatusBarNotification.h"
#import "NRMessageNotification.h"


@interface NRStatusBarNotification() {
    UIView* _notificationView;
    NSMutableArray* _messageQueue;
}
@end

@implementation NRStatusBarNotification
- (id)init {
    if(self = [super init]) {
        _messageQueue = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)addNotificationData:(NSObject<NRStatusBarNotificationData>*)data {
    [_messageQueue addObject:data];
    if([_messageQueue count] == 1) [self showWithNotificationData:_messageQueue[0]];
}

- (void)removeNotificationData:(NSObject<NRStatusBarNotificationData>*)data {
    if([_messageQueue indexOfObject:data] == 0) [self dismiss];
    else [_messageQueue removeObject:data];
    
}

- (void)showWithNotificationData:(NSObject<NRStatusBarNotificationData>*)data {
    UIApplication* app = [UIApplication sharedApplication];
    
    data.notofication = self;
    _notificationView = data.notificationView;

    if(!app.statusBarHidden)[app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [(UIWindow*)[app windows][0] addSubview:_notificationView];
    
    [data start];
}

- (void)dismiss {
    ((NSObject<NRStatusBarNotificationData>*)_messageQueue[0]).notofication = nil;
    [_messageQueue removeObjectAtIndex:0];
    if([_messageQueue count] > 0) {
        [self showNextNotification];
    } else {
        [self finishAllNotification];
    }
}

- (void)showNextNotification {
    [self removeNotificationView];
    [self showWithNotificationData:_messageQueue[0]];
}

- (void)finishAllNotification {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [UIView animateWithDuration:0.5 animations:^{
        _notificationView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeNotificationView];
    }];
}

- (void)removeNotificationView {
    [_notificationView removeFromSuperview];
    _notificationView = nil;
}

+ (void)showWithNotificationData:(NSObject<NRStatusBarNotificationData>*)data {
    static NRStatusBarNotification* notification = nil;
    if(notification == nil) notification = [NRStatusBarNotification new];
    
    [notification performSelectorOnMainThread:@selector(addNotificationData:) withObject:data waitUntilDone:NO];
    
}
@end
