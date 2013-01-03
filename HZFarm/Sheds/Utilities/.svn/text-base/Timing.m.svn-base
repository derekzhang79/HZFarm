//
//  CommonClock.m
//  MapTest
//
//  Created by Any on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Timing.h"

@implementation Timing

@synthesize _delegate;
@synthesize _timeLong;
@synthesize _timing;

- (id)initWithTimeLong:(NSInteger)timeLong delegate:(id)delegate
{
    if ((self = [super init])) {
        self._delegate = delegate;
        self._timeLong = timeLong;
        self._timing = 0;
        
    }
    
    return self;
}

- (void)reset
{
    self._timing = 0;
}

- (void) step:(ccTime) dt
{
    if (self._timing < self._timeLong) {
        self._timing += dt;
    }
    else
    {
        [self._delegate onTimeOver];
    }
}

@end
