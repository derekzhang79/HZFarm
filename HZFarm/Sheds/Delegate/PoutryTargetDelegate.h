//
//  PoutryTargetDelegate.h
//  Sheds
//
//  Created by Any on 12-4-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PoutryTargetDelegate <NSObject>

- (void)moveTo:(CGPoint)dest;

- (CGPoint)reportPos;

- (void)setPos:(CGPoint)pos;

- (void)arriveAndDo:(NSInteger)act;

@end
