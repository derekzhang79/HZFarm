//
//  DAMagicForHenHouseEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAMagicForHenHouseEntity : NSObject
{
    NSString  * kFeedItems;//增加的饲养种类 
    int         kWater;
    int         kFood;
}
@property(nonatomic,retain) NSString* kFeedItems;
@property       int kWater;
@property       int kFood;
@end
