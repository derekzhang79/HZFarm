//
//  DAProductItemInfo.m
//  MapTest
//
//  Created by liwensheng on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAProductItemInfo.h"

@implementation DAProductItemInfo
@synthesize sysName;
@synthesize itemType;
@synthesize kProduct;

-(void) dealloc
{
    self.sysName=nil;
    self.itemType=nil;
    [super dealloc];
}
@end
