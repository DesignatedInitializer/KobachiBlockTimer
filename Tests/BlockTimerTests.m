//
//  BlockTimerTests.m
//  BlockTimerTests
//
//  Created by Alexander I. Kovács on 2/29/16.
//  Copyright © 2016 Alexander I. Kovács. All rights reserved.
//

@import XCTest;

#import "NSTimer+KobachiBlockTimer.h"

@interface BlockTimerTests : XCTestCase
@property (nonatomic) NSTimer *timer;
@end

@implementation BlockTimerTests

- (void)testFireOnMainThread
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Timer Fires"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 action:^(NSTimer *timer) {
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:0.2 handler:nil];
}

- (void)testFireOnBackgroundThreadWronglyScheduled
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Timer Fires"];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(void){
        self.timer = [NSTimer timerWithTimeInterval:0.1 action:^(NSTimer *timer) {
            XCTFail(@"The timer was not supposed to fire because it wasn't scheduled on a run loop.");
        }];
#if 0 // Set to 1 to make test fail
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
#else
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
#endif
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:0.3 handler:nil];
}


- (void)testFireOnBackgroundThreadCorrectyScheduled
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Timer Fires"];

    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^(void){
        self.timer = [NSTimer timerWithTimeInterval:0.1 action:^(NSTimer *timer) {
            [expectation fulfill];
        }];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    });
    [self waitForExpectationsWithTimeout:0.3 handler:nil];
}

@end
