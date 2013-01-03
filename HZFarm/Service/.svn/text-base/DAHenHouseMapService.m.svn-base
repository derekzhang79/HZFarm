//
//  DAHenHouseMapService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAHenHouseMapService.h"
#import "DAHeader.h"
#import "sqlliteService.h"
#import "DAItemService.h"
#import "TouchXML.h"

@implementation DAHenHouseMapService
@synthesize HenHouseDic;

static DAHenHouseMapService * shareHenHouseMapService_;
+(DAHenHouseMapService *) shareHenHouseMapService
{
    if (nil==shareHenHouseMapService_) {
        shareHenHouseMapService_=[[DAHenHouseMapService alloc]init];
        [shareHenHouseMapService_ privInit];
    }
    return shareHenHouseMapService_;
}
+(id) alloc
{
    NSAssert(shareHenHouseMapService_==nil, @"不可以创建单利服务对象 DAHenHouseMapService");
    return [super alloc];
}
-(DAHenHouseMapEntity *) GetHenHouseMap:(NSString *) henHouseID
{
    DAHenHouseMapEntity * henHouseMap=[HenHouseDic valueForKey:henHouseID];
    if (nil==henHouseMap) {
        //数据库查询
        NSData* xmldata=[[sqlliteService sharSqlliteservice]SelectAllBuildingFromHenHouse:henHouseID];
        CXMLDocument *doc=[[CXMLDocument alloc]initWithData:xmldata options:0 error:nil];
        if (nil==doc) {
            return nil;
        }
        CXMLElement *root=[doc rootElement];
        NSArray* szNode=[root elementsForName:@"Node"];
        if (nil==szNode||szNode.count<1) {
            [doc release];
            return nil;
        }
        henHouseMap=[[DAHenHouseMapEntity alloc]init];
        
        for(CXMLElement *subNode in szNode){
            NSString*itemName=[[subNode attributeForName:@"itemName"]stringValue];
            DABuildingEntity *buildItem=[[DAItemService shareService]GetBuildingItemByName:itemName BuildingType:BuildingType_Normal];
            if (buildItem) {
                buildItem.ID=[[subNode attributeForName:@"bID"]stringValue];
                buildItem.nPosX=[[[subNode attributeForName:@"posx"]stringValue]intValue];
                buildItem.nPosY=[[[subNode attributeForName:@"posy"]stringValue]intValue];
                [henHouseMap.itemArr addObject:buildItem];
            }
        }
        [HenHouseDic setObject:henHouseMap forKey:henHouseID];
        [doc release];
        return [henHouseMap autorelease];
    }
    else
    {
        return henHouseMap;
    }
    
}
-(void)privInit
{
    HenHouseDic=[[NSMutableDictionary alloc]init];
}
-(void) dealloc
{
    self.HenHouseDic=nil;
    [super dealloc];
}
@end
