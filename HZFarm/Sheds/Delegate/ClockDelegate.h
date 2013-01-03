//
//  ClockDelegate.h
//  Sheds
//
//  Created by Any on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PoultryClockDelegate <NSObject>

- (void)timeToLay;
- (void)timeToEat;
- (void)timeToDrink;

@end

@protocol ShedsClockDelegate <NSObject>

- (void)timeToAddFood;
- (void)timeToAddWater;

@end
