//
//  DAProcessingBuildingEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAProcessingBuildingEntity.h"

@implementation DAProcessingBuildingEntity
@synthesize ProParam;
@synthesize CanProItemsArr;

-(id) init
{
    self=[super init];
    if (self) {
        CanProItemsArr=[[NSMutableArray alloc]init];
    }
    return self;
}


-(void) dealloc
{
    [CanProItemsArr release];
    [super dealloc];
}

@end
