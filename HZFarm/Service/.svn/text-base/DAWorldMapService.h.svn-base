//
//  DAWorldMapService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"
#import "DAWorldMapEntity.h"

@interface DAWorldMapService : NSObject
{
    DAWorldMapEntity *worldMap;
}

+(DAWorldMapService *) shareWorldMapService;
-(void) RefreshWorldMap;
-(id) getBuildingByID:(NSString*)bID;
-(id) getBuildingByPosX:(int) nx PosY:(int) ny;
//不影响数据库操作，属于数据库的缓存
-(void) AddBuildingByBID:(NSString *) bID ItemName:(NSString *)iName ItemType:(DABuildingType)iType posX:(int)nx posY:(int)ny BuildTime:(NSString*) bTime Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans ;
-(void) DeleteBuildingByBID:(NSString*)bID;
//主要是为了获得 世界中 所有的鸡舍ID或所有的加工厂ID
-(NSArray*) GetAllBuildingIDByType:(DABuildingType) buildingType;
@property(nonatomic,retain) DAWorldMapEntity * worldMap;
@end
