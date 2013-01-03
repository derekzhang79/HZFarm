//
//  ShedsModelDelegate.h
//  MapTest
//
//  Created by Any on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EggModel;
@class PoultryModel;

@protocol ShedsModelServer <NSObject>

- (NSInteger)reportFood;

- (NSInteger)reportWater;

- (void)addFood;

- (void)addWater;

- (NSInteger)reportLevel;

- (void)foodCost:(NSInteger)cost chick:(PoultryModel *)poultry;

- (void)waterCost:(NSInteger)cost chick:(PoultryModel *)poultry;

//- (BOOL)pay:(NSInteger)pay;

- (void)addEgg:(EggModel *)egg;

- (void)occupyFence:(NSInteger)fenceId;

- (BOOL)isFreed:(NSInteger)fenceId;

- (void)releaseFence:(NSInteger)fenceId;

- (BOOL)isAnyFenceFree;

- (NSString*)reportShedsID;

@end
