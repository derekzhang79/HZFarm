//
//  PoultryClock.m
//  Sheds
//
//  Created by Any on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PoultryClock.h"

@implementation PoultryClock

@synthesize _delegate;
@synthesize _layTiming;
@synthesize _layTimingState;
@synthesize _layCycle;
@synthesize _eatTiming;
@synthesize _eatTimingState;
@synthesize _eatCycle;
@synthesize _drinkTiming;
@synthesize _drinkTimingState;
@synthesize _drinkCycle;

- (id)init
{
    if ((self = [super init])) {
        self._layTiming = 0;
        self._eatTiming = 0;
        self._drinkTiming = 0;
        self._layTimingState = stoped;
        self._eatTimingState = stoped;
        self._drinkTimingState = stoped;
        self._layCycle = 0;
        self._eatCycle = 0;
        self._drinkCycle = 0;
        
        self._delegate = nil;
    }
    
    return self;
}

- (void)resetLayClock:(NSInteger)startTime
{
    self._layTiming = startTime;
    self._layTimingState = running;
}
- (void)pauseLayClock
{
    if (self._layTimingState == running) {
        self._layTimingState = paused;
    }
}
- (void)recoverLayClock
{
    if (self._layTimingState == paused) {
        self._layTimingState = running;
    }
}
- (void)stopLayClock
{
    self._layTiming = 0;
    self._layTimingState = stoped;
}
//--------------------------------------------------

- (void)resetEatClock:(NSInteger)startTime
{
    self._eatTiming = startTime;
    self._eatTimingState = running;
}
- (void)pauseEatClock
{
    if (self._eatTimingState == running) {
        self._eatTimingState = paused;
    }
}
- (void)recoverEatClock
{
    if (self._eatTimingState == paused) {
        self._eatTimingState = running;
    }
}
- (void)stopEatClock
{
    self._eatTiming = 0;
    self._eatTimingState = stoped;
}
//--------------------------------------------------

- (void)resetDrinkClock:(NSInteger)startTime
{
    self._drinkTiming = startTime;
    self._drinkTimingState = running;
}
- (void)pauseDrinkClock
{
    if (self._drinkTimingState == running) {
        self._drinkTimingState = paused;
    }
}
- (void)recoverDrinkClock
{
    if (self._drinkTimingState == paused) {
        self._drinkTimingState = running;
    }
}
- (void)stopDrinkClock
{
    self._drinkTiming = 0;
    self._drinkTimingState = stoped;
}
//--------------------------------------------------

- (void)step:(ccTime)dt
{
    if (self._layTimingState == running) {
        self._layTiming += dt;
        if (self._layTiming >= self._layCycle) {
            [self stopLayClock];
            [self._delegate timeToLay];
            
        }
    }
    
    if (self._eatTimingState == running) {
        self._eatTiming += dt;
        if (self._eatTiming >= self._eatCycle) {
            [self stopEatClock];
            [self._delegate timeToEat];
        }
    }
    
    if (self._drinkTimingState == running) {
        self._drinkTiming += dt;
        if (self._drinkTiming >= self._drinkCycle) {
            [self stopDrinkClock];
            [self._delegate timeToDrink];
        }
    }
}

@end
