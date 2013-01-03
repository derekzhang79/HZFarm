//
//  DAItemVehicle.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAItemVehicle.h"

@implementation DAItemVehicle
@synthesize  nSpeed;// 速度
@synthesize nCapacity;//每格容量
@synthesize nBags;//格数
@synthesize nCargo;//每格承载货物
@synthesize nNeedPrice;//载货需要金币
@synthesize nNeedTime;//载货需要时间

-(void) dealloc
{
    [super dealloc];
}
@end
