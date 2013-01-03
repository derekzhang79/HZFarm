//
//  DAPFactoryService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAPFactoryService.h"
#import "DAWorldMapService.h"
#import "sqlliteService.h"
#import "TouchXML.h"

@implementation DAPFactoryService
@synthesize factoryData;
@synthesize allProductItems;

static DAPFactoryService *sharePFactoryService_;

+(DAPFactoryService*) sharePFactoryService
{
    if (nil==sharePFactoryService_) {
        sharePFactoryService_=[[DAPFactoryService alloc]init];
        [sharePFactoryService_ privateInit];
    }
    return sharePFactoryService_;
}
+(id) alloc
{
    NSAssert(sharePFactoryService_==nil,  @"试图创建单利服务，DAPFactoryService");
    return [super alloc];
}
-(void)RefreshFactoryData
{
    //刷新可加工产品
    NSData *productXmlData=[[sqlliteService sharSqlliteservice]SelItemsCanProduct];
    if (productXmlData) {
        CXMLDocument *pDoc=[[CXMLDocument alloc]initWithData:productXmlData options:0 error:nil];
        if (pDoc) {
            CXMLElement *proot=[pDoc rootElement];
            if (proot) {
                NSArray* szNode=[proot elementsForName:@"Node"];
                if (szNode) {
                    NSMutableArray *szProduct=[[NSMutableArray alloc]init ];
                    
                    for (CXMLElement *subNode in szNode) {
                        DAProductItemInfo *pInfo=[[DAProductItemInfo alloc]init];
                        pInfo.sysName=[[subNode attributeForName:@"sysName"]stringValue];
                        pInfo.kProduct=[[[subNode attributeForName:@"kproduct"]stringValue]floatValue];
                        pInfo.itemType=[[subNode attributeForName:@"itemtype"]stringValue];
                        [szProduct addObject:pInfo];
                        [pInfo release];
                    }
                    self.allProductItems=szProduct;
                    [szProduct release];
                }
            }
            [pDoc release];
        }
    }
    //获得世界中所有加工厂ID
    NSArray * szFactoryID=[[DAWorldMapService shareWorldMapService]GetAllBuildingIDByType:BuildingType_Processing];
    if (nil==szFactoryID||szFactoryID.count<1) {
        return;
    }
    [factoryData.ItemsInfactory removeAllObjects];
    for(NSString *subID in szFactoryID)
    {
        NSData * xmldata=[[sqlliteService sharSqlliteservice]SelectAllItemFromPFactoryByID:subID];
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
        for (CXMLElement *subNode in szNode) {
            DAItemInFactory *item=[[DAItemInFactory alloc]init];
            item.tID=[[subNode attributeForName:@"tID"]stringValue];
            item.factoryID=[[subNode attributeForName:@"bID"]stringValue];
            item.sysName=[[subNode attributeForName:@"itemName"]stringValue];
            item.startTime=[[subNode attributeForName:@"bTime"]stringValue];
            item.iNum=[[[subNode attributeForName:@"itemNum"]stringValue]intValue];
            item.needTime=6;//加工需要时间
            [factoryData.ItemsInfactory addObject:item];
            [item release];
        }
        [doc release];
    }
}
-(NSArray*) GetDataFromFactoryID:(NSString*) factoryID
{
    return [factoryData GetDataFromFactoryID:factoryID];
}
-(void) OnItemAdd:(DAItemInFactory*)item
{
    [factoryData.ItemsInfactory addObject:item];
    
}
//获得物品的加工系数
-(float) getKpramByItemName:(NSString*)iName
{
    if (self.allProductItems==nil) {
        return 0.0;
    }
    for (DAProductItemInfo *subItem in self.allProductItems) {
        if ([iName isEqualToString:subItem.sysName]) {
            return subItem.kProduct;
        }
    }
    return 0.0;
}

//获得加工品类别名字
-(NSString*) getProductItemTypeNameByItem:(NSString*)iName;
{
    if (self.allProductItems==nil) {
        return nil;
    }
    for (DAProductItemInfo *subItem in self.allProductItems) {
        if ([iName isEqualToString:subItem.sysName]) {
            return subItem.itemType;
        }
    }
    return nil;
}
-(void)dealloc
{
    self.factoryData=nil;
    self.allProductItems=nil;
    [super dealloc];
}
-(void)privateInit
{
    factoryData=[[DAPFactoryDataEntity alloc]init];
    
}
@end
