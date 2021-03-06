//
//  NSTimer+BlockTimer.m
//  KobachiBlockTimer
//
//  Created by Alexander I. Kovács on 2/29/16.
//  Copyright © 2016 Alexander I. Kovács. All rights reserved.
//

#import "NSTimer+BlockTimer.h"

#import "KBCBlockTimerFireAction__.h"

@implementation NSTimer (BlockTimer)

#pragma mark - Initialization

+ (NSTimer *)kbc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)repeats action:(KBCBlockTimerFireAction)action
{
    NSParameterAssert(action != nil);
    if (action == nil) { return nil; }
    
    KBCBlockTimerFireAction__ *fireAction = [[KBCBlockTimerFireAction__ alloc] initWithFireAction:action];
    return [self scheduledTimerWithTimeInterval:interval target:fireAction selector:@selector(fire:) userInfo:userInfo repeats:repeats];
}

+ (NSTimer *)kbc_timerWithTimeInterval:(NSTimeInterval)interval userInfo:(id)userInfo repeats:(BOOL)repeats action:(KBCBlockTimerFireAction)action
{
    NSParameterAssert(action != nil);
    if (action == nil) { return nil; }
    
    KBCBlockTimerFireAction__ *fireAction = [[KBCBlockTimerFireAction__ alloc] initWithFireAction:action];
    return [self timerWithTimeInterval:interval target:fireAction selector:@selector(fire:) userInfo:userInfo repeats:repeats];
}

+ (NSTimer *)kbc_scheduledTimerWithTimeInterval:(NSTimeInterval)interval action:(KBCBlockTimerFireAction)action
{
    return [self kbc_scheduledTimerWithTimeInterval:interval userInfo:nil repeats:NO action:action];
}

+ (NSTimer *)kbc_timerWithTimeInterval:(NSTimeInterval)interval action:(KBCBlockTimerFireAction)action
{
    return [self kbc_timerWithTimeInterval:interval userInfo:nil repeats:NO action:action];
}

@end
