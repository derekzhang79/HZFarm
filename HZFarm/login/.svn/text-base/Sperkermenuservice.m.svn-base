//
//  Sperkermenuservice.m
//  MapTest
//
//  Created by hzbc on 12-4-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Sperkermenuservice.h"

@implementation Sperkermenuservice
static Sperkermenuservice* sharedSperkermenuservice = nil;

@synthesize kind;



+(Sperkermenuservice*)getSharedSperkermenuservice
{
    if (sharedSperkermenuservice == nil) {
        sharedSperkermenuservice = [[self alloc] init];
    }
    return sharedSperkermenuservice;
}
-(void)makethekind:(int)kindd
{

    kind=kindd;
}
-(int)getthekind
{
    
    return kind;
}
@end
