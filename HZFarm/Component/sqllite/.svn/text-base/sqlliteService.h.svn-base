//
//  sqlliteService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "/usr/include/sqlite3.h"
//#import "DAPlayerEntity.h"
#import "DAItemTypeDefine.h"

@interface sqlliteService : NSObject
{
    
    sqlite3 * farmDB;
}
#pragma mark 单例
+(sqlliteService*) sharSqlliteservice;

#pragma mark 数据库操作
-(BOOL) isDBOK;
-(BOOL) openDB;
-(BOOL) closeDB;

-(BOOL) createDB;
//游戏动态数据表
-(BOOL) createGameTable;
////创建所有item表(静态)
//-(BOOL)CreateAllItemTable;
////初始化物品表数据
//-(BOOL)InitAllItemData;
-(BOOL)createAndInitAllItemData;


#pragma mark 玩家表操作
-(BOOL) AddPlayerByName:(NSString*)playerName ID:(NSString*)uID RegTime:(NSString*)regTime Exp:(int) nexp Level:(int)nlevel LastLeave:(NSString*)leave Money:(int)nMoney Diamond:(int)nDia;
-(BOOL) DeletePlayerByName:(NSString*)playerName;
-(BOOL) HavePlayerByName:(NSString*)playername;
//playerName 为nil 则选择所有用户
-(NSData*) SelectUserByName:(NSString*)playerName;
//修改用户表接口 如果参数中 int 数值<0 表示不修改该项,如果对象数值为nil 表示不修改该项目
-(BOOL) UpdatePlayerSetLevel:(int) nlevel Experience:(int) nexp Lastleavetime:(NSString *) lTime Money:(int)nM Diamond:(int) nDia WithUID:(NSString*) uId;

#pragma mark 世界地图表操作
//增加建筑
-(BOOL) AddBuildingByPlayerID:(NSString*) playerID BuildingID:(NSString*) bID ItemType:(NSString*)itype ItemSysName:(NSString*)iName PosX:(int)nx PosY:(int) ny BuildTime:(NSString *) ntim Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans;
//删除建筑
-(BOOL) DeleteBuildingByBuildingID:(NSString*) bID;
//修改建筑位置
-(BOOL) UpdateBuildingPosX:(int) nx PosY:(int) ny withID:(NSString *) bID;
//查询所有建筑
-(NSData*) SelectAllBuildingFromWorld:(NSString*)uID;
//按等级查询建筑
//-(NSData*) SelectBuildingFromWorldByUID:(NSString*)uID MaxLevel:(int)nLevel BuildingType:(NSString*)itemType;


#pragma mark 仓库数据操作
//获得仓库中所有物品
-(NSData*) SelectAllItemInWareHouse:(NSString*)uID;
//向仓库中添加物品
-(BOOL) AddToWareHouseByItemName:(NSString*) iName ItemType:(NSString*)itype PlayerID:(NSString*) pID itemNum:(int) iNum;
//减少仓库中物品
-(BOOL) SubFromWareHouseByItemName:(NSString*) iName PlayerID:(NSString *) pID;
-(int)HaveItemInWareHouse:(NSString* )iName PlayerID:(NSString *)pID;
-(BOOL)UpdateItemInWareHouse:(NSString*)iName  PlayerID:(NSString*)pID itemNum:(int)iNum;

#pragma mark  加工厂中物品数据表操作
//获得加工厂中的数据
-(NSData*)SelectAllItemFromPFactoryByID:(NSString*) factoryID;
//向加工厂加入数据
-(BOOL) AddItemToFactory:(NSString*)tID: (NSString*) factoryID ItemName:(NSString*)iName itemNum:(int)iNum StartTime:(NSString *) sTime;
//减少加工厂数据
-(BOOL) SubItemFromFactory:(NSString*)tID;
//情况加工厂数据 factoryID 为nil，则清空整个表
-(BOOL) ClearPfactory:(NSString*)factoryID;

