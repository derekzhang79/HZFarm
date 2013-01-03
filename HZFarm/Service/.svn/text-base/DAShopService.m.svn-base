//
//  DAShopService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAShopService.h"
#import "sqlliteService.h"
#import "TouchXML.h"
#import "DAItemTypeRelService.h"

@implementation DAShopService
@synthesize shopData;

static DAShopService * shareShopService_;
+(DAShopService *) shareShopService
{
    if (nil==shareShopService_) {
        shareShopService_=[[DAShopService alloc]init];
    }
    return  shareShopService_;
}
+(id)alloc
{
	NSAssert(shareShopService_ == nil, @"Attempted to allocate a second instance of a DAShopService singleton.");
	return [super alloc];
}
-(void) RefreshShopData
{
    if (shopData) {
        [shopData release];
        shopData=nil;
    }
    shopData=[[DAShopDataEntity alloc]init];
    NSData * xmldata=[[sqlliteService sharSqlliteservice] SelShopData];
    
    CXMLDocument * doc=[[CXMLDocument alloc]initWithData:xmldata options:0 error:nil];
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
    NSMutableArray * propArray=[[NSMutableArray alloc]init];
    NSMutableArray * vehicleArray=[[NSMutableArray alloc]init];
    NSMutableArray * speicalArray=[[NSMutableArray alloc]init];
    
    NSString *sysName=nil;
    NSString *itemType=nil;
    for (CXMLElement * subNode in szNode) {
        sysName=[[subNode attributeForName:@"sysName"] stringValue];
        itemType=[[subNode attributeForName:@"itemtype"] stringValue];
        if (GeneralItem_Prop==[DAItemTypeRelService GetGetneralType:itemType]) {
            //道具类
            [propArray addObject:sysName];
        }
        else if(GeneralItem_Vehicle==[DAItemTypeRelService GetGetneralType:itemType])
        {
            [vehicleArray addObject:sysName];
        }
        else if(ItemType_Special==[DAItemTypeRelService GetItemType:itemType])
        {
            [speicalArray addObject:sysName];
        }
    }
    shopData.ItemPropArr=propArray;
    [propArray release];
    shopData.ItemSpecialArr=speicalArray;
    [speicalArray release];
    shopData.ItemVehicleArr=vehicleArray;
    [vehicleArray release];
    [doc release];
    
}
-(void) dealloc
{
    if (shopData) {
        [shopData release];
        shopData=nil;
    }
    [super dealloc];
}
@end
