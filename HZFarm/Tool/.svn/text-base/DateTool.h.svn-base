//
//  DateTool.h
//  MapTest
//
//  Created by liwensheng on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTool : NSObject
//获取当前时间秒数 since 1970
+(NSString*) Now;
//格式化时间
+(NSString*) FormatDate:(NSDate*) datetime;
//获得早期时间和现在时间差
+(long) GetTimeSpanFromEarly:(NSString*) earlyDate;
//获得时间差
+(long) GetTimeSpan:(NSString*)earlyDate LaterDate:(NSString*)ldate;
//根据较早的一个时间和一个时间差得到特定的时间
+(NSString*) GetTimeFromSpanAndEarly:(long)lSpan EarlyDate:(NSString*)earlyDate;

@end
