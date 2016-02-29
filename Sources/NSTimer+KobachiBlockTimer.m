//
//  NSTimer+KobachiBlockTimer.m
//  BlockTimer
//
//  Created by Alexander I. Kovács on 2/29/16.
//  Copyright © 2016 Alexander I. Kovács. All rights reserved.
//

#import "NSTimer+KobachiBlockTimer.h"

#import "KBCBlockTimerFireAction__.h"

@implementation NSTimer (KobachiBlockTimer)

#pragma mark - Initialization

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)repeats action:(KBCBlockTimerFireAction)action
{
    NSParameterAssert(action != nil);
    
    KBCBlockTimerFireAction__ *fireAction = [[KBCBlockTimerFireAction__ alloc] initWithFireAction:action];
    return [self scheduledTimerWithTimeInterval:interval target:fireAction selector:@selector(fire:) userInfo:userInfo repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)repeats action:(KBCBlockTimerFireAction)action
{
    NSParameterAssert(action != nil);
    
    KBCBlockTimerFireAction__ *fireAction = [[KBCBlockTimerFireAction__ alloc] initWithFireAction:action];
    return [self timerWithTimeInterval:interval target:fireAction selector:@selector(fire:) userInfo:userInfo repeats:repeats];
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval action:(KBCBlockTimerFireAction)action
{
    return [self scheduledTimerWithTimeInterval:interval userInfo:nil repeats:NO action:action];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval action:(KBCBlockTimerFireAction)action
{
    return [self timerWithTimeInterval:interval userInfo:nil repeats:NO action:action];
}

@end
