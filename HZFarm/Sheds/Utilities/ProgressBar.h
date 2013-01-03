//
//  ProgressBar.h
//  Sheds
//
//  Created by Any on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"
#import "ProgressBarDelegate.h"

@interface ProgressBar : CCNode
{
    id<ProgressBarDelegate> _delegate;
    NSInteger _timeLong;
    CGFloat _timing;
    CCSprite *_frame;
    CCSprite *_content;
}

@property (nonatomic, assign)id<ProgressBarDelegate> _delegate;
@property (nonatomic)NSInteger _timeLong;
@property (nonatomic)CGFloat _timing;
@property (nonatomic, retain)CCSprite *_frame;
@property (nonatomic, retain)CCSprite *_content;

- (id)initWithTimeLong:(NSInteger)timeLong delegate:(id)delegate;

- (void)reset;

@end
