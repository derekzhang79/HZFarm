//
//  DAItemInFactory.h
//  MapTest
//
//  Created by liwensheng on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAItemInFactory : NSObject
{
    NSString *tID;//唯一纪录
    NSString *sysName;
    NSString* startTime;
    NSString *factoryID;//加工厂ID
    int   needTime;//加工需要时间
    int  iNum;//同一时间加工品数量
}
@property(nonatomic,retain) NSString *sysName;
@property(nonatomic,retain) NSString* startTime;
@property(nonatomic,retain) NSString *factoryID;//加工厂ID
@property(nonatomic,retain) NSString *tID;
@property int   needTime;//加工需要时间
@property int   iNum;

-(int) getActiveTime;//获得有效加工时间

@end
