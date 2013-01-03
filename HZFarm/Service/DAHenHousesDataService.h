//
//  DAHenHousesDataService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAHenHouseDataEntity.h"
#import "DAItemTypeDefine.h"
#import "DAFactoryInHenHouse.h"
@interface DAHenHousesDataService : NSObject
{
    NSMutableDictionary * HenHouseDataDic;
}
+(DAHenHousesDataService*) shareHenHouseDataService;
-(DAHenHouseDataEntity *) getHenHouseData:(NSString*) henHouseID;
-(void)RefreshAllHenHouseData;
-(void)OnAddItemToHenHouse:(DAItemInHenHouse *)item;
-(void)SubItemFromHenHouse:(NSString*)henHouseID TableID:(NSString*)itemTID;
-(NSArray*)GetRestFoodAndWaterFromDB:(NSString*)henHouseID;
-(DAItemInHenHouse*)GetItemFromHenHouse:(NSString*)henHouseID TableID:(NSString*)tid;
-(void) privateInit;
#pragma mark 鸡舍与加工厂关系
//根据鸡舍id获得相关联的加工厂id
-(DAFactoryInHenHouse*) getFactoryInHenHouse:(NSString*)henHouseID;
#pragma mark 鸡舍与魔法建筑相关联接口
//根据鸡舍id获得所有与之关联的魔法类建筑
-(NSArray*)  getMagicItemsFromHenHouseID:(NSString*)henHouseID;
//-(void) StartHenHouseTask;//开启鸡舍任务  鸡舍状态发生改变，则通知世界
//-(void) StopHenHouseTask;//关闭鸡舍任务
@property(nonatomic,retain)NSMutableDictionary * HenHouseDataDic;
@end
