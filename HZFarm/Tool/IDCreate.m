//
//  IDCreate.m
//  MapTest
//
//  Created by liwensheng on 12-4-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IDCreate.h"
#import "DateTool.h"

@implementation IDCreate
+(NSString *) getBuildingID
{
//    NSDate * date=[NSDate date];
//    NSTimeInterval timeSpan=[date timeIntervalSince1970];
   int n= arc4random()%9999;
    NSString *BID=[NSString stringWithFormat:@"%@-%d",[DateTool Now],n];
    return BID;
}
+(NSString *) getTableID
{
//    NSDate * date=[NSDate date];
//    NSTimeInterval timeSpan=[date timeIntervalSince1970];
    int n= arc4random()%9999;
    NSString *tID=[NSString stringWithFormat:@"%i-%d",[DateTool Now],n];
    return tID;
}
@end
