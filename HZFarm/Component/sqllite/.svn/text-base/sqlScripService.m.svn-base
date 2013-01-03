//
//  sqlScripService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "sqlScripService.h"
#import "DateTool.h"

@implementation sqlScripService

static sqlScripService* shareSqlScripService_;
+(sqlScripService*) shareSqlScripService
{
    if (nil==shareSqlScripService_) {
        shareSqlScripService_=[[self alloc]init];
    }
    return shareSqlScripService_;
}
+(id)alloc
{
    NSAssert(shareSqlScripService_ == nil, 
             @"Attempted to allocate a second instance of a shareSqlScripService_ singleton.");
	return [super alloc];
}
//+(NSString*)getCreateDBSqlScript
//{
//   
//}
#pragma mark 建表脚本
+(NSArray *)CreateGameTableScript
{
    
    NSString* nStrUsers = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS users (uID TEXT PRIMARY KEY, uName TEXT, regTime TEXT, exp INTEGER , level INTEGER, lastleave TEXT , money INTEGER , diamond INTEGER)"];
    NSString* nStrWorldMap = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS worldmap (uID TEXT, bID TEXT PRIMARY KEY, bType TEXT, itemName TEXT ,posx INTEGER,posy INTEGER,bTime TEXT,tag INTEGER,zindex INTEGER,btrans INTEGER)"];
    NSString* nStrWare = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS ware (uID TEXT,itemType TEXT,itemName TEXT,itemNum INTEGER) "];
    NSString* nStrFactory = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS factory (tID TEXT PRIMARY KEY,bID TEXT,itemName TEXT,bTIme TEXT,itemNum INTEGER)"];
    NSString* nStrHenHouseData = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS henhousedata (tID TEXT PRIMARY KEY,bID TEXT,itemName TEXT,bTime TEXT,lwater TEXT,lfood TEXT,lget TEXT,active INTEGER,layeggs INTEGER)"];
    NSString* nStrHenHouseMap  = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS henhousemap (bID TEXT PRIMARY KEY,itemName TEXT,posx INTEGER,posy INTEGER)"];
    NSString* nStrHenHouseState = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS henhousestate (bID TEXT PRIMARY KEY,water INTEGER,food INTEGER)"];
    NSString* nStrRelFactory = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS relfactory (tID TEXT PRIMARY KEY,bID TEXT,fID TEXT,flevel INTEGER)"];
    NSString* nStrRelMagic = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS relmagic (tID TEXT PRIMARY KEY,bID TEXT,mID TEXT)"];
    return [NSArray arrayWithObjects:nStrUsers,nStrWorldMap,nStrWare,nStrFactory,nStrHenHouseData,nStrHenHouseMap,nStrHenHouseState,nStrRelFactory,nStrRelMagic,nil];
}
#pragma mark users表
+(NSString *)InsertPlayerByNameScript:(NSString*)playerName ID:(NSString*)uID RegTime:(NSString*)regTime Exp:(int) nexp Level:(int)nlevel LastLeave:(NSString*)leave Money:(int)nMoney Diamond:(int)nDia;
{
//    time_t curTime;
//    time(&curTime);
    //NSString *strNow=[DateTool Now];
    NSString* addUserByName = [NSString stringWithFormat:@"INSERT INTO users(uID,uName,regTime,exp,level,lastleave,money,diamond) VALUES(\"%@\",\"%@\", \"%@\",\"%i\",\"%i\",\"%@\",\"%i\", \"%i\")",uID, playerName,regTime,nexp,nlevel,leave,nMoney,nDia];
    return addUserByName;
}
+(NSString*) deletePlayerByNameScrip:(NSString*) playerName
{
    //NSString *delUser=[NSString stringWithFormat:@"DELETE FROM users where uID =\"%@\" ",playerName];
   // NSString *delUsr=[NSString stringWithFormat:@"DELETE FROM users where uID =\"%@\" ",playerName];
    return [NSString stringWithFormat:@"DELETE FROM users where uID = \"%@\" ",playerName];
}
+(NSString*)SelectPlayerByNameScript:(NSString*)playerName
{
    NSString * selPlayerbyname =nil;// [NSString stringWithFormat:@"SELECT * from users where uName=\"%@\"",playerName];
    if (playerName) {
        selPlayerbyname = [NSString stringWithFormat:@"SELECT * from users where uName=\"%@\"",playerName];
    }
    else
    {
        selPlayerbyname = [NSString stringWithFormat:@"SELECT * from users"];
    }
    return selPlayerbyname;
}
+(NSString*)UpdatePlayerWithUIDScript:(NSString *)uId
{
    return [NSString stringWithFormat:@"UPDATE users Set ,exp = ,level = ,lastleave = ,money = ,diamond = , where uID =\"%@\"",uId];
}
#pragma mark worldmap表
+(NSString *)InsertBuildingByPlayerIDScript:(NSString *)playerID BuildingID:(NSString *)bID ItemType:(NSString*)itype ItemSysName:(NSString *)iName PosX:(int)nx PosY:(int)ny BuildTime:(NSString*)ntim Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans
{
    NSString *script=[NSString stringWithFormat:@"INSERT INTO worldmap (uID,bID,bType,itemName,posx,posy,bTime,tag,zindex,btrans) VALUES(\"%@\",\"%@\",\"%@\",\"%@\",%i,%i,\"%@\",%i,%i,%i)",playerID,bID,itype,iName,nx,ny,ntim,tag,z,btans];
    return script;
}
+(NSString*)DeleteBuildingByBuildingIDScript:(NSString *)buildingID
{
    return [NSString stringWithFormat:@"DELETE FROM worldmap where bID=\"%@\"",buildingID];
}
+(NSString*)UpdateBuildingPosScript:(NSString *)buildingID
{
    return [NSString stringWithFormat:@"UPDATE worldmap Set, posx=,posy=, where bID=\"%@\"",buildingID];
}
+(NSString*)SelectAllBuildingInWorldMapByuIDScript:(NSString *)uID
{
    return [NSString stringWithFormat:@"SELECT * FROM  worldmap where uID=\"%@\"",uID];
}
+(NSString*)SelectBuildingInWorldMapByuIDScript:(NSString *)uID MaxLevel:(int)nLevel BuildingType:(NSString*)itemType
{
    return [NSString stringWithFormat:@"SELECT * FROM  worldmap where uID=\"%@\" btype=\"%@\" blevel<=%i ",uID,itemType,nLevel];
}
#pragma mark ware表
+(NSString*)SelectAllItemInWareScriptByuID:(NSString *)uID
{
    return [NSString stringWithFormat:@"SELECT * FROM  ware where uID=\"%@\"",uID];
}
+(NSString*)InsertToWareHouseByItemNameScript:(NSString *)iName ItemType:(NSString*)itype PlayerID:(NSString *)pID itemNum:(int)iNum
{
    return [NSString stringWithFormat:@"INSERT INTO ware (uID,itemType,itemName,itemNum) VALUES (\"%@\",\"%@\",\"%@\",%i)",pID,itype,iName,iNum];
}
+(NSString*)DeleteWareHouseItemByNameScript:(NSString *)iName PlayId:(NSString *)pID
{
    return [NSString stringWithFormat:@"DELETE FROM ware where itemName = \"%@\" and uID=\"%@\"",iName,pID];
}
+(NSString *)SelectItemInWareScriptWithPlayID:(NSString *)pID ItemName:(NSString*)iName
{
    return [NSString stringWithFormat:@"SELECT itemNum FROM ware where uID=\"%@\" and itemName=\"%@\"",pID,iName];
}
+(NSString *)UpdateItemInWareWithTypeScript:(NSString*)iName PlayerID:(NSString *)pID ItemNum:(int)iNum
{
    return [NSString stringWithFormat:@"UPDATE ware Set itemNum=%i where uID = \"%@\" and itemName=\"%@\"",iNum,pID,iName];
}
#pragma mark factory表
+(NSString*)SelectAllItemInFactoryByIdScript:(NSString *)fID
{
    return [NSString stringWithFormat:@"SELECT * FROM factory where bID=\"%@\"",fID];
}
+(NSString *)InsertItemToFactoryScript:(NSString *)tID :(NSString *)factoryID ItemName:(NSString *)iName itemNum:(int)iNum StartTime:(NSString*)sTime
{
    return [NSString stringWithFormat:@"INSERT INTO factory (tID,bID,itemName,bTime,itemNum) VALUES (\"%@\",\"%@\",\"%@\",\"%@\",%i)",tID,factoryID,iName,sTime,iNum];
}
+(NSString *)DeleteFactoryItemWithtIDScript:(NSString *)tID
{
    return [NSString stringWithFormat:@"DELETE FROM factory where tID = \"%@\"",tID];
}
+(NSString *)DeleteFactoryItemWithFactroyIDScript:(NSString *)fID
{
    if(nil==fID)
    {
        return [NSString stringWithFormat:@"DELETE FROM factory"];
    }else
        
    {
        return [NSString stringWithFormat:@"DELETE FROM factory where bID=\"%@\"",fID];
    }
}
#pragma mark henhousedata表
+(NSString *)SelectAllItemFromHenHousedataScript:(NSString *)henHouseID
{
   // tID TEXT PRIMARY KEY,bID TEXT,itemName TEXT,bTime TEXT,lwater TEXT,lfood TEXT,lget TEXT,active INTEGER
    return [NSString stringWithFormat:@"SELECT * FROM henhousedata where bID = \"%@\"",henHouseID];
}
+(NSString*) SelectItemScriptFromHenHouse:(NSString*)tID
{
    return [NSString stringWithFormat:@"SELECT * FROM henhousedata where tID = \"%@\"",tID];
}
+(NSString *)InsertItemToHenHouseScript:(NSString *)tID :(NSString *)henHouseID ItemName:(NSString *)iName  JoinTime:(NSString *)stime
{
    return [NSString stringWithFormat:@"INSERT INTO henhousedata (tID,bID,itemName,bTime) VALUES (\"%@\",\"%@\",\"%@\",\"%@\")",tID,henHouseID,iName,stime];
}
+(NSString *)DeleteHenHouseItemWithtIDScript:(NSString *)tID
{
    return [NSString stringWithFormat:@"DELETE FROM henhousedata where tID=\"%@\"",tID];
}
+(NSString *)UPdateItemInHenHouseScript:(NSString *)tID 
{
    return [NSString stringWithFormat:@"UPDATE henhousedata Set ,bID=,itemName=,lwater=,lfood=,active=,layeggs=,lget=, where tID=\"%@\"",tID];
}
#pragma mark henhousemap表
//henhousemap (bID TEXT PRIMARY KEY,itemName TEXT,posx INTEGER,posy INTEGER)
+(NSString *)SelectAllBuildingInHenHouseScript:(NSString *)HenHouseID
{
    return [NSString stringWithFormat:@"SELECT * FROM henhousemap where bID=\"%@\"",HenHouseID]; 
}
+(NSString *)InsertBuildingToHenHouseScript:(NSString *)tID ItemName:(NSString *)iName  PosX:(int)ix PosY:(int)iy
{
    return [NSString stringWithFormat:@"INSERT INTO henhousemap (tID,itemName,posx,posy) VALUES (\"%@\",\"%@\",%i,%i)",tID,iName,ix,iy];
}
+(NSString *)DeleteHenhouseBuildingBytIDScript:(NSString *)tID
{
    return [NSString stringWithFormat:@"DELETE FROM henhousemap where tID=\"%@\"",tID];
}
#pragma mark henhousestate表
//henhousestate (bID TEXT PRIMARY KEY,water INTEGER,food INTEGER)
+(NSString *)SelectHenHouseStateScript:(NSString *)henHouseID
{
    return [NSString stringWithFormat:@"SELECT * FROM henhousestate where bID=\"%@\"",henHouseID];
}
+(NSString*)UpdateHenHouseScript:(NSString *)henHouseID
{
    return [NSString stringWithFormat:@"UPDATE henhousestate Set, water=,food=, where bID=\"%@\"",henHouseID];
}
+(NSString *)InsertStateToHenHouseStateScript:(NSString *)henHouseID Water:(int)nWater Food:(int)nFood
{
    return [NSString stringWithFormat:@"INSERT INTO henhousestate (bID,water,food) VALUES (\"%@\",%i,%i)",henHouseID,nWater,nFood];
}
#pragma mark relfactry表操作
//relfactory (tID TEXT PRIMARY KEY,bID TEXT,fID TEXT,flevel INTEGER)
+(NSString *)InsertFactoryToHenHouseScript:(NSString *)tID HenHouseID:(NSString *)henHouseID FactoryID:(NSString *)fID FactoryLevel:(int)nlevel
{
    return [NSString stringWithFormat:@"INSERT INTO relfactory (tID,bID,fID,flevel) VALUES (\"%@\",\"%@\",\"%@\",%i)",tID,henHouseID,fID,nlevel];
}
+(NSString *)SelectAllFactoryFromHenHouseScript:(NSString *)henHouseID
{
    return [NSString stringWithFormat:@"SELECT * FROM relfactory where bID=\"%@\"",henHouseID];
}
+(NSString*)DeleteFactoryFromHenHouseScript:(NSString *)tID
{
    return [NSString stringWithFormat:@"DELETE FROM relfactory where tID=\"%@\"",tID];
}
#pragma mark relmagic表操作
//relmagic (tID TEXT PRIMARY KEY,bID TEXT,mID TEXT)
+(NSString*)SelectMagicRelationFromBuidIDScript:(NSString *)BuildingID
{
    return [NSString stringWithFormat:@"SELECT * FROM relmagic where bID=\"%@\"",BuildingID];
}
+(NSString*)InsertMagicBuildingScript:(NSString *)magicID BuildingID:(NSString *)bID TableID:(NSString *)tID
{
    return [NSString stringWithFormat:@"INSERT INTO relmagic (tID,bID,mID) VALUES (\"%@\",\"%@\",\"%@\")",tID,bID,magicID];
}
+(NSString*)DeleteMagicBuildingByTableIDScript:(NSString *)tID
{
   return [NSString stringWithFormat:@"DELETE FROM relmagic where tID=\"%@\"",tID]; 
}
#pragma mark 静态表查询
+(NSString*)SelItemDataFromProductScript:(NSString*)itmeName
{
    return [NSString stringWithFormat:@"SELECT * FROM itemproduct where sysName = \"%@\"",itmeName];
}
+(NSString*)SelItemDataFromPropScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM itemprop where sysName = \"%@\"",itemName];
}
+(NSString*)SelItemDataFromVicleScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM itemvehicle where sysName = \"%@\"",itemName];
}
+(NSString*)SelItemDataFromPourltryScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM itempaultry where sysName = \"%@\"",itemName];
}
+(NSString*)SelItemsCanProductScript
{
    return [NSString stringWithFormat:@"SELECT * FROM itemfactorytrans"];
}
+(NSString*)SelItemDataFromBuildingScript:(NSString*)itemName
{
     return [NSString stringWithFormat:@"SELECT * FROM itembuild where sysName=\"%@\"",itemName];
}
+(NSString*)SelItemFromBuildingScript:(NSString*)btype MaxLevel:(int)nMaxLevel
{
    return [NSString stringWithFormat:@"SELECT * FROM itembuild where btype=\"%@\" and blevel<=%i",btype,nMaxLevel];
}
+(NSString*)SelItemDataFromSitemBreedScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM sitembreed where sysName=\"%@\"",itemName];
}
+(NSString*)SelItemDataFromSitemProductScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM sitemproduct where sysName=\"%@\"",itemName];
}
+(NSString*)SelItemDataFromSitemMagicScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM sitemmagic where sysName=\"%@\"",itemName];
}
+(NSString*)SelShopDataScript
{
    return [NSString stringWithFormat:@"SELECT * FROM itemshop "];
}
+(NSString*)SelMoneyDataScript:(NSString*)itemName
{
    return [NSString stringWithFormat:@"SELECT * FROM itemMoney where sysName=\"%@\"",itemName];
}
@end
