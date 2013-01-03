//
//  DAHenHousesDataService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAHenHousesDataService.h"
#import "DAWorldMapService.h"
#import "TouchXML.h"
#import "sqlliteService.h"
#import "DAPlayerParseXml.h"

@implementation DAHenHousesDataService
@synthesize HenHouseDataDic;
static DAHenHousesDataService* shareHenHouseDataService_=nil;
+(DAHenHousesDataService*) shareHenHouseDataService
{
    if (nil==shareHenHouseDataService_) {
        shareHenHouseDataService_=[[DAHenHousesDataService alloc]init];
        [shareHenHouseDataService_ privateInit];
    }
    return shareHenHouseDataService_;
}
+(id)alloc
{
    NSAssert(shareHenHouseDataService_==nil,  @"试图创建单例服务对象:DAHenHousesDataService");
    return [super alloc];
}
-(DAHenHouseDataEntity *) getHenHouseData:(NSString*) henHouseID
{
    DAHenHouseDataEntity *henHouseData=[HenHouseDataDic valueForKey:henHouseID];
    return henHouseData;
}
-(void)RefreshAllHenHouseData
{
    //获得世界中所有鸡舍ID
    NSArray * szHenHouseID=[[DAWorldMapService shareWorldMapService]GetAllBuildingIDByType:BuildingType_Breeding];
    if (nil==szHenHouseID||szHenHouseID.count<1) {
        return;
    }
    [HenHouseDataDic removeAllObjects];
    
    
    for(NSString *subID in szHenHouseID)
    {
        NSData * xmldata=[[sqlliteService sharSqlliteservice]SelectAllItemFromHenHouse:subID];
        if (nil==xmldata) {
            continue;
        }
        CXMLDocument *doc=[[CXMLDocument alloc]initWithData:xmldata options:0 error:nil];
        if (nil==doc) {
            continue;
        }
        CXMLElement *root=[doc rootElement];
        if (nil==root) {
            [doc release];
            continue;
        }
        NSArray* szNode=[root elementsForName:@"Node"];
        if (szNode==nil||szNode.count<1) {
            [doc release];
            continue;
        }
        DAHenHouseDataEntity*henHouseData=[[DAHenHouseDataEntity alloc]init];
        henHouseData.henHouseID=subID;
        
        NSMutableArray *itemArr=[[NSMutableArray alloc]init];
        for (CXMLElement *subNode in szNode) {
            DAItemInHenHouse *item=[[DAItemInHenHouse alloc]init];
            
            item.tID=[[subNode attributeForName:@"tID"]stringValue];
            item.henHouseID=[[subNode attributeForName:@"bID"]stringValue];
            item.sysName=[[subNode attributeForName:@"itemName"]stringValue];
            
            item.joinTime=[[subNode attributeForName:@"bTime"]stringValue];
            
            item.lastFoodTime=[[subNode attributeForName:@"lfood"]stringValue];
            item.lastLayTime=[[subNode attributeForName:@"lget"]stringValue];
            item.lastWaterTime=[[subNode attributeForName:@"lwater"]stringValue];
            item.ActiveGrowTime=[[[subNode attributeForName:@"active"]stringValue]intValue];
            item.layEggs=[[[subNode attributeForName:@"layeggs"]stringValue]intValue];
            //[henHouseData.itemArr addObject:item];
            [itemArr addObject:item];
            [item release];
        }
        //查找鸡舍剩余水和食物
        NSArray* szRest=[self GetRestFoodAndWaterFromDB:subID];
        if (!szRest) {
            henHouseData.restFood=0;
            henHouseData.restWater=0;
        }
        else
        {
            henHouseData.restWater=[[szRest objectAtIndex:0]intValue];
            henHouseData.restFood=[[szRest objectAtIndex:1]intValue];
        }
        henHouseData.itemArr=itemArr;
        [itemArr release];
        [HenHouseDataDic setObject:henHouseData forKey:subID];
        [henHouseData release];
        [doc release];
    }
}
-(void)OnAddItemToHenHouse:(DAItemInHenHouse *)item
{
    DAHenHouseDataEntity *henHouseData=[HenHouseDataDic valueForKey:item.henHouseID];
    if (henHouseData) {
        [henHouseData.itemArr addObject:item];
    }
    else
    {
        henHouseData=[[DAHenHouseDataEntity alloc]init];
        NSMutableArray *itemArr=[[NSMutableArray alloc]init];
        [itemArr addObject:item];
        henHouseData.itemArr=itemArr;
        [itemArr release];
        [HenHouseDataDic setObject:henHouseData forKey:item.henHouseID];
        [henHouseData release];
    }
}
-(void)SubItemFromHenHouse:(NSString*)henHouseID TableID:(NSString*)itemTID
{
    DAHenHouseDataEntity *henHouseData=[HenHouseDataDic valueForKey:henHouseID];
    if (henHouseData) {
        for (DAItemInHenHouse *subItem in   henHouseData.itemArr) {
            if ([itemTID isEqualToString:subItem.tID]) {
                [henHouseData.itemArr removeObject:subItem];
                return;
            }
        }
    }
}
-(NSArray*)GetRestFoodAndWaterFromDB:(NSString*)henHouseID
{
    
    NSData* xmldata=[[sqlliteService sharSqlliteservice]SelectHenHouseState:henHouseID];
    if (!xmldata) {
        return nil;
    }
    CXMLDocument *doc=[[CXMLDocument alloc]initWithData:xmldata options:0 error:nil];
    if (!doc) {
        return nil;
    }
    CXMLElement * root=[doc rootElement];
    if (!root) {
        [doc release];
        return nil;
    }
    NSArray* szNode=[root elementsForName:@"Node"];
    if (!szNode||szNode.count<1) {
        [doc release];
        return nil;
    }
    CXMLElement * subNode=[szNode objectAtIndex:0];
    NSString *strWater=[[subNode attributeForName:@"water"]stringValue];
    NSString *strFood=[[subNode attributeForName:@"food"]stringValue];
    if (!strFood||!strWater) {
        [doc release];
        return nil;
    }
    NSMutableArray *szRest=[[NSMutableArray alloc]init];
    [szRest addObject:strWater];
    [szRest addObject:strFood];
    [doc release];
    return [szRest autorelease];
}
-(DAItemInHenHouse*)GetItemFromHenHouse:(NSString*)henHouseID TableID:(NSString*)tid
{
    DAHenHouseDataEntity * henHouseData=[self getHenHouseData:henHouseID];
    if (nil==henHouseData) {
        return nil;
    }
    for (DAItemInHenHouse * subItem in henHouseData.itemArr) {
        if ([tid isEqualToString:subItem.tID]) {
            return subItem;
        }
    }
    return nil;
}
-(DAFactoryInHenHouse*) getFactoryInHenHouse:(NSString*)henHouseID
{
    NSData * xmldata=[[sqlliteService sharSqlliteservice]SelectAllFactoryFromHenHouse:henHouseID];
    NSArray* szFactor=[DAPlayerParseXml getAllFactoryInHenHouse:xmldata];
    if (szFactor&&szFactor.count>0) {
        DAFactoryInHenHouse *result=[szFactor objectAtIndex:0];
        for (int i=1; i<szFactor.count; i++) {
            DAFactoryInHenHouse *subObj=[szFactor objectAtIndex:i];
            if (result.nProductLevel<subObj.nProductLevel) {
                result=subObj;
            }
        }
        return  result;
    }
    return nil;
}
//根据鸡舍id获得所有与之关联的魔法类建筑
-(NSArray*)  getMagicItemsFromHenHouseID:(NSString*)henHouseID
{
    NSData* xmldata=[[sqlliteService sharSqlliteservice]SelectMagicRelationFromBuidID:henHouseID];
    return [DAPlayerParseXml getAllMagicInHenHouse:xmldata];
}
-(void) privateInit
{
    self.HenHouseDataDic=nil;
    HenHouseDataDic=[[NSMutableDictionary alloc]init];
}
-(void) dealloc
{
    self.HenHouseDataDic=nil;
    [super dealloc];
}
@end
