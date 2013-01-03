//
//  DAWorldMapService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAWorldMapService.h"
#import "DAHeader.h"
#import "DAItemService.h"
#import "sqlliteService.h"
#import "DAPlayerService.h"
#import "DAItemTypeRelService.h"
#import "TouchXML.h"

@implementation DAWorldMapService

@synthesize worldMap;

static DAWorldMapService * shareWorldMapService_;
+(DAWorldMapService*)shareWorldMapService
{
    if (!shareWorldMapService_)
		shareWorldMapService_ = [[self alloc] init];
    
	return shareWorldMapService_;
}
+(id)alloc
{
	NSAssert(shareWorldMapService_ == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}
-(void) RefreshWorldMap
{
    self.worldMap=nil;
    worldMap=[[DAWorldMapEntity alloc]init];
    NSData *xmlData=[[sqlliteService sharSqlliteservice]SelectAllBuildingFromWorld:[[[DAPlayerService sharePlayerService]playerEntity] ID]];
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
        NSString*sysName=[[subNode attributeForName:@"itemName"]stringValue];
        NSString*strtype=[[subNode attributeForName:@"bType"]stringValue];
        DABuildingType btype=[DAItemTypeRelService GetBuildingType:strtype];
        //由物品服务查找物品
        DABuildingEntity *item=[[DAItemService shareService]GetBuildingItemByName:sysName BuildingType:btype];
        DABuildingEntity  *bObj;
        
        switch (btype) {
            case BuildingType_Breeding:
            {
                DABreedingBuildingEntity *bObj1=[[DABreedingBuildingEntity alloc]init ];
                DABreedingBuildingEntity *breedObj=(DABreedingBuildingEntity*) item;
                bObj1.ID = item.ID;
                bObj1.SysName = item.SysName;
                bObj1.DisName = item.DisName;
                bObj1.BNearRoad = item.BNearRoad;
                bObj1.BMagic = item.BMagic;
                bObj1.BCanSetup = item.BCanSetup;
                bObj1.BCanBuy = item.BCanBuy;
                bObj1.BCanUpgrade = item.BCanUpgrade;
                bObj1.nDestroyHavePrice = item.nDestroyHavePrice;
                bObj1.nBuyPrice = item.nBuyPrice;
                bObj1.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                bObj1.nExp = item.nExp;
                bObj1.BCanDestroy = item.BCanDestroy;
                bObj1.BCanMove = item.BCanMove;
                bObj1.nSetNeedTime = item.nSetNeedTime;
                bObj1.nSizeX = item.nSizeX;
                bObj1.nSizeY = item.nSizeY;
                bObj1.DestroyImagePath = item.DestroyImagePath;
                bObj1.BuildingImagePath = item.BuildingImagePath;
                bObj1.BuildedImagePath = item.BuildedImagePath;
                bObj1.nDestoryNeedTime = item.nDestoryNeedTime;
                bObj1.Buildtype = item.Buildtype;
                bObj1.nLevel = item.nLevel;
                bObj1.upgradNeedItem = item.upgradNeedItem;
                bObj1.nPosX = item.nPosX;
                bObj1.nPosY = item.nPosY;
                bObj1.BuildTime = item.BuildTime;
                bObj1.nTag = item.nTag;
                bObj1.nZindex = item.nZindex;
                bObj1.BTrans = item.BTrans;
                bObj1.CanBreedItem=breedObj.CanBreedItem;
                bObj1.nFeedMax=breedObj.nFeedMax;
                bObj=bObj1;
            }
                break;
                
                case BuildingType_Processing:
            {
                DAProcessingBuildingEntity *tempDest=[[DAProcessingBuildingEntity alloc]init];
                DAProcessingBuildingEntity*tempSrc=(DAProcessingBuildingEntity*)item;
                
                tempDest.ID = item.ID;
                tempDest.SysName = item.SysName;
                tempDest.DisName = item.DisName;
                tempDest.BNearRoad = item.BNearRoad;
                tempDest.BMagic = item.BMagic;
                tempDest.BCanSetup = item.BCanSetup;
                tempDest.BCanBuy = item.BCanBuy;
                tempDest.BCanUpgrade = item.BCanUpgrade;
                tempDest.nDestroyHavePrice = item.nDestroyHavePrice;
                tempDest.nBuyPrice = item.nBuyPrice;
                tempDest.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                tempDest.nExp = item.nExp;
                tempDest.BCanDestroy = item.BCanDestroy;
                tempDest.BCanMove = item.BCanMove;
                tempDest.nSetNeedTime = item.nSetNeedTime;
                tempDest.nSizeX = item.nSizeX;
                tempDest.nSizeY = item.nSizeY;
                tempDest.DestroyImagePath = item.DestroyImagePath;
                tempDest.BuildingImagePath = item.BuildingImagePath;
                tempDest.BuildedImagePath = item.BuildedImagePath;
                tempDest.nDestoryNeedTime = item.nDestoryNeedTime;
                tempDest.Buildtype = item.Buildtype;
                tempDest.nLevel = item.nLevel;
                tempDest.upgradNeedItem = item.upgradNeedItem;
                tempDest.nPosX = item.nPosX;
                tempDest.nPosY = item.nPosY;
                tempDest.BuildTime = item.BuildTime;
                tempDest.nTag = item.nTag;
                tempDest.nZindex = item.nZindex;
                tempDest.BTrans = item.BTrans;
                
                tempDest.ProParam=tempSrc.ProParam;
                tempDest.CanProItemsArr=tempSrc.CanProItemsArr;
                bObj=tempDest;
            }
                break;
                
            case BuildingType_Magic:
            {
                DAMagicBuildingEntity *tempDest=[[DAMagicBuildingEntity alloc]init];
                DAMagicBuildingEntity*tempSrc=(DAMagicBuildingEntity*)item;
                tempDest.ID = item.ID;
                tempDest.SysName = item.SysName;
                tempDest.DisName = item.DisName;
                tempDest.BNearRoad = item.BNearRoad;
                tempDest.BMagic = item.BMagic;
                tempDest.BCanSetup = item.BCanSetup;
                tempDest.BCanBuy = item.BCanBuy;
                tempDest.BCanUpgrade = item.BCanUpgrade;
                tempDest.nDestroyHavePrice = item.nDestroyHavePrice;
                tempDest.nBuyPrice = item.nBuyPrice;
                tempDest.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                tempDest.nExp = item.nExp;
                tempDest.BCanDestroy = item.BCanDestroy;
                tempDest.BCanMove = item.BCanMove;
                tempDest.nSetNeedTime = item.nSetNeedTime;
                tempDest.nSizeX = item.nSizeX;
                tempDest.nSizeY = item.nSizeY;
                tempDest.DestroyImagePath = item.DestroyImagePath;
                tempDest.BuildingImagePath = item.BuildingImagePath;
                tempDest.BuildedImagePath = item.BuildedImagePath;
                tempDest.nDestoryNeedTime = item.nDestoryNeedTime;
                tempDest.Buildtype = item.Buildtype;
                tempDest.nLevel = item.nLevel;
                tempDest.upgradNeedItem = item.upgradNeedItem;
                tempDest.nPosX = item.nPosX;
                tempDest.nPosY = item.nPosY;
                tempDest.BuildTime = item.BuildTime;
                tempDest.nTag = item.nTag;
                tempDest.nZindex = item.nZindex;
                tempDest.BTrans = item.BTrans;
                
                tempDest.magicInfo=tempSrc.magicInfo;
                tempDest.HenHouseParam=tempSrc.HenHouseParam;
                bObj=tempDest;
            }
                break;
                
            case BuildingType_Normal:
                bObj=[[DABuildingEntity alloc]init];
        
                bObj.ID = item.ID;
                bObj.SysName = item.SysName;
                bObj.DisName = item.DisName;
                bObj.BNearRoad = item.BNearRoad;
                bObj.BMagic = item.BMagic;
                bObj.BCanSetup = item.BCanSetup;
                bObj.BCanBuy = item.BCanBuy;
                bObj.BCanUpgrade = item.BCanUpgrade;
                bObj.nDestroyHavePrice = item.nDestroyHavePrice;
                bObj.nBuyPrice = item.nBuyPrice;
                bObj.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                bObj.nExp = item.nExp;
                bObj.BCanDestroy = item.BCanDestroy;
                bObj.BCanMove = item.BCanMove;
                bObj.nSetNeedTime = item.nSetNeedTime;
                bObj.nSizeX = item.nSizeX;
                bObj.nSizeY = item.nSizeY;
                bObj.DestroyImagePath = item.DestroyImagePath;
                bObj.BuildingImagePath = item.BuildingImagePath;
                bObj.BuildedImagePath = item.BuildedImagePath;
                bObj.nDestoryNeedTime = item.nDestoryNeedTime;
                bObj.Buildtype = item.Buildtype;
                bObj.nLevel = item.nLevel;
                bObj.upgradNeedItem = item.upgradNeedItem;
                bObj.nPosX = item.nPosX;
                bObj.nPosY = item.nPosY;
                bObj.BuildTime = item.BuildTime;
                bObj.nTag = item.nTag;
                bObj.nZindex = item.nZindex;
                bObj.BTrans = item.BTrans;
                break;
                
            default:
                break;
        }
        
        if (bObj) {
            NSString *strID=[[subNode attributeForName:@"bID"]stringValue];
            NSString *strX=[[subNode attributeForName:@"posx"]stringValue];
            NSString *strY=[[subNode attributeForName:@"posy"]stringValue];
            NSString *strTime=[[subNode attributeForName:@"bTime"]stringValue];
            NSString *strTag=[[subNode attributeForName:@"tag"]stringValue];
            NSString *strZIndex=[[subNode attributeForName:@"zindex"]stringValue];
            NSString *strBtrans=[[subNode attributeForName:@"btrans"]stringValue];
            bObj.ID=strID;
            bObj.nPosX=[strX intValue];
            bObj.nPosY=[strY intValue];
            bObj.BuildTime=strTime;
            bObj.Buildtype=btype;
            bObj.nTag=[strTag intValue];
            bObj.nZindex=[strZIndex intValue];
            bObj.BTrans=[strBtrans boolValue];
            
            [[worldMap itemArr]addObject:bObj];
            [bObj release];
        }
    }
    //NSLog(@"%@",worldMap.itemArr);///
    
    [doc release];
    
}
-(id) getBuildingByID:(NSString*)bID
{
    for(DABuildingEntity *subBuilding in [self.worldMap itemArr])
    {
        if ([bID isEqualToString:subBuilding.ID]) {
            return subBuilding;
        }
    }
    return nil;
}
-(id) getBuildingByPosX:(int) nx PosY:(int) ny
{
    for(DABuildingEntity *subBuilding in [self.worldMap itemArr])
    {
        if (nx==subBuilding.nPosX&&ny==subBuilding.nPosY) {
            return subBuilding;
        }
    }
    return nil;
}
//不影响数据库操作，属于数据库的缓存
-(void) AddBuildingByBID:(NSString *) bID ItemName:(NSString *)iName ItemType:(DABuildingType)iType posX:(int)nx posY:(int)ny BuildTime:(NSString*) bTime Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans
{
    
    DABuildingEntity *item=[[DAItemService shareService]GetBuildingItemByName:iName BuildingType:iType];
    
    if (item) {
        DABuildingEntity  *bObj;
        switch (iType) {
            case BuildingType_Breeding:
            {
                DABreedingBuildingEntity *bObj1=[[DABreedingBuildingEntity alloc]init ];
                DABreedingBuildingEntity *breedObj=(DABreedingBuildingEntity*) item;
                bObj1.ID = item.ID;
                bObj1.SysName = item.SysName;
                bObj1.DisName = item.DisName;
                bObj1.BNearRoad = item.BNearRoad;
                bObj1.BMagic = item.BMagic;
                bObj1.BCanSetup = item.BCanSetup;
                bObj1.BCanBuy = item.BCanBuy;
                bObj1.BCanUpgrade = item.BCanUpgrade;
                bObj1.nDestroyHavePrice = item.nDestroyHavePrice;
                bObj1.nBuyPrice = item.nBuyPrice;
                bObj1.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                bObj1.nExp = item.nExp;
                bObj1.BCanDestroy = item.BCanDestroy;
                bObj1.BCanMove = item.BCanMove;
                bObj1.nSetNeedTime = item.nSetNeedTime;
                bObj1.nSizeX = item.nSizeX;
                bObj1.nSizeY = item.nSizeY;
                bObj1.DestroyImagePath = item.DestroyImagePath;
                bObj1.BuildingImagePath = item.BuildingImagePath;
                bObj1.BuildedImagePath = item.BuildedImagePath;
                bObj1.nDestoryNeedTime = item.nDestoryNeedTime;
                bObj1.Buildtype = item.Buildtype;
                bObj1.nLevel = item.nLevel;
                bObj1.upgradNeedItem = item.upgradNeedItem;
                bObj1.nPosX = item.nPosX;
                bObj1.nPosY = item.nPosY;
                bObj1.BuildTime = item.BuildTime;
                bObj1.nTag = item.nTag;
                bObj1.nZindex = item.nZindex;
                bObj1.BTrans = item.BTrans;
                bObj1.CanBreedItem=breedObj.CanBreedItem;
                bObj1.nFeedMax=breedObj.nFeedMax;
                bObj=bObj1;
            }
                break;
                
            case BuildingType_Processing:
            {
                DAProcessingBuildingEntity *tempDest=[[DAProcessingBuildingEntity alloc]init];
                DAProcessingBuildingEntity*tempSrc=(DAProcessingBuildingEntity*)item;
                
                tempDest.ID = item.ID;
                tempDest.SysName = item.SysName;
                tempDest.DisName = item.DisName;
                tempDest.BNearRoad = item.BNearRoad;
                tempDest.BMagic = item.BMagic;
                tempDest.BCanSetup = item.BCanSetup;
                tempDest.BCanBuy = item.BCanBuy;
                tempDest.BCanUpgrade = item.BCanUpgrade;
                tempDest.nDestroyHavePrice = item.nDestroyHavePrice;
                tempDest.nBuyPrice = item.nBuyPrice;
                tempDest.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                tempDest.nExp = item.nExp;
                tempDest.BCanDestroy = item.BCanDestroy;
                tempDest.BCanMove = item.BCanMove;
                tempDest.nSetNeedTime = item.nSetNeedTime;
                tempDest.nSizeX = item.nSizeX;
                tempDest.nSizeY = item.nSizeY;
                tempDest.DestroyImagePath = item.DestroyImagePath;
                tempDest.BuildingImagePath = item.BuildingImagePath;
                tempDest.BuildedImagePath = item.BuildedImagePath;
                tempDest.nDestoryNeedTime = item.nDestoryNeedTime;
                tempDest.Buildtype = item.Buildtype;
                tempDest.nLevel = item.nLevel;
                tempDest.upgradNeedItem = item.upgradNeedItem;
                tempDest.nPosX = item.nPosX;
                tempDest.nPosY = item.nPosY;
                tempDest.BuildTime = item.BuildTime;
                tempDest.nTag = item.nTag;
                tempDest.nZindex = item.nZindex;
                tempDest.BTrans = item.BTrans;
                
                tempDest.ProParam=tempSrc.ProParam;
                tempDest.CanProItemsArr=tempSrc.CanProItemsArr;
                bObj=tempDest;
            }
                break;
                
            case BuildingType_Magic:
            {
                DAMagicBuildingEntity *tempDest=[[DAMagicBuildingEntity alloc]init];
                DAMagicBuildingEntity*tempSrc=(DAMagicBuildingEntity*)item;
                tempDest.ID = item.ID;
                tempDest.SysName = item.SysName;
                tempDest.DisName = item.DisName;
                tempDest.BNearRoad = item.BNearRoad;
                tempDest.BMagic = item.BMagic;
                tempDest.BCanSetup = item.BCanSetup;
                tempDest.BCanBuy = item.BCanBuy;
                tempDest.BCanUpgrade = item.BCanUpgrade;
                tempDest.nDestroyHavePrice = item.nDestroyHavePrice;
                tempDest.nBuyPrice = item.nBuyPrice;
                tempDest.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                tempDest.nExp = item.nExp;
                tempDest.BCanDestroy = item.BCanDestroy;
                tempDest.BCanMove = item.BCanMove;
                tempDest.nSetNeedTime = item.nSetNeedTime;
                tempDest.nSizeX = item.nSizeX;
                tempDest.nSizeY = item.nSizeY;
                tempDest.DestroyImagePath = item.DestroyImagePath;
                tempDest.BuildingImagePath = item.BuildingImagePath;
                tempDest.BuildedImagePath = item.BuildedImagePath;
                tempDest.nDestoryNeedTime = item.nDestoryNeedTime;
                tempDest.Buildtype = item.Buildtype;
                tempDest.nLevel = item.nLevel;
                tempDest.upgradNeedItem = item.upgradNeedItem;
                tempDest.nPosX = item.nPosX;
                tempDest.nPosY = item.nPosY;
                tempDest.BuildTime = item.BuildTime;
                tempDest.nTag = item.nTag;
                tempDest.nZindex = item.nZindex;
                tempDest.BTrans = item.BTrans;
                
                tempDest.magicInfo=tempSrc.magicInfo;
                tempDest.HenHouseParam=tempSrc.HenHouseParam;
                bObj=tempDest;
            }
                break;
                
            case BuildingType_Normal:
                bObj=[[DABuildingEntity alloc]init];
                
                bObj.ID = item.ID;
                bObj.SysName = item.SysName;
                bObj.DisName = item.DisName;
                bObj.BNearRoad = item.BNearRoad;
                bObj.BMagic = item.BMagic;
                bObj.BCanSetup = item.BCanSetup;
                bObj.BCanBuy = item.BCanBuy;
                bObj.BCanUpgrade = item.BCanUpgrade;
                bObj.nDestroyHavePrice = item.nDestroyHavePrice;
                bObj.nBuyPrice = item.nBuyPrice;
                bObj.nUpgradeNeedMoney = item.nUpgradeNeedMoney;
                bObj.nExp = item.nExp;
                bObj.BCanDestroy = item.BCanDestroy;
                bObj.BCanMove = item.BCanMove;
                bObj.nSetNeedTime = item.nSetNeedTime;
                bObj.nSizeX = item.nSizeX;
                bObj.nSizeY = item.nSizeY;
                bObj.DestroyImagePath = item.DestroyImagePath;
                bObj.BuildingImagePath = item.BuildingImagePath;
                bObj.BuildedImagePath = item.BuildedImagePath;
                bObj.nDestoryNeedTime = item.nDestoryNeedTime;
                bObj.Buildtype = item.Buildtype;
                bObj.nLevel = item.nLevel;
                bObj.upgradNeedItem = item.upgradNeedItem;
                bObj.nPosX = item.nPosX;
                bObj.nPosY = item.nPosY;
                bObj.BuildTime = item.BuildTime;
                bObj.nTag = item.nTag;
                bObj.nZindex = item.nZindex;
                bObj.BTrans = item.BTrans;
                break;
                
            default:
                break;
        }
        
        bObj.ID=bID;
        bObj.nPosX=nx;
        bObj.nPosY=ny;
        bObj.BuildTime=bTime;
        bObj.nTag=tag;
        bObj.nZindex=z;
        bObj.BTrans=btans;
        bObj.Buildtype=iType;
        
        [[worldMap itemArr]addObject:bObj];
        [bObj release];
    }
}
-(void) DeleteBuildingByBID:(NSString*)bID
{
   
    for ( DABuildingEntity *item in worldMap.itemArr) {
        if ([bID isEqualToString:item.ID]) {
            [worldMap.itemArr removeObject:item];
            break;
        }
    }
}
-(NSArray*) GetAllBuildingIDByType:(DABuildingType) buildingType
{
    NSMutableArray* itemIDArray=[[NSMutableArray alloc]init];
    //NSLog(@"%@",worldMap.itemArr);
    for (DABuildingEntity * subItem in self.worldMap.itemArr) {
        if (subItem.Buildtype==buildingType) {
            [itemIDArray addObject:subItem.ID];
            //NSLog(@"%@",subItem.ID);

        }
    }
     // NSLog(@"count   %d",itemIDArray.count);
    return [itemIDArray autorelease] ;
  
}
-(void) dealloc
{
    self.worldMap=nil;
    [super dealloc];
}
@end
