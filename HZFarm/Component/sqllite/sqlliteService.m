//
//  sqlliteService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "sqlliteService.h"
#import"sqlScripService.h"
#import "DACatchFileService.h"
#import "SqlUtil.h"
#import "DDXML.h"
@interface sqlliteService (Privete)
-(void)clearDBPtr;
-(BOOL)checkDB;
-(BOOL)initItemTable:(NSString *)fileName;
-(int) HaveItemInWareHouse:(NSString*)iName  PlayerID:(NSString*) pID;
-(BOOL)GetAdditionnalBuildInfn:(const char*)btype :(NSString*)sysName toArray:(NSMutableArray *)attrs;
-(BOOL)HaveHenHouseInHenHouseState:(NSString*)henHouseID;
-(BOOL)AddHenHouse:(NSString *)henHouseID Water:(int)nWater Food:(int)nFood;
@end






@implementation sqlliteService

static sqlliteService* sharSqlliteservice_;
#pragma mark Privete
-(void)clearDBPtr
{
    farmDB = NULL;
}
-(BOOL)checkDB
{
    if (NULL==farmDB)
    {
        return [self openDB];
    }
    else
        return YES;
}
-(BOOL)initItemTable:(NSString *)fileName
{
    [self checkDB];
    NSString * filePath = nil;
    NSString * xmlString = nil;
    filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    xmlString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    DDXMLDocument * xmlDoc = [[DDXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    SafeRelease(xmlString);
    NSArray * sqlScripts =[xmlDoc nodesForXPath:X_PATH error:nil];
    char * errMsg = NULL;
    for (DDXMLElement * scriptNode in sqlScripts) 
    {
        NSString * sqlScript = [scriptNode stringValue];
        if(SQLITE_OK!=sqlite3_exec(farmDB, [sqlScript UTF8String], NULL, NULL, &errMsg))
        {
            DEBUGPrint("%s\n",errMsg);
            SafeFree(errMsg);
            SafeRelease(xmlDoc);
            return NO;
        }
    }
    SafeRelease(xmlDoc);
    return YES;
}
#pragma mark 单例
+(sqlliteService*) sharSqlliteservice
{
    if (nil==sharSqlliteservice_) {
        sharSqlliteservice_=[[self alloc] init];
    }
    return sharSqlliteservice_;
}
+(id)alloc
{
	NSAssert(sharSqlliteservice_ == nil, @"Attempted to allocate a second instance of a sqlliteService singleton.");
	return [super alloc];
}
#pragma mark 数据库操作
-(BOOL) isDBOK
{
    NSString *dbPath=[DACatchFileService getFarmDBDir];
    if ([DACatchFileService FileExit:dbPath] ) {
        return YES;
    }
    return NO;
}
-(BOOL) openDB
{
    NSString * dbPath = [DACatchFileService getFarmDBDir];
    if(SQLITE_OK!= sqlite3_open([dbPath UTF8String],&farmDB ))
    {
        sqlite3_close(farmDB);
        farmDB = NULL;
        return NO;
    }
    return YES;
}
-(BOOL) closeDB
{
    BOOL result = sqlite3_close(farmDB);
    farmDB = NULL;
    return result;
}


-(BOOL) createDB
{
    if(![self openDB])
    {
        return NO;
    }else
    {
        return [self createGameTable]&[self createAndInitAllItemData];
    }
}

#pragma mark --创建游戏数据库表
-(BOOL) createGameTable
{
    [self checkDB];
    NSArray * scripts =[sqlScripService CreateGameTableScript];
    for (NSString * script in scripts) 
    {
        if(!FarmeEXECSql(farmDB, [script UTF8String]))
            return NO;
    }
    return YES;
}
-(BOOL)createAndInitAllItemData
{
    if (![self initItemTable:ITEM_BUILD]) 
    {
        DEBUGLOG(@"init itembuild table error");
        return NO;
    }
    if (![self initItemTable:ITEM_FACTORY]) 
    {
        DEBUGLOG(@"init itemfactorytrans table error");
        return NO;
    }
    if (![self initItemTable:ITEM_MONEY]) 
    {
        DEBUGLOG(@"init itemMoney table error");
        return NO;
    }
    if(![self initItemTable:ITEM_PAULTRY])
    {
        DEBUGLOG(@"init itempaultry table error");
        return NO;
    }
    if(![self initItemTable:ITEM_PRODUCT])
    {
        DEBUGLOG(@"init itemproduct table error");
        return NO;
    } 
    if(![self initItemTable:ITEM_PROP])
    {
        DEBUGLOG(@"init itemprop table error");
        return NO;
    }
    if(![self initItemTable:ITEM_SHOP])
    {
        DEBUGLOG(@"init itemshop table error");
        return NO;
    }
    if(![self initItemTable:ITEM_STATE])
    {
        DEBUGLOG(@"init itemstate table error");
        return NO;
    }
    if(![self initItemTable:ITEM_VEHICLE])
    {
        DEBUGLOG(@"init itemvehicle table error");
        return NO;
    }
    if(![self initItemTable:SITEM_BREED])
    {
        DEBUGLOG(@"init sitembreed table error");
        return NO;
    }
    if(![self initItemTable:SITEM_MAGIC])
    {
        DEBUGLOG(@"init sitemmagic table error");
        return NO;
    }
    if(![self initItemTable:SITEM_PRODUCT])
    {
        DEBUGLOG(@"init sitemproduct table error");
        return NO;
    }
       return YES;
}
#pragma mark users表操作
-(BOOL)AddPlayerByName:(NSString*)playerName ID:(NSString*)uID RegTime:(NSString*)regTime Exp:(int) nexp Level:(int)nlevel LastLeave:(NSString*)leave Money:(int)nMoney Diamond:(int)nDia;
{
    NSString * script =[sqlScripService InsertPlayerByNameScript:playerName ID:uID RegTime:regTime Exp:nexp Level:nlevel LastLeave:leave Money:nMoney Diamond:nDia];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL) DeletePlayerByName:(NSString*)playerName
{
    NSString * script=[sqlScripService deletePlayerByNameScrip:playerName];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}

-(NSData *)SelectUserByName:(NSString *)playerName
{
    sqlite3_stmt * statement = NULL;
    NSString * script = [sqlScripService SelectPlayerByNameScript:playerName];
    [self checkDB];
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:UserXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"uID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject:FarmAttrText(@"uName",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"regTime",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrInt(@"exp", sqlite3_column_int(statement,3))];
            [attrArray addObject: FarmAttrInt(@"level",  sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrText(@"lastleave",(const char *)sqlite3_column_text(statement,5))];
            [attrArray addObject:FarmAttrInt(@"money", sqlite3_column_int(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"diamond", sqlite3_column_int(statement, 7))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL)HavePlayerByName:(NSString *)playername
{
    sqlite3_stmt * statement = NULL;
    NSString * script = [sqlScripService SelectPlayerByNameScript:playername];
    [self checkDB];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String],-1,&statement,NULL ))
    {
        
        if(sqlite3_step(statement)==SQLITE_ROW)
        {
            sqlite3_finalize(statement);
            return YES;
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    return NO;
}
-(BOOL)UpdatePlayerSetLevel:(int)nlevel Experience:(int)nexp Lastleavetime:(NSString *)lTime Money:(int)nM Diamond:(int)nDia WithUID:(NSString*)uId
{
    [self checkDB];
    NSString * script = [sqlScripService UpdatePlayerWithUIDScript:uId];
    NSMutableArray * srcArray = [NSMutableArray arrayWithArray: [script componentsSeparatedByString:@","]];
    NSMutableArray * destArray = [[NSMutableArray alloc] initWithCapacity:0];
    FarmBindInt(destArray,[srcArray objectAtIndex:1], nlevel);
    FarmBindInt(destArray,[srcArray objectAtIndex:2], nexp);
    FarmBindText(destArray,[srcArray objectAtIndex:3], lTime);
    FarmBindInt(destArray,[srcArray objectAtIndex:4], nM);
    FarmBindInt(destArray,[srcArray objectAtIndex:5], nDia);
    NSMutableString * execString  =[[NSMutableString alloc] initWithString:[srcArray objectAtIndex:0]];
    [execString appendFormat:@"%@",[destArray componentsJoinedByString:@","]];
    [execString  appendString:[srcArray lastObject]];
    [destArray release];
    BOOL bsuc= FarmeEXECSql(farmDB, [execString UTF8String]);
    [execString release];
    return bsuc;
}
#pragma mark worldmap 表操作
-(BOOL)AddBuildingByPlayerID:(NSString *)playerID BuildingID:(NSString *)bID ItemType:(NSString*)itype ItemSysName:(NSString *)iName PosX:(int)nx PosY:(int)ny BuildTime:(NSString *)ntim Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans
{
    [self checkDB];
    NSString * script =[sqlScripService InsertBuildingByPlayerIDScript:playerID BuildingID:bID ItemType:itype ItemSysName:iName PosX:nx PosY:ny BuildTime:ntim Tag:tag Zindex:z BTans:1 ];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)DeleteBuildingByBuildingID:(NSString *)bID
{
    [self checkDB];
    NSString *script = [sqlScripService DeleteBuildingByBuildingIDScript:bID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)UpdateBuildingPosX:(int)nx PosY:(int)ny withID:(NSString *)bID
{
    [self checkDB];
    NSString * script = [sqlScripService UpdatePlayerWithUIDScript:bID];
    NSMutableArray * srcArray = [NSMutableArray arrayWithArray: [script componentsSeparatedByString:@","]];
    NSMutableArray * destArray = [[NSMutableArray alloc] initWithCapacity:0];
    FarmBindInt(destArray, [srcArray objectAtIndex:1], nx);
    FarmBindInt(destArray, [srcArray objectAtIndex:2], ny);
    NSMutableString * execString  =[[NSMutableString alloc] initWithString:[srcArray objectAtIndex:0]];
    [execString appendFormat:@"%@",[destArray componentsJoinedByString:@","]];
    [execString  appendString:[srcArray lastObject]];
    [destArray release];
    BOOL bsuc= FarmeEXECSql(farmDB, [execString UTF8String]);
    [execString release];
    return bsuc;
}
-(NSData*)SelectAllBuildingFromWorld:(NSString*)uID
{
    sqlite3_stmt * statement  = NULL;
    NSString * script = [sqlScripService SelectAllBuildingInWorldMapByuIDScript:uID];
    [self checkDB];
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:WorlMapXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"uID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"bType",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,3))];
            [attrArray addObject: FarmAttrInt(@"posx",  sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"posy", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrText(@"bTime", (const char*)sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"tag", sqlite3_column_int(statement, 7))];
            [attrArray addObject: FarmAttrInt(@"zindex", sqlite3_column_int(statement, 8))];
            [attrArray addObject: FarmAttrInt(@"btrans", sqlite3_column_int(statement, 9))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    //NSLog(@"%@",doc);
    SafeRelease(doc);
    return xmlData;
}
////按等级查询建筑
//-(NSData*) SelectBuildingFromWorldByUID:(NSString*)uID MaxLevel:(int)nLevel BuildingType:(NSString*)itemType
//{
//    sqlite3_stmt * statement  = NULL;
//    NSString * script = [sqlScripService SelectBuildingInWorldMapByuIDScript:uID MaxLevel:nLevel BuildingType:itemType];
//    [self checkDB];
//    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:WorlMapXmlHeader options:0 error:nil];
//    DDXMLElement * root = [doc rootElement];
//    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
//    {
//        while(sqlite3_step(statement)==SQLITE_ROW)
//        {
//            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
//            [attrArray addObject: FarmAttrText(@"uID",(const char *)sqlite3_column_text(statement,0))];
//            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,1))];
//            [attrArray addObject: FarmAttrText(@"bType",(const char *)sqlite3_column_text(statement,2))];
//            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,3))];
//            [attrArray addObject: FarmAttrInt(@"posx",  sqlite3_column_int(statement, 4))];
//            [attrArray addObject: FarmAttrInt(@"posy", sqlite3_column_int(statement, 5))];
//            [attrArray addObject: FarmAttrText(@"bTime", (const char*)sqlite3_column_text(statement, 6))];
//            [attrArray addObject: FarmAttrInt(@"tag", sqlite3_column_int(statement, 7))];
//            [attrArray addObject: FarmAttrInt(@"zindex", sqlite3_column_int(statement, 8))];
//            [attrArray addObject: FarmAttrInt(@"btrans", sqlite3_column_int(statement, 9))];
//            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
//            [root addChild:Node];
//            SafeRelease(attrArray);
//        }
//        sqlite3_finalize(statement);
//    }else
//    {
//        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
//    }
//    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
//    //NSLog(@"%@",doc);
//    SafeRelease(doc);
//    return xmlData;
//}
#pragma mark ware表操作
-(NSData *)SelectAllItemInWareHouse:(NSString*)uID
{
    sqlite3_stmt * statement = NULL;
    NSString * script = [sqlScripService SelectAllItemInWareScriptByuID:uID];
    [self checkDB];
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:WareHouseXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"uID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"itemType",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrInt(@"itemNum", sqlite3_column_int(statement, 3))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;

}
-(BOOL)AddToWareHouseByItemName:(NSString *)iName ItemType:(NSString*)itype PlayerID:(NSString *)pID itemNum:(int)iNum
{
    [self checkDB];
    int num =[self HaveItemInWareHouse:iName PlayerID:pID];
    if(-1==num)
    {
        NSString * script =[sqlScripService InsertToWareHouseByItemNameScript:iName ItemType:itype PlayerID:pID itemNum:iNum];
        return FarmeEXECSql(farmDB, [script UTF8String]);
    }
    else
    {
        return [self UpdateItemInWareHouse:iName PlayerID:pID itemNum:iNum+num];
    }
}
-(BOOL)SubFromWareHouseByItemName:(NSString *)iName PlayerID:(NSString *)pID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteWareHouseItemByNameScript:iName PlayId:pID];
    return FarmeEXECSql(farmDB, [script UTF8String]); 
}
-(int)HaveItemInWareHouse:(NSString * )iName PlayerID:(NSString *)pID
{
    [self checkDB];
    NSString * script = [sqlScripService SelectItemInWareScriptWithPlayID:pID ItemName:iName];
    sqlite3_stmt * statement  = NULL;
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String],-1,&statement,NULL ))
    {
        
        if(sqlite3_step(statement)==SQLITE_ROW)
        {
            int num = sqlite3_column_int(statement, 0);
            sqlite3_finalize(statement);
            return num;
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    return -1;
}
-(BOOL)UpdateItemInWareHouse:(NSString*)iName PlayerID:(NSString *)pID itemNum:(int)iNum
{
    [self checkDB];
    NSString * script = [sqlScripService UpdateItemInWareWithTypeScript:iName PlayerID:pID ItemNum:iNum];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
#pragma mark  factory表操作
-(NSData*)SelectAllItemFromPFactoryByID:(NSString *)factoryID
{
    sqlite3_stmt * statement  = NULL;
    NSString * script = [sqlScripService SelectAllItemInFactoryByIdScript:factoryID];
    [self checkDB];
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:FactoryXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"tID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrText(@"bTime",(const char *)sqlite3_column_text(statement,3))];
            [attrArray addObject: FarmAttrInt(@"itemNum",  sqlite3_column_int(statement, 4))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL)AddItemToFactory:(NSString *)tID :(NSString *)factoryID ItemName:(NSString *)iName itemNum:(int)iNum StartTime:(NSString *)sTime
{
    [self checkDB];
    NSString * script = [sqlScripService InsertItemToFactoryScript:tID :factoryID ItemName:iName itemNum:iNum StartTime:sTime];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)SubItemFromFactory:(NSString *)tID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteFactoryItemWithtIDScript:tID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)ClearPfactory:(NSString *)factoryID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteFactoryItemWithFactroyIDScript:factoryID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
#pragma mark henhousedata表操作
-(NSData*)SelectAllItemFromHenHouse:(NSString *)henHouseID
{
    //   // tID TEXT PRIMARY KEY,bID TEXT,itemName TEXT,bTime TEXT,lwater TEXT,lfood TEXT,lget TEXT,active INTEGER
    [self checkDB];
    NSString * script = [sqlScripService SelectAllItemFromHenHousedataScript:henHouseID];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:HenHouseDataXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"tID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrText(@"bTime",(const char *)sqlite3_column_text(statement,3))];
            
            [attrArray addObject: FarmAttrText(@"lwater",(const char *)sqlite3_column_text(statement,4))];
            [attrArray addObject: FarmAttrText(@"lfood",(const char *)sqlite3_column_text(statement,5))];
            
//            [attrArray addObject: FarmAttrInt(@"lwater",  sqlite3_column_int(statement, 4))];
//            [attrArray addObject: FarmAttrInt(@"lfood", sqlite3_column_int(statement, 5))];
            
            [attrArray addObject: FarmAttrText(@"lget", (const char *)sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"active", sqlite3_column_int(statement, 7))];
             [attrArray addObject: FarmAttrInt(@"layeggs", sqlite3_column_int(statement, 8))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
//通过tID获得唯一物品
-(NSData*)SelectItemFromHenHouse:(NSString*)tID
{
    [self checkDB];
    NSString * script = [sqlScripService SelectItemScriptFromHenHouse:tID];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:HenHouseDataXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"tID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrText(@"bTime",(const char *)sqlite3_column_text(statement,3))];
            [attrArray addObject: FarmAttrInt(@"lwater",  sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"lfood", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrText(@"lget", (const char *)sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"active", sqlite3_column_int(statement, 7))];
            [attrArray addObject: FarmAttrInt(@"layeggs", sqlite3_column_int(statement, 8))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL)AddItemToHenHouse:(NSString *)tID :(NSString *)henHouseID ItemName:(NSString *)iName  JoinTime:(NSString *)stime
{
    [self checkDB];
    NSString * script =[sqlScripService InsertItemToHenHouseScript:tID :henHouseID ItemName:iName JoinTime:stime];
    BOOL b=FarmeEXECSql(farmDB, [script UTF8String]);
    return b;
}
-(BOOL)SutItemFromHenHouse:(NSString *)tID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteHenHouseItemWithtIDScript:tID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)UPdateItemInHenHouse:(NSString *)tID HenHouseID:(NSString *)henHouseID ItemName:(NSString *)iName LastWater:(NSString *)wTime LastFood:(NSString *)ftime ActiveTime:(int)nTime LayEggs:(int)iNum LastLayTime:(NSString *)lget
{
    [self checkDB];
    NSString * script = [sqlScripService UPdateItemInHenHouseScript:tID];
    NSMutableArray * srcArray = [NSMutableArray arrayWithArray: [script componentsSeparatedByString:@","]];
    NSMutableArray * destArray = [[NSMutableArray alloc] initWithCapacity:0];
    FarmBindText(destArray,[srcArray objectAtIndex:1],henHouseID);
    FarmBindText(destArray,[srcArray objectAtIndex:2], iName);
    FarmBindText(destArray,[srcArray objectAtIndex:3], wTime);
    FarmBindText(destArray,[srcArray objectAtIndex:4],ftime);
    FarmBindInt(destArray,[srcArray objectAtIndex:5], nTime);
    FarmBindInt(destArray,[srcArray objectAtIndex:6],iNum);
    FarmBindText(destArray,[srcArray objectAtIndex:7],lget);
    NSMutableString * execString  =[[NSMutableString alloc] initWithString:[srcArray objectAtIndex:0]];
    [execString appendFormat:@"%@",[destArray componentsJoinedByString:@","]];
    [execString  appendString:[srcArray lastObject]];
    [destArray release];
    BOOL bsuc= FarmeEXECSql(farmDB, [execString UTF8String]);
    [execString release];
    return bsuc;
}
#pragma mark henhousemap表操作
-(NSData *)SelectAllBuildingFromHenHouse:(NSString *)henHouseID
{
    [self checkDB];
    NSString * script = [sqlScripService SelectAllBuildingInHenHouseScript:henHouseID];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:HenHouseDataXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"tID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrText(@"itemName",(const char *)sqlite3_column_text(statement,2))];
            [attrArray addObject: FarmAttrText(@"bTime",(const char *)sqlite3_column_text(statement,3))];
            [attrArray addObject: FarmAttrInt(@"lwater",  sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"lfood", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrText(@"lget", (const char *)sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"active", sqlite3_column_int(statement, 7))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL)addBuildingToHenHouse:(NSString *)tID ItemName:(NSString *)iName  PosX:(int)ix PosY:(int)iy
{
    [self checkDB];
    NSString * script = [sqlScripService InsertBuildingToHenHouseScript:tID ItemName:iName PosX:ix PosY:iy];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)SubBuildingFromHenHouse:(NSString *)tID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteHenhouseBuildingBytIDScript:tID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
#pragma mark henhousestate 表操作
-(BOOL)AddHenHouse:(NSString *)henHouseID Water:(int)nWater Food:(int)nFood
{
    [self checkDB];
    NSString * script = [sqlScripService InsertStateToHenHouseStateScript:henHouseID Water:nWater Food:nFood];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(NSData *)SelectHenHouseState:(NSString *)henHouseID
{
    ////henhousestate (bID TEXT PRIMARY KEY,water INTEGER,food INTEGER)
    [self checkDB];
    NSString * script = [sqlScripService SelectHenHouseStateScript:henHouseID];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:HenHouseStateXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"bID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrInt(@"water",  sqlite3_column_int(statement, 1))];
            [attrArray addObject: FarmAttrInt(@"food", sqlite3_column_int(statement, 2))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL)UpdateHenHouse:(NSString *)henHouseID Water:(int)nWater Food:(int)nFood
{
    if(![self HaveHenHouseInHenHouseState:henHouseID])
    {
       return  [self AddHenHouse:henHouseID Water:nWater Food:nFood];
    }
    [self checkDB];
    NSString * script = [sqlScripService UpdateHenHouseScript:henHouseID];
    NSMutableArray * srcArray = [NSMutableArray arrayWithArray: [script componentsSeparatedByString:@","]];
    NSMutableArray * destArray = [[NSMutableArray alloc] initWithCapacity:0];
    FarmBindInt(destArray,[srcArray objectAtIndex:1],nWater);
    FarmBindInt(destArray,[srcArray objectAtIndex:2], nFood);
    NSMutableString * execString  =[[NSMutableString alloc] initWithString:[srcArray objectAtIndex:0]];
    [execString appendFormat:@"%@",[destArray componentsJoinedByString:@","]];
    [execString  appendString:[srcArray lastObject]];
    [destArray release];
    BOOL bsuc= FarmeEXECSql(farmDB, [execString UTF8String]);
    [execString release];
    return bsuc;
}
-(BOOL)HaveHenHouseInHenHouseState:(NSString *)henHouseID
{
    sqlite3_stmt * statement = NULL;
    NSString * script = [sqlScripService SelectHenHouseStateScript:henHouseID];
    [self checkDB];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String],-1,&statement,NULL ))
    {
        
        if(sqlite3_step(statement)==SQLITE_ROW)
        {
            sqlite3_finalize(statement);
            return YES;
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    return NO;
}
#pragma mark relfactory表操作
//relfactory (tID TEXT PRIMARY KEY,bID TEXT,fID TEXT,flevel INTEGER)
-(NSData*)SelectAllFactoryFromHenHouse:(NSString*)henHouseID
{
    [self checkDB];
    NSString * script = [sqlScripService SelectAllFactoryFromHenHouseScript :henHouseID];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:RelFactoryXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"tID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID", (const char *)sqlite3_column_text(statement, 1))];
            [attrArray addObject: FarmAttrText(@"fID", (const char *)sqlite3_column_text(statement, 2))];
            [attrArray addObject: FarmAttrInt(@"flevel", sqlite3_column_int(statement, 3))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL)AddFactoryToHenHouse:(NSString*) tID HenHouseID:(NSString*)henHouseID FactoryID:(NSString*)fID FactoryLevel:(int)nlevel
{
    [self checkDB];
    NSString * script = [sqlScripService InsertFactoryToHenHouseScript:tID HenHouseID:henHouseID FactoryID:fID FactoryLevel:nlevel];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL)SubFactoryFromHenHouse:(NSString*)tID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteFactoryFromHenHouseScript:tID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
#pragma mark relmagic 表操作 
-(NSData*) SelectMagicRelationFromBuidID:(NSString*)BuildingID
{
    [self checkDB];
    NSString * script = [sqlScripService SelectMagicRelationFromBuidIDScript:BuildingID];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:RelMagicXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"tID",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"bID", (const char *)sqlite3_column_text(statement, 1))];
            [attrArray addObject: FarmAttrText(@"mID", (const char *)sqlite3_column_text(statement, 2))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(BOOL) AddMagicBuilding:(NSString *)magicID BuildingID:(NSString*)bID TableID:(NSString*)tID
{
    [self checkDB];
    NSString * script = [sqlScripService InsertMagicBuildingScript:magicID BuildingID:bID TableID:tID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
-(BOOL) SubMagicBuildingByTableID:(NSString*)tID
{
    [self checkDB];
    NSString * script = [sqlScripService DeleteMagicBuildingByTableIDScript:tID];
    return FarmeEXECSql(farmDB, [script UTF8String]);
}
#pragma mark 静态表查询
-(NSData*)SelItemDataFromProduct:(NSString*)itmeName
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemDataFromProductScript:itmeName];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemProductXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"disName", (const char *)sqlite3_column_text(statement, 1))];
            [attrArray addObject: FarmAttrInt(@"cansell", sqlite3_column_int(statement, 2))];
            [attrArray addObject: FarmAttrInt(@"price", sqlite3_column_int(statement, 3))];
            [attrArray addObject: FarmAttrText(@"image", (const char *)sqlite3_column_text(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"exp", sqlite3_column_int(statement, 5))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(NSData*)SelItemDataFromProp:(NSString*)itemName
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemDataFromPropScript:itemName];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemPropXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"disName", (const char *)sqlite3_column_text(statement, 1))];
            [attrArray addObject: FarmAttrInt(@"cansell", sqlite3_column_int(statement, 2))];
            [attrArray addObject: FarmAttrInt(@"bprice", sqlite3_column_int(statement, 3))];
            [attrArray addObject: FarmAttrInt(@"cansell", sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"sprice", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrText(@"imagepath", (const char *)sqlite3_column_text(statement,6))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(NSData*)SelItemDataFromVicle:(NSString*)itemName
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemDataFromVicleScript:itemName];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemVehicleXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"disName", (const char *)sqlite3_column_text(statement, 1))];
            [attrArray addObject: FarmAttrInt(@"cansell", sqlite3_column_int(statement, 2))];
            [attrArray addObject: FarmAttrInt(@"buyprice", sqlite3_column_int(statement, 3))];
            [attrArray addObject: FarmAttrText(@"image", (const char *)sqlite3_column_text(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"speed", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrInt(@"capacity", sqlite3_column_int(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"bags", sqlite3_column_int(statement, 7))];
            [attrArray addObject: FarmAttrInt(@"cargo", sqlite3_column_int(statement, 8))];
            [attrArray addObject: FarmAttrInt(@"costmoney", sqlite3_column_int(statement, 9))];
            [attrArray addObject: FarmAttrInt(@"costtime", sqlite3_column_int(statement, 10))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
-(NSData*)SelItemDataFromPourltry:(NSString*)itemName
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemDataFromPourltryScript:itemName];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemPaulitryXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"disName", (const char *)sqlite3_column_text(statement, 1))];
            [attrArray addObject: FarmAttrInt(@"buyprice", sqlite3_column_int(statement, 2))];
            [attrArray addObject: FarmAttrInt(@"sellprice", sqlite3_column_int(statement, 3))];
            [attrArray addObject: FarmAttrText(@"imagepath", (const char *)sqlite3_column_text(statement, 4))];
            [attrArray addObject: FarmAttrText(@"size", (const char *)sqlite3_column_text(statement, 5))];
            [attrArray addObject: FarmAttrText(@"trandest", (const char *)sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"transtime", sqlite3_column_int(statement, 7))];
            [attrArray addObject: FarmAttrInt(@"khurt", sqlite3_column_int(statement, 8))];
            [attrArray addObject: FarmAttrText(@"states", (const char *)sqlite3_column_text(statement, 9))];
            [attrArray addObject: FarmAttrInt(@"canlay", sqlite3_column_int(statement, 10))];
            [attrArray addObject: FarmAttrInt(@"laytime", sqlite3_column_int(statement, 11))];
            [attrArray addObject: FarmAttrText(@"layname",(const char *)sqlite3_column_text(statement,12))];
            [attrArray addObject: FarmAttrInt(@"kfood", sqlite3_column_int(statement, 13))];
            [attrArray addObject: FarmAttrInt(@"kwater", sqlite3_column_int(statement, 14))];
            [attrArray addObject: FarmAttrInt(@"ksum", sqlite3_column_int(statement, 15))];
            [attrArray addObject: FarmAttrInt(@"knum", sqlite3_column_int(statement, 16))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    //NSLog(@"%@",doc);
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
//获得加工厂可转换物品
-(NSData*)SelItemsCanProduct
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemsCanProductScript];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemFactoryXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrDouble(@"kproduct", sqlite3_column_double(statement, 1))];
            [attrArray addObject: FarmAttrText(@"itemtype", (const char *)sqlite3_column_text(statement, 2))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
//从建筑类中获得物品详细信息
-(NSData*)SelItemDataFromBuilding:(NSString*)itemName
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemDataFromBuildingScript:itemName];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemBuildXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"disName",(const char *)sqlite3_column_text(statement, 1))];
            const char* btype = (const char *)sqlite3_column_text(statement, 2);
            [attrArray addObject: FarmAttrText(@"btype", btype)];
            [attrArray addObject: FarmAttrInt(@"isFun", sqlite3_column_int(statement, 3))];
            [attrArray addObject: FarmAttrInt(@"isMagic", sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"canBuild", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrText(@"needitem",(const char*) sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"canUpgrad", sqlite3_column_int(statement, 7))];
            [attrArray addObject: FarmAttrInt(@"blevel", sqlite3_column_int(statement, 8))];
            [attrArray addObject: FarmAttrInt(@"upgradPrice", sqlite3_column_int(statement, 9))];
            [attrArray addObject: FarmAttrInt(@"exp", sqlite3_column_int(statement, 10))];
            [attrArray addObject: FarmAttrInt(@"candestory", sqlite3_column_int(statement, 11))];
            [attrArray addObject: FarmAttrText(@"buildtime",(const char*) sqlite3_column_text(statement, 12))];
            [attrArray addObject: FarmAttrText(@"size",(const char*) sqlite3_column_text(statement, 13))];
            [attrArray addObject: FarmAttrText(@"buildedpic",(const char*) sqlite3_column_text(statement, 14))];
            [attrArray addObject: FarmAttrText(@"buildingpath",(const char*) sqlite3_column_text(statement, 15))];
            [attrArray addObject: FarmAttrInt(@"buyprice", sqlite3_column_int(statement, 16))];
            [attrArray addObject: FarmAttrInt(@"getdestroy", sqlite3_column_int(statement, 17))];
            [attrArray addObject: FarmAttrText(@"destoryneedtime",(const char*) sqlite3_column_text(statement, 18))];
            [attrArray addObject: FarmAttrText(@"destorypc",(const char*) sqlite3_column_text(statement, 19))];
            if(strcmp(btype,NORBUILDING)!=0)
            {
                [self GetAdditionnalBuildInfn:btype :itemName toArray:attrArray];
            }
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            NSLog(@"%@",doc);
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
//根据级别查询建筑
-(NSData*)SelBuildingByItemType:(NSString*)btype MaxLevel:(int)nMaxLevel
{
    [self checkDB];
    NSString * script = [sqlScripService SelItemFromBuildingScript:btype MaxLevel:nMaxLevel];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemBuildXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            const char* sysName=(const char *)sqlite3_column_text(statement,0);
            [attrArray addObject: FarmAttrText(@"sysName",sysName)];
            [attrArray addObject: FarmAttrText(@"disName",(const char *)sqlite3_column_text(statement, 1))];
            const char* stype = (const char *)sqlite3_column_text(statement, 2);
            [attrArray addObject: FarmAttrText(@"btype",stype)];
            [attrArray addObject: FarmAttrInt(@"isFun", sqlite3_column_int(statement, 3))];
            [attrArray addObject: FarmAttrInt(@"isMagic", sqlite3_column_int(statement, 4))];
            [attrArray addObject: FarmAttrInt(@"canBuild", sqlite3_column_int(statement, 5))];
            [attrArray addObject: FarmAttrText(@"needitem",(const char*) sqlite3_column_text(statement, 6))];
            [attrArray addObject: FarmAttrInt(@"canUpgrad", sqlite3_column_int(statement, 7))];
            [attrArray addObject: FarmAttrInt(@"blevel", sqlite3_column_int(statement, 8))];
            [attrArray addObject: FarmAttrInt(@"upgradPrice", sqlite3_column_int(statement, 9))];
            [attrArray addObject: FarmAttrInt(@"exp", sqlite3_column_int(statement, 10))];
            [attrArray addObject: FarmAttrInt(@"candestory", sqlite3_column_int(statement, 11))];
            [attrArray addObject: FarmAttrText(@"buildtime",(const char*) sqlite3_column_text(statement, 12))];
            [attrArray addObject: FarmAttrText(@"size",(const char*) sqlite3_column_text(statement, 13))];
            [attrArray addObject: FarmAttrText(@"buildedpic",(const char*) sqlite3_column_text(statement, 14))];
            [attrArray addObject: FarmAttrText(@"buildingpath",(const char*) sqlite3_column_text(statement, 15))];
            [attrArray addObject: FarmAttrInt(@"buyprice", sqlite3_column_int(statement, 16))];
            [attrArray addObject: FarmAttrInt(@"getdestroy", sqlite3_column_int(statement, 17))];
            [attrArray addObject: FarmAttrText(@"destoryneedtime",(const char*) sqlite3_column_text(statement, 18))];
            [attrArray addObject: FarmAttrText(@"destorypc",(const char*) sqlite3_column_text(statement, 19))];
            if(strcmp(stype,NORBUILDING)!=0)
            {
               // [self GetAdditionnalBuildInfn:btype :itemName toArray:attrArray];
            }
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            NSLog(@"%@",doc);
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;

}
-(BOOL)GetAdditionnalBuildInfn:(const char *)btype :(NSString *)sysName toArray:(NSMutableArray *)attrs
{
    if(strcmp(btype, BREBUILDING)==0)
    {
        sqlite3_stmt * statement  = NULL;
        NSString * script = [sqlScripService SelItemDataFromSitemBreedScript:sysName];
        if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
        {
            while(sqlite3_step(statement)==SQLITE_ROW)
            {
                [attrs addObject: FarmAttrText(@"breedtype",(const char *)sqlite3_column_text(statement, 1))];
                [attrs addObject: FarmAttrInt(@"breedNum", sqlite3_column_int(statement, 2))];
            }
            sqlite3_finalize(statement);
        }else
        {
            DEBUGPrint("%s",sqlite3_errmsg(farmDB));
        }     
    }else if(strcmp(btype, PROBUILDING)==0)
    {
        sqlite3_stmt * statement  = NULL;
        NSString * script = [sqlScripService SelItemDataFromSitemProductScript:sysName];
        if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
        {
            while(sqlite3_step(statement)==SQLITE_ROW)
            {
                [attrs addObject: FarmAttrDouble(@"kproduct",sqlite3_column_double(statement, 1))];
                [attrs addObject: FarmAttrText(@"items", (const char*)sqlite3_column_text(statement, 2))];
            }
            sqlite3_finalize(statement);
        }else
        {
            DEBUGPrint("%s",sqlite3_errmsg(farmDB));
        }  
    }else if(strcmp(btype, MAGBUILDING)==0)
    {
        sqlite3_stmt * statement  = NULL;
        NSString * script = [sqlScripService SelItemDataFromSitemMagicScript:sysName];
        if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
        {
            while(sqlite3_step(statement)==SQLITE_ROW)
            {
                [attrs addObject: FarmAttrText(@"mtype", (const char*)sqlite3_column_text(statement, 1))];
                [attrs addObject: FarmAttrText(@"k", (const char*)sqlite3_column_text(statement, 2))];
                [attrs addObject: FarmAttrText(@"kitem", (const char*)sqlite3_column_text(statement, 3))];
                [attrs addObject: FarmAttrInt(@"kfood", sqlite3_column_int(statement, 1))];
                [attrs addObject: FarmAttrInt(@"kwater", sqlite3_column_int(statement, 1))];
            }
            sqlite3_finalize(statement);
        }else
        {
            DEBUGPrint("%s",sqlite3_errmsg(farmDB));
        }  
    }
    return YES;
}
//获得商店中物品信息
-(NSData*)SelShopData
{
    [self checkDB];
    NSString * script = [sqlScripService SelShopDataScript];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemShopXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"itemtype", (const char *)sqlite3_column_text(statement,1))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}
//获得玩家初始信息
-(NSData*)SelItemDataFromMoney:(NSString*)itemName
{
    
    [self checkDB];
    NSString * script = [sqlScripService SelMoneyDataScript:itemName];
    sqlite3_stmt * statement  = NULL;
    DDXMLDocument * doc = [[DDXMLDocument alloc] initWithXMLString:ItemMoneyXmlHeader options:0 error:nil];
    DDXMLElement * root = [doc rootElement];
    if(SQLITE_OK==sqlite3_prepare_v2(farmDB, [script UTF8String], -1,&statement,NULL ))
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSMutableArray * attrArray = [[NSMutableArray alloc] init];
            [attrArray addObject: FarmAttrText(@"sysName",(const char *)sqlite3_column_text(statement,0))];
            [attrArray addObject: FarmAttrText(@"disName", (const char *)sqlite3_column_text(statement,1))];
            [attrArray addObject: FarmAttrInt(@"money", sqlite3_column_int(statement,1))];
            [attrArray addObject: FarmAttrInt(@"diamond", sqlite3_column_int(statement,1))];
            DDXMLElement * Node = [DDXMLElement elementWithName:@"Node" children:nil attributes:attrArray];
            [root addChild:Node];
            SafeRelease(attrArray);
        }
        sqlite3_finalize(statement);
    }else
    {
        DEBUGPrint("%s",sqlite3_errmsg(farmDB));
    }
    NSData * xmlData =  [doc XMLDataWithOptions:DDXMLNodeOptionsNone];
    SafeRelease(doc);
    return xmlData;
}

#pragma mark debug打印表信息 
-(void)PrintTableAttribute:(NSArray *)attrs tableName:(NSString *)tablename
{
//    NSMutableString * sqlString = [NSString stringWithFormat:@"select * from /"%@"/"] 
//    for (size_t i  =0;  i < [attrs count] ; i++) {
//        
//    }
//    for (size_t i =0; i < [attrs count]; ++i) {
//        [attrs ]
//    }
}
-(void)dealloc
{
    [super dealloc];
}
@end
