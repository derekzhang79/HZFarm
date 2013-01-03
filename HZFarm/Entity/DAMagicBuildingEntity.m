//
//  DAMagicBuildingEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAMagicBuildingEntity.h"

@implementation DAMagicBuildingEntity
@synthesize magicInfo;
@synthesize HenHouseParam;

-(id)init
{
    self=[super init];
    if (self) {
        HenHouseParam=[[DAMagicForHenHouseEntity alloc]init];
    }
    return self;
}

-(void) dealloc
{
    [magicInfo release];
    [HenHouseParam release];
    [super dealloc];
}

@end
