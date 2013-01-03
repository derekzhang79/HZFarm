//
//  DAWareHouseDataEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAWareHouseDataEntity.h"

@implementation DAWareHouseDataEntity
@synthesize ItemEggs;
@synthesize ItemPoultry;
@synthesize ItemVehicle;
@synthesize ItemProducts;
@synthesize ItemProp;
-(id) init
{
    self=[super init];
    if (self) {
        ItemEggs=[[NSMutableArray alloc]init];
        ItemProducts=[[NSMutableArray alloc]init];
        ItemPoultry=[[NSMutableArray alloc]init];
        ItemVehicle=[[NSMutableArray alloc]init];
        ItemProp=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void) dealloc
{
    self.ItemPoultry=nil;
    self.ItemEggs=nil;
    self.ItemProducts=nil;
    self.ItemVehicle=nil;
    self.ItemProp=nil;
    [super dealloc];
}

@end
