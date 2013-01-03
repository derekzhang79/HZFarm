//
//  DABreedingBuildingEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DABreedingBuildingEntity.h"

@implementation DABreedingBuildingEntity
@synthesize CanBreedItem;
@synthesize nFeedMax;

-(void) dealloc
{
    [CanBreedItem release];
    [super dealloc];
}

@end
