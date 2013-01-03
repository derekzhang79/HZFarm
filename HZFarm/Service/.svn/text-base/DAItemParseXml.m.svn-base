//
//  DAItemParseXml.m
//  MapTest
//
//  Created by liwensheng on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
/*
 反射
 unsigned int outCount, i;
 DABuildingEntity *buildingEntity=[[DABuildingEntity alloc]init];
 
 objc_property_t *properties = class_copyPropertyList([DABuildingEntity class], &outCount);
 for (i=0; i<outCount; ++i) {
 objc_property_t property = properties[i];
 NSString * propertyname=[NSString stringWithCString: property_getName(property)encoding:NSUTF8StringEncoding];
 //object_setIvar(<#id obj#>, <#Ivar ivar#>, <#id value#>)
 
 }
 */
#import "DAItemParseXml.h"
#import "DAItemTypeRelService.h"
//#import <objc/runtime.h>

@implementation DAItemParseXml
+(id) parseBuildingXML:(NSData*)xmldata ItemType:(DABuildingType) buidType
{
    NSArray*elementArry=[self getAllElement:xmldata];
    
    if (nil==elementArry||elementArry.count<1) {
        return nil;
    }
    NSArray *itemArr;
    switch (buidType) {
        case  BuildingType_Normal:
            itemArr=[self getGeneralBuilding:elementArry];
            if (itemArr) {
                return [itemArr objectAtIndex:0];
            }
            return nil;
            break;
        case BuildingType_Breeding:
            itemArr=[self getBreedBuilding:elementArry];
            if (itemArr) {
                return [itemArr objectAtIndex:0];
            }
            return nil;
            break;
        case BuildingType_Magic:
            itemArr=[self getMagicBuilding:elementArry];
            if (itemArr) {
                return [itemArr objectAtIndex:0];
            }
            return nil;
            break;   
        case BuildingType_Processing:
            itemArr=[self getProcessBuilding:elementArry];
            if (itemArr) {
                return [itemArr objectAtIndex:0];
            }
            return nil;
            break;
        default:
            return nil;
    }
}
+(id) parseGeneralXML:(NSData*)xmldata ItemType:(DAGeneralItemType) gtype
{
    CXMLElement *node=[self getRootElement:xmldata];
    if (nil==node) {
        return nil;
    }
    switch (gtype) {
        case GeneralItem_Eggs:
            return [self getEggItem:node];
            break;
        case GeneralItem_Products:
            return [self getProductItem:node];
            break;
        case  GeneralItem_Prop:
            return [self getPropItem:node];
            break;
        case GeneralItem_Vehicle:
            return [self getVeicleItem:node];
            break;    
        default:
            return nil;
            break;
    }
}

+(id) parsePoultryXML:(NSData*)xmldata
{ 
    CXMLElement *node=[self getRootElement:xmldata];
    if (nil==node) {
        return nil;
    }
    NSArray * attributes=[node attributes];
    if (nil==attributes||attributes.count<1) {
        return nil;
    }
    DAItemPoultryEntity*  obj=[[DAItemPoultryEntity alloc]init];

    for (CXMLElement *subElement in attributes) {
        
        NSString *value=[subElement stringValue];
        if (nil==value){
            continue;
        }
        if ([[subElement name]isEqualToString:@"sysName"]) {
            obj.sysName=value;
        }
        if ([[subElement name]isEqualToString:@"disName"]) {
            obj.disName=value;
        }
        if ([[subElement name]isEqualToString:@"buyprice"]) {
            obj.BuyPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"sellprice"]) {
            obj.SellPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"imagepath"]) {
            obj.imagePath=value;
        }
        if ([[subElement name]isEqualToString:@"size"]) {
            NSArray* sz=[value componentsSeparatedByString:@"#"];
            if (sz&&sz.count==2) {
                obj.nSizeX=[[sz objectAtIndex:0]intValue];
                obj.nSizeY=[[sz objectAtIndex:1]intValue];
            }
        }
        if ([[subElement name]isEqualToString:@"trandest"]) {
            obj.TransDestName=value;
        }
        if ([[subElement name]isEqualToString:@"transtime"]) {
            obj.TransNeedTime=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"khurt"]) {
            //生病，暂不考虑
        }
        if ([[subElement name]isEqualToString:@"states"]) {
            obj.HaveStates=value;
        }
        if ([[subElement name]isEqualToString:@"canlay"]) {
            obj.BCanlay=[value boolValue];
        }
        if ([[subElement name]isEqualToString:@"laytime"]) {
            obj.LayNeedTime=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"layname"]) {
            obj.LayName=value;
        }
        if ([[subElement name]isEqualToString:@"kfood"]) {
            obj.NeedFood=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"kwater"]) {
            obj.NeedWater=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"ksum"]) {
            obj.nLaySum=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"knum"]) {
            obj.nLayNum=[value intValue];
        }
        
    }
    
    if (obj.TransDestName==nil) {
        obj.BTrans=NO;
    }
    else{
        obj.BTrans=YES;
    }
    return [obj autorelease];
}

