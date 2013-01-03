//
//  PoultryClock.h
//  Sheds
//
//  Created by Any on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "ClockDelegate.h"


typedef enum{
    running = 1,
    paused,
    stoped
    
}ClockState;

@interface PoultryClock : NSObject
{
    id<PoultryClockDelegate> _delegate;
    
    CGFloat _layTiming;
    ClockState _layTimingState;
    CGFloat   _layCycle;
    CGFloat _eatTiming;
    ClockState _eatTimingState;
    CGFloat   _eatCycle;
    CGFloat _drinkTiming;
    ClockState _drinkTimingState;
    CGFloat   _drinkCycle;
}
@property (nonatomic, assign)id<PoultryClockDelegate> _delegate;
@property (nonatomic)CGFloat _layTiming;
@property (nonatomic)ClockState _layTimingState;
@property (nonatomic)CGFloat   _layCycle;
@property (nonatomic)CGFloat _eatTiming;
@property (nonatomic)ClockState _eatTimingState;
@property (nonatomic)CGFloat   _eatCycle;
@property (nonatomic)CGFloat _drinkTiming;
@property (nonatomic)ClockState _drinkTimingState;
@property (nonatomic)CGFloat   _drinkCycle;

- (void)resetLayClock:(NSInteger)startTime;
- (void)pauseLayClock;
- (void)recoverLayClock;
- (void)stopLayClock;

- (void)resetEatClock:(NSInteger)startTime;
- (void)pauseEatClock;
- (void)recoverEatClock;
- (void)stopEatClock;

- (void)resetDrinkClock:(NSInteger)startTime;
- (void)pauseDrinkClock;
- (void)recoverEatClock;
- (void)stopDrinkClock;

- (void)step:(ccTime)dt;

@end
