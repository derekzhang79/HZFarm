//
//  DAItemService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAItemService.h"
#import "sqlliteService.h"
#import "DAItemParseXml.h"

@implementation DAItemService
static DAItemService * shareService_;
+(DAItemService*) shareService
{
    if (shareService_==nil) {
        shareService_=[[DAItemService alloc]init];
        [shareService_ privateInit];
    }
    return shareService_;
}
+(id)alloc
{
    NSAssert(shareService_==nil, @"Attempted to allocate a second instance of a DaItemService singleton.");
    return [super alloc];
}
//获得建筑类物品对象养殖建筑 加工类建筑  魔法建筑 一般性建筑
-(id) GetBuildingItemByName:(NSString*) itemName  BuildingType:(DABuildingType) bType
{
    id instance=[itemDic valueForKey:itemName];
    if (nil==instance) {
        NSData *xmlData=[[sqlliteService sharSqlliteservice]SelItemDataFromBuilding:itemName];
        instance=[DAItemParseXml parseBuildingXML:xmlData ItemType:bType];
        if (instance) {
            [itemDic setObject:instance forKey:itemName];
        }
    }
    return instance;
}
//获得一般类物品对象 蛋类物品 加工类物品  交通工具类物品 道具类物品
-(id) GetGeneralItemByName:(NSString*) itemName GeneralItemType:(DAGeneralItemType) gType
{
    id instance=[itemDic valueForKey:itemName];
    if (nil==instance) {
        NSData *xmldata=nil;
        switch (gType) {
            case GeneralItem_Eggs:
                xmldata=[[sqlliteService sharSqlliteservice] SelItemDataFromProduct:itemName];
                break;
            case GeneralItem_Products:
                xmldata=[[sqlliteService sharSqlliteservice] SelItemDataFromProduct:itemName];
                break;
            case GeneralItem_Prop:
                xmldata=[[sqlliteService sharSqlliteservice] SelItemDataFromProp:itemName];
                break;
            case GeneralItem_Vehicle:
                xmldata=[[sqlliteService sharSqlliteservice] SelItemDataFromVicle:itemName];
                break; 
            default:
                break;
        }
        instance = [DAItemParseXml parseGeneralXML:xmldata ItemType:gType];
        if (instance) {
            [itemDic setObject:instance forKey:itemName];
        }
    }
    return instance;
}
//获得禽类物品 如：幼鸡  成鸡  收获期孔雀
-(id) GetPoultryItemByName:(NSString*) itemName
{
    id instance=[itemDic valueForKey:itemName];
    if (nil==instance) {
        NSData *xmldata=[[sqlliteService sharSqlliteservice] SelItemDataFromPourltry:itemName];
        instance=[DAItemParseXml parsePoultryXML:xmldata];
        if (instance) {
            [itemDic setObject:instance forKey:itemName];
        }
    }
    return instance;
}
//获得特殊类别的物品,金币
-(id) GetMoneyItemByName:(NSString*) itemName
{
    id instance=[itemDic valueForKey:itemName];
    if (nil==instance) {
        NSData *xmldata=[[sqlliteService sharSqlliteservice] SelItemDataFromMoney:itemName];
        instance=[DAItemParseXml parseSpecialXML:xmldata];
        if (instance) {
            [itemDic setObject:instance forKey:itemName];
        }
    }
    return instance;
}
-(void) privateInit
{
    itemDic=[[NSMutableDictionary alloc]init];
}
-(void) dealloc
{
    [itemDic release];
    [super dealloc];
}
@end
