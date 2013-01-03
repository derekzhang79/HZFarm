//
//  SqlUtil.h
//  FarmeDB
//
//  Created by GOOOG on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef FarmeDB_SqlUtil_h
#define FarmeDB_SqlUtil_h
#import <sqlite3.h>
#import "DDXML.h"


#define SafeFree(fX) { if(fX) { free(fX); (fX) = NULL;  }} 
#define SafeRelease(fX) { [fX release]; fX = nil; }
#ifdef DEBUG
#define DEBUGLOG(...) NSLog(__VA_ARGS__)
#define DEBUGPrint(...) printf(__VA_ARGS__)
#else
#define DEBUGLOG(...)
#define DEBUGPrint(...)
#endif

#define NORBUILDING "一般类"
#define BREBUILDING "养殖类"
#define PROBUILDING "加工类"
#define MAGBUILDING "魔法类"
static inline void FarmBindInt(NSMutableArray * desArray, NSString * subScript,int value)
{
    if(value>=0)
    {
        NSMutableString * string  = [NSMutableString stringWithString:subScript];
        [string appendFormat:@"%i",value];
        [desArray addObject: string];
    }
}
static inline void FarmBindTime(NSMutableArray * desArray,NSString * subScript,int value)
{
    if(value>=0)
    {
        NSMutableString * string  = [NSMutableString stringWithString:subScript];
        [string appendFormat:@"\"%@\"",[NSString stringWithFormat:@"%@",value]];
        [desArray addObject: string];
    } 
}
static inline void FarmBindText(NSMutableArray * desArray,NSString * subScript,NSString* value)
{
 if(value!=nil)
 {
     
     NSMutableString * string  = [NSMutableString stringWithString:subScript];
     [string appendFormat:@"\"%@\"",value];
     [desArray addObject: string];
    } 
 }
static inline DDXMLNode* FarmAttrText(NSString* attrName,const char * attrValue)
{
    if(NULL==attrValue)
       return  [DDXMLNode attributeWithName:attrName stringValue:@""];
    else
       return  [DDXMLNode attributeWithName:attrName stringValue:[NSString stringWithUTF8String:attrValue]];
}
static inline DDXMLNode* FarmAttrDouble(NSString* attrName,double attrValue)
{
    if(0==attrValue)
        return  [DDXMLNode attributeWithName:attrName stringValue:@""];
    else
        return  [DDXMLNode attributeWithName:attrName stringValue:[NSString stringWithFormat:@"%f",attrValue]];
}
static inline DDXMLNode* FarmAttrInt(NSString* attrName,int attrValue)
{
    return [DDXMLNode attributeWithName:attrName stringValue:[NSString stringWithFormat:@"%i",attrValue]];
}

static inline BOOL FarmeEXECSql(sqlite3* DB,const char* sql)
{
    char * errMsg = NULL;
    if(SQLITE_OK!=sqlite3_exec(DB, sql, NULL, NULL, &errMsg))
    {
        DEBUGPrint("%s",errMsg);
        SafeFree(errMsg);
        return NO;
    }
    return YES;
}
static  NSString * ITEM_BUILD = @"itembuild.xml";
static  NSString * ITEM_FACTORY = @"itemfactorytrans.xml";
static  NSString * ITEM_MONEY = @"itemMoney.xml";
static  NSString * ITEM_PAULTRY = @"itempaultry.xml";
static  NSString * ITEM_PRODUCT = @"itemproduct.xml";
static  NSString * ITEM_PROP = @"itemprop.xml";
static  NSString * ITEM_SHOP = @"itemshop.xml";
static  NSString * ITEM_STATE = @"itemstate.xml";
static  NSString * ITEM_VEHICLE = @"itemvehicle.xml";
static  NSString * SITEM_BREED = @"sitembreed.xml";
static  NSString * SITEM_MAGIC = @"sitemmagic.xml";
static  NSString * SITEM_PRODUCT = @"sitemproduct.xml";
static  NSString * X_PATH = @"//Table/SqlScript";

static  NSString * ItemBuildXmlHeader = @"<Table TableName=\"itembuild\"/>";
static  NSString * ItemFactoryXmlHeader = @"<Table TableName=\"itemfactorytrans\"/>";
static  NSString * ItemMoneyXmlHeader = @"<Table TableName=\"itemMoney\"/>";
static  NSString * ItemPaulitryXmlHeader = @"<Table TableName=\"itempaultry\"/>";
static  NSString * ItemProductXmlHeader = @"<Table TableName=\"itemproduct\"/>";
static  NSString * ItemPropXmlHeader = @"<Table TableName=\"itemprop\"/>";
static  NSString * ItemShopXmlHeader = @"<Table TableName=\"itemshop\"/>";
//static  NSString * ItemStateXmlHeader = @"<Table TableName=\"itemstate\"/>";
static  NSString * ItemVehicleXmlHeader = @"<Table TableName=\"itemvehicle\"/>";
//static  NSString * ItemSBreedXmlHeader = @"<Table TableName=\"sitembreed\"/>";
//static  NSString * ItemSMaigcXmlHeader = @"<Table TableName=\"sitemmagic\"/>";
//static  NSString * ItemSProductXmlHeader = @"<Table TableName=\"sitemproduct\"/>";
static  NSString * UserXmlHeader = @"<Table TableName=\"user\"/>";
static  NSString * WorlMapXmlHeader  = @"<Table TableName=\"worldmap\"/>";
static  NSString * WareHouseXmlHeader = @"<Table TableName=\"ware\"/>";
static  NSString * FactoryXmlHeader = @"<Table TableName=\"factory\"/>";
static  NSString * HenHouseDataXmlHeader = @"<Table TableName=\"henhousedata\"/>";
//static  NSString * HenHouseMapXmlHeader = @"<Table Tablename=\"henhousemap\">";
static  NSString * HenHouseStateXmlHeader = @"<Table Tablename=\"henhousestate\"/>";
static  NSString * RelFactoryXmlHeader = @"<Table Tablename=\"relfactory\"/>";
static  NSString * RelMagicXmlHeader = @"<Table Tablename=\"relmagic\"/>";
#endif
