//
//  DateTool.m
//  MapTest
//
//  Created by liwensheng on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool
//获取当前时间秒数 since 1970
+(NSString*) Now
{
    return [self FormatDate:[NSDate date]]; 
}
//格式化时间
+(NSString*) FormatDate:(NSDate*) datetime
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"M/d/yyyy h:m a"];
    NSString * stringTime=[formatter stringFromDate:datetime];
    [formatter release];
    return stringTime;
}
//获得早期时间和现在时间差
+(long) GetTimeSpanFromEarly:(NSString*) earlyDate
{
    if (nil==earlyDate) {
        return 1;
    }
    long nspin=[self GetTimeSpan:earlyDate LaterDate:[self Now]];
    if (nspin<0) {
        return 1;
    }
    return nspin ;
}
//获得时间差
+(long) GetTimeSpan:(NSString*)earlyDate LaterDate:(NSString*)ldate
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"M/d/yyyy h:m a"];
    NSDate* early=[formatter dateFromString:earlyDate];
    NSDate* latter=[formatter dateFromString:ldate];
    NSTimeInterval subtime=[latter timeIntervalSinceDate:early];
    [formatter release];
    return (long)subtime;
}
//根据较早的一个时间和一个时间差得到特定的时间
+(NSString*) GetTimeFromSpanAndEarly:(long)lSpan EarlyDate:(NSString*)earlyDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"M/d/yyyy h:m a"];
    NSDate *date_early = [formatter dateFromString:earlyDate];
    NSDate *date = [NSDate dateWithTimeInterval:lSpan sinceDate:date_early];
    NSString *stringTime = [formatter stringFromDate:date];
    [formatter release];
    return stringTime;
}

@end
