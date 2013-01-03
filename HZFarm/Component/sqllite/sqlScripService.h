//
//  sqlScripService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sqlScripService : NSObject

+(sqlScripService*) shareSqlScripService;
#pragma mark 建库
//+(NSArray *) CreateItemTableScript;
+(NSArray *) CreateGameTableScript;
#pragma mark users表
+(NSString*) InsertPlayerByNameScript:(NSString*)playerName ID:(NSString*)uID RegTime:(NSString*)regTime Exp:(int) nexp Level:(int)nlevel LastLeave:(NSString*)leave Money:(int)nMoney Diamond:(int)nDia;
+(NSString*)SelectPlayerByNameScript:(NSString*)playerName;
+(NSString*) SelectPlayerByNameScript:(NSString*)nStrPlayerName;
+(NSString*) UpdatePlayerWithUIDScript:(NSString*)uId;
+(NSString*) deletePlayerByNameScrip:(NSString*) playerName;
#pragma mark worldmap表
+(NSString*) InsertBuildingByPlayerIDScript:(NSString*) playerID BuildingID:(NSString*) bID ItemType:(NSString*)itype ItemSysName:(NSString*)iName PosX:(int)nx PosY:(int)ny BuildTime:(NSString *) ntim Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans;
+(NSString*) DeleteBuildingByBuildingIDScript:(NSString *)buildingID;
+(NSString*) UpdateBuildingPosScript:(NSString*)buildingID;
+(NSString*) SelectAllBuildingInWorldMapByuIDScript:(NSString*)uID;
+(NSString*)SelectBuildingInWorldMapByuIDScript:(NSString *)uID MaxLevel:(int)nLevel BuildingType:(NSString*)itemType;
#pragma mark ware表
+(NSString*) SelectAllItemInWareScriptByuID:(NSString*)uID;
+(NSString*) InsertToWareHouseByItemNameScript:(NSString *)iName ItemType:(NSString*)itype PlayerID:(NSString *)pID itemNum:(int)iNum;
+(NSString*) DeleteWareHouseItemByNameScript:(NSString *)iName PlayId:(NSString*)pID;
+(NSString*) SelectItemInWareScriptWithPlayID:(NSString*)pID ItemName:(NSString*)iName;
+(NSString*) UpdateItemInWareWithTypeScript:(NSString*)iName PlayerID:(NSString*)pID ItemNum:(int)iNum;
#pragma mark factory表
+(NSString*) SelectAllItemInFactoryByIdScript:(NSString*)fID;
+(NSString*) InsertItemToFactoryScript:(NSString *)tID :(NSString *)factoryID ItemName:(NSString *)iName itemNum:(int)iNum StartTime:(NSString *)sTime;
+(NSString*) DeleteFactoryItemWithtIDScript:(NSString*)tID;
+(NSString*) DeleteFactoryItemWithFactroyIDScript:(NSString*)fID;
#pragma mark henhousedata表
+(NSString*) SelectAllItemFromHenHousedataScript:(NSString*)henHouseID;
+(NSString*) SelectItemScriptFromHenHouse:(NSString*)tID;
+(NSString*) InsertItemToHenHouseScript:(NSString *)tID :(NSString *)henHouseID ItemName:(NSString *)iName  JoinTime:(NSString *)stime;
+(NSString*) DeleteHenHouseItemWithtIDScript:(NSString*)tID;
+(NSString*) UPdateItemInHenHouseScript:(NSString *)tID ;
#pragma mark henhousemap表
+(NSString*) SelectAllBuildingInHenHouseScript:(NSString*)HenHouseID;
+(NSString*) InsertBuildingToHenHouseScript:(NSString *)tID ItemName:(NSString *)iName PosX:(int)ix PosY:(int)iy;
+(NSString*) DeleteHenhouseBuildingBytIDScript:(NSString*)tID;
#pragma mark henhousestate表
+(NSString*) SelectHenHouseStateScript:(NSString*)henHouseID;
+(NSString*) UpdateHenHouseScript:(NSString *)henHouseID;
+(NSString*) InsertStateToHenHouseStateScript:(NSString*)henHouseID Water:(int)nWater Food:(int)nFood;
#pragma mark relfactory表
+(NSString*) SelectAllFactoryFromHenHouseScript:(NSString*)henHouseID;
+(NSString*) InsertFactoryToHenHouseScript:(NSString*)tID HenHouseID:(NSString*)henHouseID FactoryID:(NSString*)fID FactoryLevel:(int)nlevel;
+(NSString*) DeleteFactoryFromHenHouseScript:(NSString*)tID;
#pragma mark relmagic表
+(NSString*) SelectMagicRelationFromBuidIDScript:(NSString*)BuildingID;
+(NSString*) InsertMagicBuildingScript:(NSString *)magicID BuildingID:(NSString*)bID TableID:(NSString*)tID;
+(NSString*) DeleteMagicBuildingByTableIDScript:(NSString*)tID;
#pragma mark 静态表查询
+(NSString*)SelItemDataFromProductScript:(NSString*)itmeName;
+(NSString*)SelItemDataFromPropScript:(NSString*)itemName;
+(NSString*)SelItemDataFromVicleScript:(NSString*)itemName;
+(NSString*)SelItemDataFromPourltryScript:(NSString*)itemName;
+(NSString*)SelItemsCanProductScript;
+(NSString*)SelItemDataFromBuildingScript:(NSString*)itemName;
+(NSString*)SelItemFromBuildingScript:(NSString*)btype MaxLevel:(int)nMaxLevel;
+(NSString*)SelShopDataScript;
+(NSString*)SelMoneyDataScript:(NSString*)itemName;
+(NSString*)SelItemDataFromSitemBreedScript:(NSString*)itemName;
+(NSString*)SelItemDataFromSitemProductScript:(NSString*)itemName;
+(NSString*)SelItemDataFromSitemMagicScript:(NSString*)itemName;
@end
