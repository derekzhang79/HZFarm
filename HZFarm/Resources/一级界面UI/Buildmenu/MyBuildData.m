//
//  MyBuildDataServer.m
//  MapTest
//
//  Created by Yunky on 12-4-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyBuildData.h"

@implementation BuildData

@synthesize name;
@synthesize pic;

- (BuildData *)init
{
    if(self = [super init]) {
        NSDictionary *tmp = [[NSDictionary alloc]initWithContentsOfFile:@"Building1.plist"];
        self.name = [tmp allKeys];
        self.pic = [tmp allValues];
        [tmp release];
    }

	return self;
}

@end