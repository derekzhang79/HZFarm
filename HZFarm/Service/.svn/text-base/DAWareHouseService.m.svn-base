//
//  DAWareHouseService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAWareHouseService.h"
#import "DAHeader.h"
#import "TouchXML.h"
#import "DAPlayerService.h"
#import "sqlliteService.h"
#import "DAItemTypeRelService.h"

@implementation DAWareHouseService
@synthesize wareHouseData;

static DAWareHouseService* shareWareHouseService_;

+(DAWareHouseService*) shareWareHouseService
{
    if (nil==shareWareHouseService_) {
        shareWareHouseService_=[[DAWareHouseService alloc]init];
    }
    return shareWareHouseService_;
}
+(id) alloc
{
    NSAssert(shareWareHouseService_ == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}
-(void) RefreshWareHouseData
{
    self.wareHouseData=nil;
    wareHouseData=[[DAWareHouseDataEntity alloc]init];

    NSData *xmlData=[[sqlliteService sharSqlliteservice]SelectAllItemInWareHouse:[[DAPlayerService sharePlayerService]playerEntity].ID];
    if (nil==xmlData) {
        return;
    }
    CXMLDocument * doc=[[CXMLDocument alloc]initWithData:xmlData options:0 error:nil];
    if (nil==doc) {
        return ;
    }
    CXMLElement *tableNode=[doc rootElement];
    if (nil==tableNode) {
        [doc release];
        return ;
    }
    NSArray* szNode=[tableNode elementsForName:@"Node"];
    if (nil==szNode||szNode.count<1) {
        [doc release];
        return ;
    }
    for (CXMLElement*subNode in szNode) {
        NSString*itemName=[[subNode attributeForName:@"itemName"]stringValue];
        NSString* strNum=[[subNode attributeForName:@"itemNum"]stringValue];
        if (nil==strNum) {
            continue;
        }
        NSString *strItemType=[[subNode attributeForName:@"itemType"]stringValue];
        //先判断是否是禽类
        if (ItemType_Poultry==[DAItemTypeRelService GetItemType:strItemType]) {
            //增加禽类
            [self AddPoultryItemByName:itemName ItemNum:[strNum intValue]];
        }
        else
        {
            [self AddItemByName:itemName ItemType:[DAItemTypeRelService GetGetneralType:strItemType] ItemNum:[strNum intValue]];
        }
        
    }
    [doc release];

}
-(DAItemInWareHouse *) FindEggsItem:(NSString*)iName
{
    for (DAItemInWareHouse* item in wareHouseData.ItemEggs) {
        if ([item.sysName isEqualToString:iName]) {
            return item;
        }
    }
    return nil;
}
-(DAItemInWareHouse *) FineProductsItem:(NSString*)iName
{
    for (DAItemInWareHouse* item in wareHouseData.ItemProducts) {
        if ([item.sysName isEqualToString:iName]) {
            return item;
        }
    }
    return nil;
}
-(DAItemInWareHouse *) FindPoultryItem:(NSString*)iName
{
    for (DAItemInWareHouse* item in wareHouseData.ItemPoultry) {
        if ([item.sysName isEqualToString:iName]) {
            return item;
        }
    }
    return nil;
}
-(DAItemInWareHouse *) FindVehicleItem:(NSString*)iName
{
    for (DAItemInWareHouse* item in wareHouseData.ItemVehicle) {
        if ([item.sysName isEqualToString:iName]) {
            return item;
        }
    }
    return nil;
}
-(DAItemInWareHouse *) FindPropItem:(NSString*)iName
{
    for (DAItemInWareHouse* item in wareHouseData.ItemProp) {
        if ([item.sysName isEqualToString:iName]) {
            return item;
        }
    }
    return nil;
}

//增加或减少物品数量，仅影响内存中物品数量，不影响数据库
-(void) AddItemByName:(NSString*) itemName ItemType:(DAGeneralItemType) itype ItemNum:(int)iNum
{
    DAItemInWareHouse * item=nil;
    switch (itype) {
        case GeneralItem_Eggs:
            item=[self FindEggsItem:itemName];
            break;
        case  GeneralItem_Prop:
            item=[self FindPropItem:itemName];
            break;
        case GeneralItem_Products:
            item=[self FineProductsItem:itemName];
            break;
        case GeneralItem_Vehicle:
            item=[self FindVehicleItem:itemName];
            break;
        default:
            break;
    }
    if (item) {
        item.iNum+=iNum;
    }
    else
    {
        item=[[DAItemInWareHouse alloc]init];
        item.sysName=[NSString stringWithFormat:@"%@",itemName];
        item.iNum=iNum;
        item.itemType=[DAItemTypeRelService GetGeneralTypeName:itype];
        switch (itype) {
            case GeneralItem_Eggs:
                [wareHouseData.ItemEggs addObject:item];
                break;
            case  GeneralItem_Prop:
                [wareHouseData.ItemProp addObject:item];
                break;
            case GeneralItem_Products:
                [wareHouseData.ItemProducts addObject:item];
                break;
            case GeneralItem_Vehicle:
                [wareHouseData.ItemVehicle addObject:item];
                break;
            default:
                break;
        }

        [item release];
    }
}
-(void) AddPoultryItemByName:(NSString*)itemName ItemNum:(int) iNum
{
    DAItemInWareHouse * item=[self FindPoultryItem:itemName];
    if (item) {
        item.iNum+=iNum;
    }
    else{
        item=[[DAItemInWareHouse alloc]init];
        item.sysName=[NSString stringWithFormat:@"%@",itemName];
        item.iNum=iNum;
        item.itemType=[DAItemTypeRelService GetItemTypeName:ItemType_Poultry];
        [wareHouseData.ItemPoultry addObject:item];
        [item release];
    }
}
-(void) SubItemByName:(NSString*) itemName ItemType:(DAGeneralItemType) itype ItemNum:(int)iNum
{
    DAItemInWareHouse * item=nil;
    switch (itype) {
        case GeneralItem_Eggs:
            item=[self FindEggsItem:itemName];
            break;
        case  GeneralItem_Prop:
            item=[self FindPropItem:itemName];
            break;
        case GeneralItem_Products:
            item=[self FineProductsItem:itemName];
            break;
        case GeneralItem_Vehicle:
            item=[self FindVehicleItem:itemName];
            break;
        default:
            break;
    }
    if (item) {
        item.iNum-=iNum;
        if (item.iNum<=0) {
            switch (itype) {
                case GeneralItem_Eggs:
                    [wareHouseData.ItemEggs removeObject:item];
                    break;
                case  GeneralItem_Prop:
                    [wareHouseData.ItemProp removeObject:item];
                    break;
                case GeneralItem_Products:
                    [wareHouseData.ItemProducts removeObject:item];
                    break;
                case GeneralItem_Vehicle:
                    [wareHouseData.ItemVehicle removeObject:item];
                    break;
                default:
                    break;
            }
        }
    }
}
-(void) SubPoultryItemByName:(NSString*)itemName ItemNum:(int) iNum
{
    DAItemInWareHouse * item=[self FindPoultryItem:itemName];
    if (item) {
        item.iNum-=iNum;
        if (item.iNum<=0) {
            [wareHouseData.ItemPoultry removeObject:item]; 
        }
    }
}
-(void) dealloc
{
    self.wareHouseData=nil;
    [super dealloc];
}
@end
