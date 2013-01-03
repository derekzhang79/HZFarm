//
//  DASpecialItemEntity.m
//  MapTest
//
//  Created by liwensheng on 12-4-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DASpecialItemEntity.h"

@implementation DASpecialItemEntity
@synthesize  sysName;
@synthesize  disName;
@synthesize nMoney;
@synthesize nDiamond;


-(void) dealloc
{
    self.sysName=nil;
    self.disName=nil;
    [super dealloc];
}
@end
