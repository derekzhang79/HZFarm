//
//  DAMagicForHenHouseEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAMagicForHenHouseEntity.h"

@implementation DAMagicForHenHouseEntity
@synthesize kFeedItems;
@synthesize kFood;
@synthesize kWater;


-(void) dealloc
{
    self.kFeedItems=nil;
    [super dealloc];
}

@end