+(id) parseSpecialXML:(NSData*)xmldata
{
    CXMLElement *node=[self getRootElement:xmldata];
    if (nil==node) {
        return nil;
    }
    NSArray * attributes=[node attributes];
    if (nil==attributes||attributes.count<1) {
        return nil;
    }
    DASpecialItemEntity*  obj=[[DASpecialItemEntity alloc]init];
    
    for (CXMLElement *subElement in attributes) {
        
        NSString *value=[subElement stringValue];
        if (nil==value){
            continue;
        }
        if ([[subElement name]isEqualToString:@"sysName"]) {
            obj.sysName=value;
        }
        if ([[subElement name]isEqualToString:@"disName"]) {
            obj.disName=value;
        }
        if ([[subElement name]isEqualToString:@"money"]) {
            obj.nMoney=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"diamond"]) {
            obj.nDiamond=[value intValue];
        }
    }
    return [obj autorelease];
}

#pragma mark  private method


+(id) getRootElement:(NSData*)xmldata
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
    CXMLElement * node=[szNode objectAtIndex:0];
    return node;
}

+(NSArray*) getAllElement:(NSData*)xmldata
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


+(NSArray*) getGeneralBuilding:(NSArray*)elements
{

    NSMutableArray *arrItem=[[NSMutableArray alloc]init];
    
    for (CXMLElement * node  in elements) {
       
        NSArray * attributes=[node attributes];
        if (nil==attributes||attributes.count<1) {
            continue;
        }
         DABuildingEntity * obj=[[DABuildingEntity alloc]init];
        for (CXMLElement *subElement in attributes) {
            
            NSString *value=[subElement stringValue];
            if (nil==value){
                continue;
            }
            
            if ([[subElement name]isEqualToString:@"sysName"]) {
                obj.SysName=value;
            }
            else if([[subElement name]isEqualToString:@"disName"]) {
                obj.DisName=value;
            }
            else if([[subElement name]isEqualToString:@"btype"]) {
                obj.Buildtype=[DAItemTypeRelService GetBuildingType:value];
            }
            else if([[subElement name]isEqualToString:@"isFun"]) {
                obj.BNearRoad=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"isMagic"]) {
                obj.BMagic=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"canBuild"]) {
                obj.BCanSetup=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"needitem"]) {
                obj.upgradNeedItem=value;
            }
            else if([[subElement name]isEqualToString:@"canUpgrad"]) {
                obj.BCanUpgrade=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"blevel"]) {
                obj.nLevel=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"upgradPrice"]) {
                obj.nUpgradeNeedMoney=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"exp"]) {
                obj.nExp=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"candestroy"]) {
                obj.BCanDestroy=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"buildtime"]) {
                obj.nSetNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"size"]) {
                //[obj.nSize.
                NSArray* szStr=[value componentsSeparatedByString:@"#"];
                if (szStr!=nil &&szStr.count==2) {
                    obj.nSizeX=[[szStr objectAtIndex:0]intValue];
                    obj.nSizeY=[[szStr objectAtIndex:1]intValue];
                }
            }
            else if([[subElement name]isEqualToString:@"buildedpic"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buildingpath"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buyprice"]) {
                obj.nBuyPrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"getdestroy"]) {
                obj.nDestroyHavePrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destroyneedtime"]) {
                obj.nDestoryNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destorypc"]) {
                obj.DestroyImagePath=value;
            }
            
        }
        [arrItem addObject:obj];
        [obj release];
    }
   
   
    return [arrItem autorelease];
}
+(NSArray*) getMagicBuilding:(NSArray*)elements
{
    NSMutableArray *arrItem=[[NSMutableArray alloc]init ];
    for (CXMLElement * node in elements) {
        
        NSArray * attributes=[node attributes];
        if (nil==attributes||attributes.count<1) {
            continue;
        }
        DAMagicBuildingEntity * obj=[[DAMagicBuildingEntity alloc]init];
        for (CXMLElement *subElement in attributes) {
            
            NSString *value=[subElement stringValue];
            if (nil==value){
                continue;
            }
            if ([[subElement name]isEqualToString:@"sysName"]) {
                obj.SysName=value;
            }
            else if([[subElement name]isEqualToString:@"disName"]) {
                obj.DisName=value;
            }
            else if([[subElement name]isEqualToString:@"btype"]) {
                obj.Buildtype=[DAItemTypeRelService GetBuildingType:value];
            }
            else if([[subElement name]isEqualToString:@"isFun"]) {
                obj.BNearRoad=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"isMagic"]) {
                obj.BMagic=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"canBuild"]) {
                obj.BCanSetup=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"needitem"]) {
                obj.upgradNeedItem=value;
            }
            else if([[subElement name]isEqualToString:@"canUpgrad"]) {
                obj.BCanUpgrade=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"blevel"]) {
                obj.nLevel=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"upgradPrice"]) {
                obj.nUpgradeNeedMoney=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"exp"]) {
                obj.nExp=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"candestroy"]) {
                obj.BCanDestroy=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"buildtime"]) {
                obj.nSetNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"size"]) {
                //[obj.nSize.
                NSArray* szStr=[value componentsSeparatedByString:@"#"];
                if (szStr!=nil &&szStr.count==2) {
                    obj.nSizeX=[[szStr objectAtIndex:0]intValue];
                    obj.nSizeY=[[szStr objectAtIndex:1]intValue];
                }
            }
            else if([[subElement name]isEqualToString:@"buildedpic"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buildingpath"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buyprice"]) {
                obj.nBuyPrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"getdestroy"]) {
                obj.nDestroyHavePrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destroyneedtime"]) {
                obj.nDestoryNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destorypc"]) {
                obj.DestroyImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"mtype"])//影响类别，暂时不处理，只有对鸡舍的影响
            {
                
            }
            else if([[subElement name]isEqualToString:@"k"])
            {
                obj.magicInfo=value;
            }
            else if([[subElement name]isEqualToString:@"kitem"])
            {
                obj.HenHouseParam.kFeedItems=value;
            }
            else if([[subElement name]isEqualToString:@"kfood"])
            {
                obj.HenHouseParam.kFood=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"kwater"])
            {
                obj.HenHouseParam.kWater=[value intValue];
            }
            
        }
        [arrItem addObject:obj];
        [obj release];
    }
    
    return [arrItem autorelease];
}
+(NSArray*) getBreedBuilding:(NSArray*)elements
{
    NSMutableArray *arrItem=[[NSMutableArray alloc]init ];
    for (CXMLElement * node in elements) {
        NSArray * attributes=[node attributes];
        if (nil==attributes||attributes.count<1) {
            continue;
        }
         DABreedingBuildingEntity * obj=[[DABreedingBuildingEntity alloc]init];
        for (CXMLElement *subElement in attributes) {
            
            NSString *value=[subElement stringValue];
            if (nil==value){
                continue;
            }
            
            if ([[subElement name]isEqualToString:@"sysName"]) {
                obj.SysName=value;
            }
            else if([[subElement name]isEqualToString:@"disName"]) {
                obj.DisName=value;
            }
            else if([[subElement name]isEqualToString:@"btype"]) {
                obj.Buildtype=[DAItemTypeRelService GetBuildingType:value];
            }
            else if([[subElement name]isEqualToString:@"isFun"]) {
                obj.BNearRoad=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"isMagic"]) {
                obj.BMagic=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"canBuild"]) {
                obj.BCanSetup=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"needitem"]) {
                obj.upgradNeedItem=value;
            }
            else if([[subElement name]isEqualToString:@"canUpgrad"]) {
                obj.BCanUpgrade=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"blevel"]) {
                obj.nLevel=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"upgradPrice"]) {
                obj.nUpgradeNeedMoney=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"exp"]) {
                obj.nExp=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"candestroy"]) {
                obj.BCanDestroy=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"buildtime"]) {
                obj.nSetNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"size"]) {
                //[obj.nSize.
                NSArray* szStr=[value componentsSeparatedByString:@"#"];
                if (szStr!=nil &&szStr.count==2) {
                    obj.nSizeX=[[szStr objectAtIndex:0]intValue];
                    obj.nSizeY=[[szStr objectAtIndex:1]intValue];
                }
            }
            else if([[subElement name]isEqualToString:@"buildedpic"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buildingpath"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buyprice"]) {
                obj.nBuyPrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"getdestroy"]) {
                obj.nDestroyHavePrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destroyneedtime"]) {
                obj.nDestoryNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destorypc"]) {
                obj.DestroyImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"breedtype"]) {
                obj.CanBreedItem=value ;
            }
            else if([[subElement name]isEqualToString:@"breedNum"]) {
                obj.nFeedMax=[value intValue];
            }
        }
        [arrItem addObject:obj];
        [obj release];
    }
       
    return [arrItem autorelease];
}
+(NSArray*) getProcessBuilding:(NSArray*)elements
{
     NSMutableArray *arrItem=[[NSMutableArray alloc]init ];
    for (CXMLElement * node in elements) {
        NSArray * attributes=[node attributes];
        if (nil==attributes||attributes.count<1) {
            continue;
        }
        DAProcessingBuildingEntity * obj=[[DAProcessingBuildingEntity alloc]init];
        for (CXMLElement *subElement in attributes) {
            
            NSString *value=[subElement stringValue];
            if (nil==value){
                continue;
            }
            
            if ([[subElement name]isEqualToString:@"sysName"]) {
                obj.SysName=value;
            }
            else if([[subElement name]isEqualToString:@"disName"]) {
                obj.DisName=value;
            }
            else if([[subElement name]isEqualToString:@"btype"]) {
                obj.Buildtype=[DAItemTypeRelService GetBuildingType:value];
            }
            else if([[subElement name]isEqualToString:@"isFun"]) {
                obj.BNearRoad=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"isMagic"]) {
                obj.BMagic=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"canBuild"]) {
                obj.BCanSetup=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"needitem"]) {
                obj.upgradNeedItem=value;
            }
            else if([[subElement name]isEqualToString:@"canUpgrad"]) {
                obj.BCanUpgrade=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"blevel"]) {
                obj.nLevel=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"upgradPrice"]) {
                obj.nUpgradeNeedMoney=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"exp"]) {
                obj.nExp=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"candestroy"]) {
                obj.BCanDestroy=[value boolValue];
            }
            else if([[subElement name]isEqualToString:@"buildtime"]) {
                obj.nSetNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"size"]) {
                //[obj.nSize.
                NSArray* szStr=[value componentsSeparatedByString:@"#"];
                if (szStr!=nil &&szStr.count==2) {
                    obj.nSizeX=[[szStr objectAtIndex:0]intValue];
                    obj.nSizeY=[[szStr objectAtIndex:1]intValue];
                }
            }
            else if([[subElement name]isEqualToString:@"buildedpic"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buildingpath"]) {
                obj.BuildedImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"buyprice"]) {
                obj.nBuyPrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"getdestroy"]) {
                obj.nDestroyHavePrice=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destroyneedtime"]) {
                obj.nDestoryNeedTime=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"destorypc"]) {
                obj.DestroyImagePath=value;
            }
            else if([[subElement name]isEqualToString:@"kproduct"]) {
                obj.ProParam=[value intValue];
            }
            else if([[subElement name]isEqualToString:@"items"]) {
                [obj.CanProItemsArr removeAllObjects];
                NSArray * items=[value componentsSeparatedByString:@"#"];
                if (items&&items.count>0) {
                    for (int i=0; i<items.count; ++i) {
                        [obj.CanProItemsArr addObject:[items objectAtIndex:i]];
                    }
                }
            }
            
        }
        [arrItem addObject:obj];
        [obj release];
    }
    
    
    return [arrItem autorelease];
}
#pragma mark 一般类别：蛋类  加工类 道具类 交通工具类
+(id) getEggItem:(CXMLElement*)node
{
    NSArray * attributes=[node attributes];
    if (nil==attributes||attributes.count<1) {
        return nil;
    }
    
    DAItemEggs * obj=[[DAItemEggs alloc]init];
    
    for (CXMLElement *subElement in attributes) {
        
        NSString *value=[subElement stringValue];
        if (nil==value){
            continue;
        }
        if ([[subElement name]isEqualToString:@"sysName"]) {
            obj.sysName=value;
        }
        if ([[subElement name]isEqualToString:@"disName"]) {
            obj.disName=value;
        }
        if ([[subElement name]isEqualToString:@"cansell"]) {
            obj.CanSell=[value boolValue];
        }
        if ([[subElement name]isEqualToString:@"price"]) {
            obj.nSellPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"image"]) {
            obj.imagePath=value;
        }
        if ([[subElement name]isEqualToString:@"exp"]) {
            obj.nExp=[value intValue];
        }
    }

    return [obj autorelease];
}
+(id) getProductItem:(CXMLElement*)node
{
    NSArray * attributes=[node attributes];
    if (nil==attributes||attributes.count<1) {
        return nil;
    }
    
    DAItemProducts * obj=[[DAItemProducts alloc]init];
    
    for (CXMLElement *subElement in attributes) {
        
        NSString *value=[subElement stringValue];
        if (nil==value){
            continue;
        }
        if ([[subElement name]isEqualToString:@"sysName"]) {
            obj.sysName=value;
        }
        if ([[subElement name]isEqualToString:@"disName"]) {
            obj.disName=value;
        }
        if ([[subElement name]isEqualToString:@"cansell"]) {
            obj.CanSell=[value boolValue];
        }
        if ([[subElement name]isEqualToString:@"price"]) {
            obj.nSellPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"image"]) {
            obj.imagePath=value;
        }
    }
    
    return [obj autorelease];}
