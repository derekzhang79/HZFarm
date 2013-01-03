//
//  ProgressBar.m
//  Sheds
//
//  Created by Any on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ProgressBar.h"

@implementation ProgressBar

@synthesize _delegate;
@synthesize _timeLong;
@synthesize _timing;
@synthesize _frame;
@synthesize _content;

- (id)initWithTimeLong:(NSInteger)timeLong  delegate:(id)delegate
{
    if ((self = [super init])) {
        
        self._delegate = delegate;
        self._timeLong = timeLong;
        self._timing = 0;
        
        _frame = [[CCSprite alloc] initWithFile:@"strip_0.png"];
        self._frame.position = ccp(0, 0);
        self._frame.anchorPoint = ccp(0, 0);
        [self addChild:self._frame z:0];
        
        _content = [[CCSprite alloc] initWithFile:@"strip_1.png"];
        self._content.position = ccp(0, 0);
        self._content.anchorPoint = ccp(0, 0);
        self._content.scaleX = 0;
        [self addChild:self._content z:1];
        
        [self scheduleUpdate];
    }
    
    return self;
}

- (void) update:(ccTime) dt
{
    if (self._timing < self._timeLong) {
        self._timing += dt;
        self._content.scaleX = self._timing/self._timeLong;
    }
    else
    {
        [self._delegate progressEnd];
    }
}

- (void)reset
{
    self._timing = 0;
}

- (void)dealloc
{
    self._content = nil;
    self._frame = nil;
    [super dealloc];
}

@end
