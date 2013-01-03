//
//  Tilednode.m
//  MapTest
//
//  Created by hzbc on 12-4-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Tilednode.h"


@implementation Tilednode
@synthesize ISTREE, ISHOUSE,ISROAD,ISBLUE,ISCANADDOBJECT;
-(id)init
{
    if( (self=[super init])) {
    ISTREE=NO;;
    ISHOUSE=NO;
    ISROAD=NO;
    ISBLUE=YES;
        ISCANADDOBJECT=YES;
    }
     return self;
}


@end