+(id) getPropItem:(CXMLElement*)node
{
    NSArray * attributes=[node attributes];
    if (nil==attributes||attributes.count<1) {
        return nil;
    }
    
    DAItemProp * obj=[[DAItemProp alloc]init];
    
    
    for (CXMLElement *subElement in attributes) {
        
        NSString *value=[subElement stringValue];
        if (nil==value){
            continue;
        }
        if ([[subElement name]isEqualToString:@"sysName"]) {
            obj.sysName=value;
        }
        if ([[subElement name]isEqualToString:@"disName"]) {
            obj.disName=value;
        }
        if ([[subElement name]isEqualToString:@"canbuy"]) {
            obj.CanBuy=[value boolValue];
        }
        if ([[subElement name]isEqualToString:@"bprice"]) {
            obj.nBuyPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"cansell"]) {
            obj.CanSell=[value boolValue];
        }
        if ([[subElement name]isEqualToString:@"sprice"]) {
            obj.nSellPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"imagepath"]) {
            obj.imagePath=value;
        }
    }

    return [obj autorelease];
}
+(id) getVeicleItem:(CXMLElement*)node
{
    NSArray * attributes=[node attributes];
    if (nil==attributes||attributes.count<1) {
        return nil;
    }
    
    DAItemVehicle * obj=[[DAItemVehicle alloc]init];
    for (CXMLElement *subElement in attributes) {
        
        NSString *value=[subElement stringValue];
        if (nil==value){
            continue;
        }
        if ([[subElement name]isEqualToString:@"sysName"]) {
            obj.sysName=value;
        }
        if ([[subElement name]isEqualToString:@"disName"]) {
            obj.disName=value;
        }
        if ([[subElement name]isEqualToString:@"buyprice"]) {
            obj.nBuyPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"cansell"]) {
            obj.CanSell=[value boolValue];
        }
        if ([[subElement name]isEqualToString:@"image"]) {
            obj.imagePath=value;
        }
        if ([[subElement name]isEqualToString:@"speed"]) {
            obj.nSpeed=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"capacity"]) {
            obj.nCapacity=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"bags"]) {
            obj.nBags=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"cargo"]) {
            obj.nCargo=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"costmoney"]) {
            obj.nNeedPrice=[value intValue];
        }
        if ([[subElement name]isEqualToString:@"costtime"]) {
            obj.nNeedTime=[value intValue];
        }
    }
    
    
    return [obj autorelease];
}
-(void) dealloc
{
    [super dealloc];
}
@end
