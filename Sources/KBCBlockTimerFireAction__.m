//
//  KBCBlockTimerFireAction__.m
//  BlockTimer
//
//  Created by Alexander I. Kovács on 2/29/16.
//  Copyright © 2016 Alexander I. Kovács. All rights reserved.
//

#import "KBCBlockTimerFireAction__.h"

@interface KBCBlockTimerFireAction__ ()
@property (nonatomic, readonly) KBCBlockTimerFireAction action;
@end

@implementation KBCBlockTimerFireAction__

- (id)initWithFireAction:(KBCBlockTimerFireAction)action
{
    self = [super init];
    if (self) {
        _action = [action copy];
    }
    return self;
}

- (void)fire:(NSTimer *)timer
{
    if (timer.isValid && self.action) {
        self.action(timer);
    }
}

@end