#pragma mark 鸡舍中物品表操作
//获得鸡舍中的物品
-(NSData*)SelectAllItemFromHenHouse:(NSString*)henHouseID;
//通过tID获得唯一物品
-(NSData*)SelectItemFromHenHouse:(NSString*)tID;
//向鸡舍中加入物品
-(BOOL)AddItemToHenHouse:(NSString*)tID :(NSString*)henHouseID ItemName:(NSString*)iName JoinTime:(NSString *) stime;
//减少鸡舍中的物品
-(BOOL)SutItemFromHenHouse:(NSString*)tID;
//修改鸡舍物品数据
-(BOOL)UPdateItemInHenHouse:(NSString*)tID HenHouseID:(NSString*)henHouseID ItemName:(NSString*)iName LastWater:(NSString *)wTime LastFood:(NSString *)ftime ActiveTime:(int)nTime LayEggs:(int)iNum LastLayTime:(NSString*) lget;


#pragma mark 鸡舍中地图信息数据表操纵
//获得鸡舍地图信息
-(NSData*)SelectAllBuildingFromHenHouse:(NSString*)henHouseID;
//向鸡舍中加入建筑
-(BOOL)addBuildingToHenHouse:(NSString *)tID ItemName:(NSString *)iName PosX:(int)ix PosY:(int)iy;
//减少鸡舍中建筑
-(BOOL) SubBuildingFromHenHouse:(NSString*)tID;

#pragma mark 鸡舍状态数据操作
//获得鸡舍状态
-(NSData*) SelectHenHouseState:(NSString*)henHouseID;
//向鸡舍中添加或减少水分
-(BOOL) UpdateHenHouse:(NSString*)henHouseID Water:(int) nWater Food:(int)nFood;


#pragma mark 鸡舍与加工厂关联数据操作
//获得与鸡舍关联的加工厂
-(NSData*)SelectAllFactoryFromHenHouse:(NSString*)henHouseID;
//添加鸡舍相关联的加工厂
-(BOOL)AddFactoryToHenHouse:(NSString*) tID HenHouseID:(NSString*)henHouseID FactoryID:(NSString*)fID FactoryLevel:(int)nlevel;
//减少鸡舍相关联的加工厂
-(BOOL)SubFactoryFromHenHouse:(NSString*)tID;

#pragma mark 魔法建筑对周围建筑影响关系数据操作
//获得某建筑受影响的魔法建筑
-(NSData*) SelectMagicRelationFromBuidID:(NSString*)BuildingID;
//添加建筑受影响的魔法建筑
-(BOOL) AddMagicBuilding:(NSString *)magicID BuildingID:(NSString*)bID TableID:(NSString*)tID;
//减少魔法建筑
-(BOOL) SubMagicBuildingByTableID:(NSString*)tID;


#pragma mark －－－－－－－－－－－－－－－－－item 数据库操作（静态表） 职能查询 清空 导入－－－－－－－－－－－－－－－－－－


#pragma mark 查询接口
//从加工产品数据表中获得物品信息
-(NSData*)SelItemDataFromProduct:(NSString*)itmeName;
//从道具数据表中获得物品详细信息
-(NSData*)SelItemDataFromProp:(NSString*)itemName;
//从运输工具数据表中获得物品详细信息
-(NSData*)SelItemDataFromVicle:(NSString*)itemName;
//从家禽类中获得物品详细信息
-(NSData*)SelItemDataFromPourltry:(NSString*)itemName;
//获得加工厂可转换物品
-(NSData*)SelItemsCanProduct;
//从建筑类中获得物品详细信息
-(NSData*)SelItemDataFromBuilding:(NSString*)itemName;
//根据级别查询建筑
-(NSData*)SelBuildingByItemType:(NSString*)btype MaxLevel:(int)nMaxLevel;
//获得商店中物品信息
-(NSData*)SelShopData;
//获得玩家初始信息
-(NSData*)SelItemDataFromMoney:(NSString*)itemName;



#pragma mark DEBUG interface 
-(void)PrintTableAttribute:(NSArray*)attrs  tableName:(NSString*)tablename;

@end






























