//
//  CommonClock.h
//  MapTest
//
//  Created by Any on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimingDelegate.h"
#import "cocos2d.h"

@interface Timing : CCNode
{
    id<TimingDelegate> _delegate;
    CGFloat _timeLong;
    CGFloat _timing;
}

@property (nonatomic, assign)id<TimingDelegate> _delegate;
@property (nonatomic)CGFloat _timeLong;
@property (nonatomic)CGFloat _timing;

- (id)initWithTimeLong:(NSInteger)timeLong delegate:(id)delegate;

- (void)reset;

- (void)step:(ccTime)dt;

@end
