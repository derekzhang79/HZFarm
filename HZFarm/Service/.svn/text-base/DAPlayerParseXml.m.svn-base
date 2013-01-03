//
//  DAPlayerParseXml.m
//  MapTest
//
//  Created by liwensheng on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAPlayerParseXml.h"
#import "TouchXML.h"
#import "sqlliteService.h"


@implementation DAPlayerParseXml

+(NSArray*) getAllPlayerName
{
    NSData *xmldata=[[sqlliteService sharSqlliteservice]SelectUserByName:nil];
    NSArray * szNode=[self getNodeSZ:xmldata];
    if (nil==szNode) {
        return nil;
    }
    NSMutableArray * allUser=[[NSMutableArray alloc]init];
    for (CXMLElement *subNode in szNode)
    {
        [allUser addObject:[[subNode attributeForName:@"uName"]stringValue]];
    }
    return [allUser autorelease];
}
+(DAPlayerEntity*) getPlayerInfo:(NSData*)xmldata
{
    NSArray *szNode=[self getNodeSZ:xmldata];
    if (nil==szNode) {
        return nil;
    }
    CXMLElement *subNode=[szNode objectAtIndex:0];
    DAPlayerEntity *playerEntity=[[DAPlayerEntity alloc]init];
    playerEntity.ID=[[subNode attributeForName:@"uID"]stringValue];
    playerEntity.Name=[[subNode attributeForName:@"uName"]stringValue];
    playerEntity.lastLeave=[[subNode attributeForName:@"lastleave"]stringValue];
    playerEntity.regTime=[[subNode attributeForName:@"regTime"]stringValue];
    
    playerEntity.nLevel=[[[subNode attributeForName:@"level"]stringValue]intValue];
    playerEntity.nExp=[[[subNode attributeForName:@"exp"]stringValue]intValue];
    playerEntity.nMoney=[[[subNode attributeForName:@"money"]stringValue]intValue];
    playerEntity.nDiamond=[[[subNode attributeForName:@"diamond"]stringValue]intValue];
    
    return [playerEntity autorelease];
}
+(NSArray*) getAllFactoryInHenHouse:(NSData*)xmldata
{
    NSArray *szNode=[self getNodeSZ:xmldata];
    if (nil==szNode) {
        return nil;
    }
    NSMutableArray* szItems=[[NSMutableArray alloc]init];
    for (CXMLElement *subNode in szNode)
    {
        DAFactoryInHenHouse * obj=[[DAFactoryInHenHouse alloc]init];
        obj.tID=[[subNode attributeForName:@"tID"]stringValue];
        obj.factoryID=[[subNode attributeForName:@"fID"]stringValue];
        obj.henHouseID=[[subNode attributeForName:@"bID"]stringValue];
        obj.nProductLevel=[[[subNode attributeForName:@"flevel"]stringValue]intValue];
        [szItems addObject:obj];
        [obj release];
    }
    return [szItems autorelease];
}
+(NSArray*) getAllMagicInHenHouse:(NSData*)xmldata
{
    NSArray *szNode=[self getNodeSZ:xmldata];
    if (nil==szNode) {
        return nil;
    }
    NSMutableArray* szItems=[[NSMutableArray alloc]init];
    for (CXMLElement *subNode in szNode)
    {
        DAMagicInHenHouse * obj=[[DAMagicInHenHouse alloc]init];
        obj.tID=[[subNode attributeForName:@"tID"]stringValue];
        obj.magicID=[[subNode attributeForName:@"mID"]stringValue];
        obj.henHouseID=[[subNode attributeForName:@"bID"]stringValue];
        
        [szItems addObject:obj];
        [obj release];
    }
    return [szItems autorelease];
}
+(NSArray*) getNodeSZ:(NSData*)xmldata
{
    CXMLDocument * doc=[[[CXMLDocument alloc]initWithData:xmldata options:0 error:nil]autorelease];
    if (nil==doc) {
        return nil;
    }
    CXMLElement *tableNode=[doc rootElement];
    if (nil==tableNode) {
        return nil;
    }
    NSArray* szNode=[tableNode elementsForName:@"Node"];
    if (nil==szNode||szNode.count<1) {
        return nil;
    }
    return szNode;
}

@end
