//
//  KBCBlockTimerFireAction__.h
//  KobachiBlockTimer
//
//  Created by Alexander I. Kovács on 2/29/16.
//  Copyright © 2016 Alexander I. Kovács. All rights reserved.
//

#import "NSTimer+BlockTimer.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Using a separate class as NSTimer target just so we don't have to add an associated object to NSTimer to retain the
 * specified action block.
 */
@interface KBCBlockTimerFireAction__ : NSObject
- (id)initWithFireAction:(KBCBlockTimerFireAction)action;
- (void)fire:(NSTimer *)timer;
@end

NS_ASSUME_NONNULL_END
