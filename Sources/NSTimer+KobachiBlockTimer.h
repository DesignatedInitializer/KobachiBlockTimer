//
//  NSTimer+KobachiBlockTimer.h
//  BlockTimer
//
//  Created by Alexander I. Kovács on 2/29/16.
//  Copyright © 2016 Alexander I. Kovács. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

typedef void(^KBCBlockTimerFireAction)(NSTimer *timer);

@interface NSTimer (KobachiBlockTimer)

/**
 *
 * Creates and returns a new NSTimer object object initialized with the specified block, and schedules it on the current 
 * run loop in the default mode. Instead of passing target and selector, this timer will execute the specified block when 
 * it fires.
 *
 * @see NSTimer
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval userInfo:(nullable id)userInfo repeats:(BOOL)repeats action:(KBCBlockTimerFireAction)action;

/**
 * Creates and returns a new NSTimer object initialized with the specified block. The timer must be scheduled on a
 * run loop to fire. The convenience method +[KBCBlockTimer scheduledTimerWithTimeInterval:userInfo:repeats:action:] uses
 *
 * [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
 *
 * to schedule the timer on the current run loop in the default mode. Note that this won't work on background threads that have no run loop set up. In order to schedule the timer from a background thread like this use
 *
 * [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
 *
 * @see NSTimer
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval userInfo:(nullable id)userInfo repeats:(BOOL)repeats action:(KBCBlockTimerFireAction)action;

/**
 * Convenience method for non-repeating timers where it's easier to just capture state inside the specified action block
 * rather than passing a userInfo object.
 *
 * @see +scheduledTimerWithTimeInterval:userInfo:repeats:action:
 *
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval action:(KBCBlockTimerFireAction)action;

/**
 * Convenience method for non-repeating timers where it's easier to just capture state inside the specified action block
 * rather than passing a userInfo object.
 *
 * @see +timerWithTimeInterval:userInfo:repeats:action:
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval action:(KBCBlockTimerFireAction)action;

@end

NS_ASSUME_NONNULL_END
