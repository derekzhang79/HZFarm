//
//  DAItemInFactory.m
//  MapTest
//
//  Created by liwensheng on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAItemInFactory.h"
#import "DateTool.h"

@implementation DAItemInFactory

@synthesize sysName;
@synthesize startTime;
@synthesize factoryID;//加工厂ID
@synthesize needTime;//加工需要时间
@synthesize iNum;
@synthesize tID;
-(int) getActiveTime
{
    return [DateTool GetTimeSpanFromEarly:startTime];
}
-(void) dealloc
{
    self.sysName=nil;
    self.startTime=nil;
    self.tID=nil;
    [super dealloc];
}
@end
