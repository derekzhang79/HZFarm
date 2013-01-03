//
//  DAPFactoryDataEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAPFactoryDataEntity.h"
#import "DAItemInFactory.h"

@implementation DAPFactoryDataEntity
@synthesize ItemsInfactory;
-(id) init
{
    self=[super init];
    if (self) {
        ItemsInfactory=[[NSMutableArray alloc]init];
    }
    return self;
}
-(NSArray*) GetDataFromFactoryID:(NSString*)factoryID
{
    NSMutableArray *szItem=[[NSMutableArray alloc]init];
    for(DAItemInFactory* subItem in self.ItemsInfactory)
    {
        if ([factoryID isEqualToString:subItem.factoryID]) {
            [szItem addObject:subItem];
        }
    }
    return [szItem autorelease];
}
-(void)dealloc
{
    self.ItemsInfactory=nil;
    [super dealloc];
}
@end
