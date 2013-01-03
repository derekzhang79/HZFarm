//
//  DAHenHouseMapService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAHenHouseMapEntity.h"
//鸡舍地图服务 
@interface DAHenHouseMapService : NSObject
{
    NSMutableDictionary * HenHouseDic;
}
+(DAHenHouseMapService *) shareHenHouseMapService;
-(DAHenHouseMapEntity *) GetHenHouseMap:(NSString *) henHouseID;

-(void)privInit;
@property(nonatomic,retain)  NSMutableDictionary * HenHouseDic;
@end
