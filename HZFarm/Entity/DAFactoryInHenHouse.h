//
//  DAFactoryInHenHouse.h
//  MapTest
//
//  Created by liwensheng on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAFactoryInHenHouse : NSObject
{
    NSString* tID;
    NSString *factoryID;
    NSString *henHouseID;
    int nProductLevel;
}
@property(nonatomic,retain) NSString* tID;
@property(nonatomic,retain) NSString *factoryID;
@property(nonatomic,retain) NSString *henHouseID;
@property int nProductLevel;
@end
