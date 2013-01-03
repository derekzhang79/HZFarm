//
//  DAPlayerService.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAPlayerService.h"
#import "sqlliteService.h"
#import "DAPlayerParseXml.h"
#import "DateTool.h"
#import "DAItemService.h"
#import "IDCreate.h"
#import "DAWorldMapService.h"
#import "DAHenHousesDataService.h"
#import "DAWareHouseService.h"
#import "DAHenHousesDataService.h"
#import "DAItemTypeRelService.h"
#import "DAItemParseXml.h"


@implementation DAPlayerService

#pragma mark Player  属性
@synthesize playerEntity;
@synthesize curPlayerName;

#pragma mark 玩家服务 - init
//single instance
static DAPlayerService *sharePlayerService_ = nil;

+ (DAPlayerService *)sharePlayerService
{
	if (!sharePlayerService_)
		sharePlayerService_ = [[self alloc] init];
    
	return sharePlayerService_;
}

+(id)alloc
{
	NSAssert(sharePlayerService_ == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}
//获得所有玩家用户
-(NSArray*)GetAllPlayerName
{
    return [DAPlayerParseXml getAllPlayerName];
}
-(DAState*) AddPlayer:(NSString*)playerName
{
    DAState* result=[[DAState alloc]init];
    BOOL bhave=[[sqlliteService sharSqlliteservice]HavePlayerByName:playerName];
    if (bhave) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"已经存在用户%@",playerName];
    }
    else
    {
        // chushi 1000 money
        BOOL bSuc=[[sqlliteService sharSqlliteservice]AddPlayerByName:playerName ID:playerName RegTime:[DateTool Now] Exp:0 Level:1 LastLeave:[DateTool Now] Money:5000 Diamond:0 ] ;
        if (!bSuc) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"添加玩家数据失败"];
        }
        else
            result.bErr=NO;
    }
    self.curPlayerName=playerName;
    return [result autorelease];
}
-(DAState*) DeletePlayer:(NSString*)playerName
{
    DAState* result=[[DAState alloc]init];
    //BOOL test=[[sqlliteService sharSqlliteservice]HavePlayerByName:playerName];
    BOOL bsuc=[[sqlliteService sharSqlliteservice]DeletePlayerByName:playerName];
    if (bsuc) {
        result.bErr=NO;
    }
    else {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"删除失败 "];
    }
    return [result autorelease];
}
//刷新玩家数据
- (void)RefeshPlayerData
{
    NSData * uData=[[sqlliteService sharSqlliteservice]SelectUserByName:self.curPlayerName];
    if (nil==uData) {
        NSLog(@"zhao bu dao wanjia");
        return;
    }
    self.playerEntity=[DAPlayerParseXml getPlayerInfo:uData];
}
//修改玩家离开时间
-(DAState*) SetPlayerLeavtime:(NSString*)ltime
{
    DAState *result=[[DAState alloc]init];
    BOOL bSuc=[[sqlliteService sharSqlliteservice]UpdatePlayerSetLevel:-1 Experience:-1 Lastleavetime:ltime Money:-1 Diamond:-1 WithUID:[self.playerEntity ID]] ;
    
    if (bSuc) {
        playerEntity.lastLeave=ltime;
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"修改玩家离开时间失败%@",ltime];
    }
    return [result autorelease];
}

//直接增加经验
-(DAState*) DirectAddExperience:(int) nexp{
    DAState * result=[[DAState alloc]init];
    int newexp=nexp+playerEntity.nExp;
    BOOL bSuc=[[sqlliteService sharSqlliteservice]UpdatePlayerSetLevel:-1 Experience:newexp Lastleavetime:nil Money:-1 Diamond:-1 WithUID:[self.playerEntity ID]];
    if (bSuc) {
        playerEntity.nExp=newexp;
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"增加经验失败"];
    }
    return [result autorelease];
}

//直接增加虚拟货币
-(DAState*) DirectAddMoney:(int) nMoney Diamond:(int) nDia{
    DAState * result=[[DAState alloc]init];
    int newMoney=nMoney+playerEntity.nMoney;
    int newDiamond=nDia+playerEntity.nDiamond;
    BOOL bSuc=[[sqlliteService sharSqlliteservice]UpdatePlayerSetLevel:-1 Experience:-1 Lastleavetime:nil Money:newMoney Diamond:newDiamond WithUID:[self.playerEntity ID]];
    if (bSuc) {
        playerEntity.nMoney=newMoney;
        playerEntity.nDiamond=newDiamond;
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"增加金币和钻石失败"];
    }
    return [result autorelease];
}

//根据建筑ID 删除建筑 
-(DAState *)DeleteBuildingByID:(NSString *)bID
{
    DAState * result = [[DAState alloc] init];
    if([[sqlliteService sharSqlliteservice] DeleteBuildingByBuildingID:bID])
    {
        result.bErr = NO;
        [[DAWorldMapService shareWorldMapService] RefreshWorldMap];
    }else
    {
        result.bErr = YES;
        result.errMsg  = [NSString stringWithFormat:@"Delete building failed!"];
    }
    return [result autorelease];
}
//通过建筑名字增加建筑 产生消费
-(DAState*) AddBuildingbyName:(NSString *) name  Type:(DABuildingType)btype PosX:(int) nx posY:(int) ny Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans
{
    DAState* result=[[DAState alloc]init];
    //查找建筑
    DABuildingEntity * obj=[[DAItemService shareService]GetBuildingItemByName:name BuildingType:btype];
    if (obj) {
        int nNeedMoney=obj.nBuyPrice;
        if (nNeedMoney>[self.playerEntity nMoney]) {
            //don't have enough money
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"don't have enough money"];
            NSLog(@"%@",result.errMsg);
        }
        else
        {
            //sub money
            int restMoney=[self.playerEntity nMoney]-nNeedMoney;
            self.playerEntity.nMoney=restMoney;
            //add exp
            int nExp=[self.playerEntity nExp]+obj.nExp;
            
            [[sqlliteService sharSqlliteservice]UpdatePlayerSetLevel:-1 Experience:nExp Lastleavetime:nil Money:restMoney Diamond:-1 WithUID:[self.playerEntity ID]];
            
            NSString * buildingID=[NSString stringWithFormat:@"%@",[IDCreate getBuildingID]];
            NSString * bTime=[NSString stringWithFormat:@"%@",[DateTool Now]];
            
            // add building to db
            BOOL b=[[sqlliteService sharSqlliteservice]AddBuildingByPlayerID:[self.playerEntity ID] BuildingID:buildingID ItemType:[DAItemTypeRelService GetBuildingTypeName:btype] ItemSysName:name PosX:nx PosY:ny BuildTime:[DateTool Now] Tag:tag Zindex:z BTans:btans];
            [[DAWorldMapService shareWorldMapService]AddBuildingByBID:buildingID ItemName:name ItemType:btype posX:nx posY:ny BuildTime:bTime Tag:tag Zindex:z BTans:btans];
            
            //shijie zhong tianj 
            // zan shi wei dui success panduan
            result.bErr=NO;
            result.ID=buildingID;
        }
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"找不到物品:%@",name];
        NSLog(@"%@",result.errMsg);
    }
    return [result autorelease];
}

#pragma mark  建筑影响关系修改
//更改加工厂关联
-(DAState*) ChgRelFactoryByID:(NSString*) factoryID  FactorySysName:(NSString*)factoryName HenHouseID:(NSString*)henHouseID
{  
    DAState* result=[[DAState alloc]init];
    //获得当前加工厂 加工级别
    DAProcessingBuildingEntity *item=[[DAItemService shareService]GetBuildingItemByName:factoryName BuildingType:BuildingType_Processing];
    if (nil==item) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"找不到物品:%@",factoryName];
        return [result autorelease];
    }
    
    int curLevel=item.ProParam;
    NSString*tID=[IDCreate getTableID];
    
    NSData * xmldata=[[sqlliteService sharSqlliteservice]SelectAllFactoryFromHenHouse:henHouseID];
    if (xmldata) {
        NSArray* szFactor=[DAPlayerParseXml getAllFactoryInHenHouse:xmldata];
        if (szFactor&&szFactor.count>0) {
            //比较级别
            BOOL bNeedInsert=YES;
            for (DAFactoryInHenHouse *subFactory in szFactor) {
                
                
                if (subFactory.nProductLevel<curLevel) {
                    //删除之前关联
                    [[sqlliteService sharSqlliteservice]SubFactoryFromHenHouse:subFactory.tID];
                }
                else
                {
                    bNeedInsert=NO;
                }
            }
            if (bNeedInsert) {
                //直接插入
                [[sqlliteService sharSqlliteservice]AddFactoryToHenHouse:tID HenHouseID:henHouseID FactoryID:factoryID FactoryLevel:curLevel];
            } 
        }
        else
        {
            //直接插入
            [[sqlliteService sharSqlliteservice]AddFactoryToHenHouse:tID HenHouseID:henHouseID FactoryID:factoryID FactoryLevel:curLevel];
            // result.bErr=NO;
        }
    }
    else
    {
        //直接插入
        [[sqlliteService sharSqlliteservice]AddFactoryToHenHouse:tID HenHouseID:henHouseID FactoryID:factoryID FactoryLevel:curLevel];
        
    }
    result.bErr=NO;
    return [result autorelease];
}
//更改魔法建筑影响
-(DAState*) ChgRElMagicByID:(NSString*) magicID MagicBuildingName:(NSString*)bName HenHouseID:(NSString*)henHouseID
{
    DAState* result=[[DAState alloc]init];
    //获得当前魔法建筑  建筑参数类别  建筑级别
    
    DAMagicBuildingEntity *item=[[DAItemService shareService]GetBuildingItemByName:bName BuildingType:BuildingType_Magic];
    if (nil==item) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"找不到物品:%@",bName];
        return [result autorelease];
    }
    
    int nlevel=item.nLevel;
    NSString *category=item.magicInfo;//影响叠加参数
    NSString*tID=[IDCreate getTableID];
    
    NSData* xmldata=[[sqlliteService sharSqlliteservice]SelectMagicRelationFromBuidID:henHouseID];
    NSArray* szMagic=[DAPlayerParseXml getAllMagicInHenHouse:xmldata];
    if (szMagic&&szMagic.count>0) {
        BOOL bNeedInsert=YES;
        
        for (DAMagicInHenHouse  *subMagic in szMagic) {
            DAMagicBuildingEntity *magicEntity=[[DAWorldMapService shareWorldMapService]getBuildingByID:subMagic.tID];
            if (nil==magicEntity) {
                continue;
            }
            if ([category isEqualToString:magicEntity.magicInfo]) {
                if (magicEntity.nLevel<nlevel) {
                    //删除以前关联
                    [[sqlliteService sharSqlliteservice]SubMagicBuildingByTableID:subMagic.tID];
                }
                else
                {
                    bNeedInsert=NO;
                }
            }
        }
        if (bNeedInsert) {
            [[sqlliteService sharSqlliteservice]AddMagicBuilding:magicID BuildingID:henHouseID TableID:tID];
        }
    }
    else
    {
        //直接增加
        [[sqlliteService sharSqlliteservice]AddMagicBuilding:magicID BuildingID:henHouseID TableID:tID];
    }
    result.bErr=NO;
    return [result autorelease];
}

//通过建筑对象添加建筑 产生消费
/*
 -(DAState*) AddBuildingbyObj:(DABuildingEntity*) buildObj{
 DAState* result=[[DAState alloc]init];
 
 int nNeedMoney=buildObj.nBuyPrice;
 if (nNeedMoney>[self.playerEntity nMoney]) {
 //don't have enough money
 result.bErr=YES;
 result.errMsg=[NSString stringWithFormat:@"don't have enough money"];
 NSLog(@"%@",result.errMsg);
 }
 else
 {
 //sub money
 int restMoney=[self.playerEntity nMoney]-nNeedMoney;
 self.playerEntity.nMoney=restMoney;
 
 [[sqlliteService sharSqlliteservice]UpdatePlayerSetLevel:-1 Experience:-1 Lastleavetime:nil Money:restMoney Diamond:-1 WithUID:[self.playerEntity ID]];
 // add building to db
 [[sqlliteService sharSqlliteservice]AddBuildingByPlayerID:[self.playerEntity ID] BuildingID:[IDCreate getBuildingID] ItemSysName:buildObj.SysName PosX:buildObj.nPosX PosY:buildObj.nPosY BuildTime:[DateTool Now]];
 // zan shi wei dui success panduan
 result.bErr=NO;
 }
 
 return [result autorelease];
 }
 */

//通过禽类名字向鸡舍中添加禽类 产生消费
-(DAState*) AddPoultryToHenHouse:(NSString *)henHouseID PoultryName:(NSString*)poulName
{
    DAState* result=[[DAState alloc]init];
    DAItemPoultryEntity * itemPoultry=[[DAItemService shareService]GetPoultryItemByName:poulName];
    if (itemPoultry) {
        int nNeedMoney=itemPoultry.BuyPrice;
        if (nNeedMoney>[self.playerEntity nMoney]) {
            //don't have enough money
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"don't have enough money"];
            NSLog(@"%@",result.errMsg);
        }
        else
        {
            //sub money
            int restMoney=[self.playerEntity nMoney]-nNeedMoney;
            self.playerEntity.nMoney=restMoney;
            
            //add exp
            //int nExp=[self.playerEntity nExp]+itemPoultry.;
            
            NSString * tID=[NSString stringWithFormat:@"%@",[IDCreate getTableID]];
            NSString * bTime=[NSString stringWithFormat:@"%@",[DateTool Now]];
            
            [[sqlliteService sharSqlliteservice]UpdatePlayerSetLevel:-1 Experience:-1 Lastleavetime:nil Money:restMoney Diamond:-1 WithUID:[self.playerEntity ID]];
            //add item to henHouse
            [[sqlliteService sharSqlliteservice]AddItemToHenHouse:tID:henHouseID ItemName:poulName JoinTime:bTime];
            DAItemInHenHouse *iteminHenHouse=[[DAItemInHenHouse alloc]init];
            iteminHenHouse.tID=tID;
            iteminHenHouse.sysName=poulName;
            iteminHenHouse.joinTime=bTime;
            iteminHenHouse.henHouseID=henHouseID;
            
            // 
            [[DAHenHousesDataService shareHenHouseDataService]OnAddItemToHenHouse:iteminHenHouse];
            [iteminHenHouse release];
            // zan shi wei dui success panduan
            result.bErr=NO;
            result.ID=tID;
        }
        
    }else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@" Can't find item %@",poulName];
    }
    return [result autorelease];
}
//收获成熟期的禽类 
-(DAState*) GetPoultryFromHenHouse:(NSString*)henHouseID TableID:(NSString*)tID
{
    DAState* result=[[DAState alloc]init];
    DAItemInHenHouse * item=[[DAHenHousesDataService shareHenHouseDataService]GetItemFromHenHouse:henHouseID TableID:tID];
    if (item) {
        DAItemPoultryEntity *itemPoultry=[[DAItemService shareService]GetPoultryItemByName:item.sysName];
        if (!itemPoultry) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"找不到该物品 sysNme=%@",item.sysName];
            return [result autorelease];
        }
        //从鸡舍中减少
        [[sqlliteService sharSqlliteservice]SutItemFromHenHouse:tID];
        //鸡舍缓存
        
        [[DAHenHousesDataService shareHenHouseDataService]SubItemFromHenHouse:henHouseID TableID:tID];
        //增加到仓库
        [[sqlliteService sharSqlliteservice]AddToWareHouseByItemName:itemPoultry.sysName ItemType:[DAItemTypeRelService GetItemTypeName:ItemType_Poultry] PlayerID:[self.playerEntity ID] itemNum:1];
        //仓库缓存
        [[DAWareHouseService shareWareHouseService]AddPoultryItemByName:itemPoultry.sysName ItemNum:1];
        
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"鸡舍中找不到该物品 tid=%@",tID];
    }
    return [result autorelease];
}

//通过禽类对象向鸡舍中添加禽类 产生消费
//-(DAState*) AddPoultrytoHenHouse:(NSString*)henHouseID PoultryObj:(DAItemPoultryEntity *) poultryObj PoultryNum:(int) pNum
//{
//    DAState* result=[[DAState alloc]init];
//    
//    return [result autorelease];
//}


//从商店购买物品 产生消费
-(DAState*) BuyItemFromShopByName:(NSString *) itemName ItemType:(DAGeneralItemType)itype ItemNum:(int) iNum;
{
    DAState* result=[[DAState alloc]init];
    DAGeneralItemEntity * item=[[DAItemService shareService]GetGeneralItemByName:itemName GeneralItemType:itype];
    if (item) {
        if (item.nBuyPrice*iNum>[self.playerEntity nMoney]) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"You don't have enough monty to buy item:%@",itemName];
        }
        else
        {
            //int nrestMoney=[self.playerEntity nMoney]-item.nBuyPrice*iNum;
            //sub money
            [self DirectAddMoney:(0-item.nBuyPrice*iNum) Diamond:0];
            
            //增加到仓库
            [[sqlliteService sharSqlliteservice]AddToWareHouseByItemName:itemName ItemType:[DAItemTypeRelService GetGeneralTypeName:itype] PlayerID:[self.playerEntity ID] itemNum:iNum];
            
            //修改仓库缓存
            [[DAWareHouseService shareWareHouseService]AddItemByName:itemName ItemType:itype ItemNum:iNum];
            result.bErr=NO;
        }
    }
    else{
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"Can't Find item:%@",itemName];
    }
    return [result autorelease];
}


//从鸡舍添加物品到仓库     不产生消费，会增加经验
-(DAState*) AddItemFromHenHouseByName:(NSString *) itemName ItemNum:(int) iNum
{
    DAState* result=[[DAState alloc]init];
    //查找物品
    DAItemEggs *itemEntity=[[DAItemService shareService]GetGeneralItemByName:itemName GeneralItemType:GeneralItem_Eggs];
    if (itemEntity) {
        int nexp=[itemEntity nExp]*iNum;
        [self DirectAddExperience:nexp];
        //
        [[sqlliteService sharSqlliteservice]AddToWareHouseByItemName:itemName ItemType:[DAItemTypeRelService GetGeneralTypeName:GeneralItem_Eggs] PlayerID:[self.playerEntity ID] itemNum:iNum];
        //缓存
        [[DAWareHouseService shareWareHouseService]AddItemByName:itemName ItemType:GeneralItem_Eggs ItemNum:iNum];
        
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"无法找到物品%@",itemName];
    }
    return [result autorelease];
}
//从工厂添加物品到仓库     不产生消费，不会增加经验
-(DAState*)AddProductItemToWareHouseByName:(NSString *)itemName ItemNum:(int)iNum
{
    DAState * result = [[DAState alloc] init];
    DAItemEggs *itemEntity=[[DAItemService shareService]GetGeneralItemByName:itemName GeneralItemType:GeneralItem_Products];
    if (itemEntity) {
//        int nexp=[itemEntity nExp]*iNum;
//        [self DirectAddExperience:nexp];
        //
        [[sqlliteService sharSqlliteservice]AddToWareHouseByItemName:itemName ItemType:[DAItemTypeRelService GetGeneralTypeName:GeneralItem_Products] PlayerID:[self.playerEntity ID] itemNum:iNum];
        //缓存
        [[DAWareHouseService shareWareHouseService]AddItemByName:itemName ItemType:GeneralItem_Products ItemNum:iNum];
        
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"无法找到物品%@",itemName];
    }
    return [result autorelease];
}

//从加工厂增加物品到仓库 不产生消费，不增加经验
//-(DAState*) AddItemFromPFactoryByName:(NSString *)factoryID ItemName:(NSString *)itemName ItemNum:(int) iNum
//{
//    DAState* result=[[DAState alloc]init];
//    
//    return [result autorelease];
//}


//增加物品到加工厂  不产生消费，会增加经验
-(DAState*) AddItemToPFactoryByName:(NSString *)factoryID ItemName:(NSString *)itemName ItemNum:(int) iNum{
    DAState* result=[[DAState alloc]init];
    //查找物品
    DAItemEggs *itemEntity=[[DAItemService shareService]GetGeneralItemByName:itemName GeneralItemType:GeneralItem_Eggs];
    if (itemEntity) {
        int nexp=[itemEntity nExp]*iNum;
        [self DirectAddExperience:nexp];
        //
        NSString * tID=[IDCreate getTableID];
        NSString* stime=[DateTool Now];
        [[sqlliteService sharSqlliteservice]AddItemToFactory:tID :factoryID ItemName:itemName itemNum:iNum StartTime:stime];
        //缓存
        DAItemInFactory *itemInfac=[[DAItemInFactory alloc]init];
        itemInfac.tID=tID;
        itemInfac.sysName=itemName;
        itemInfac.iNum=iNum;
        itemInfac.startTime=stime;
        itemInfac.needTime=5;//需要时间
        [[DAPFactoryService sharePFactoryService]OnItemAdd:[itemInfac autorelease]];
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"无法找到物品%@",itemName];
    }
    return [result autorelease];
}
//升级鸡舍
-(DAState*) UpgradHenHouseByDestHenhouseID:(NSString*)destID SrcHenHouseID:(NSString*)srcID
{
    DAState * result=[[DAState alloc]init];
    DABuildingEntity *destBuilding=[[DAWorldMapService shareWorldMapService]getBuildingByID:destID];
    DABuildingEntity *srcBuilding=[[DAWorldMapService shareWorldMapService]getBuildingByID:srcID];
    if (nil==destBuilding||srcBuilding==nil) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"升级鸡舍数据错误"];
        return [result autorelease];
    }
    int src1Level=destBuilding.nLevel;
    int src2Level=srcBuilding.nLevel;
    int nDestLevel=src1Level+src2Level;
    NSString *buildType=[DAItemTypeRelService GetBuildingTypeName:BuildingType_Breeding];
    NSData* xmldata=[[sqlliteService sharSqlliteservice]SelBuildingByItemType:buildType MaxLevel:nDestLevel];
    NSArray *elements=[DAItemParseXml getAllElement:xmldata];
    NSArray * allObj=[DAItemParseXml getBreedBuilding:elements];
    if (nil==allObj||allObj.count<1) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"鸡舍数据错误"];
        return [result autorelease];
    }
    DABreedingBuildingEntity * destObj=nil;
    for (DABreedingBuildingEntity *subObj  in allObj) {
        if (subObj.nLevel>src1Level&&subObj.nLevel>src2Level&&subObj.nLevel<=nDestLevel) {
            if (destObj) {
                if (subObj.nLevel>destObj.nLevel) {
                    destObj=subObj;
                }
            }
            else
            {
                destObj=subObj;
            }
        }
    }
    //升级
    if (!destObj) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"升级失败！"];
        return [result autorelease];
    }
    //检测升级所需物品
    NSString * needItemName=destObj.upgradNeedItem;
    DAItemProp * itemNeed;
    if (needItemName) {
        //仓库检测是否有升级物品
        DAItemInWareHouse *item= [[DAWareHouseService shareWareHouseService]FindPropItem:needItemName];
        itemNeed=[[DAItemService shareService]GetGeneralItemByName:needItemName GeneralItemType:GeneralItem_Prop];
        if (nil==item) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"没有升级物品%@",needItemName];
            return [result autorelease];
        }
        if (nil==itemNeed) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"查找物品%@失败",needItemName];
            return [result autorelease];

        }
    }
    //
    int needMoney=destObj.nUpgradeNeedMoney;
    if (needMoney>[self.playerEntity nMoney]) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"你没有足够的金币来升级"];
        return [result autorelease];
    }
    //扣除金钱
    [self DirectAddMoney:-needMoney Diamond:0];
    //扣除物品
    if (needItemName) {
        [[sqlliteService sharSqlliteservice]SubFromWareHouseByItemName:needItemName PlayerID:[self.playerEntity ID]];
    }
    //加入到数据库
    [[sqlliteService sharSqlliteservice]DeleteBuildingByBuildingID:destID];
    [[sqlliteService sharSqlliteservice]DeleteBuildingByBuildingID:srcID];
    [[sqlliteService sharSqlliteservice]AddBuildingByPlayerID:[self.playerEntity ID] BuildingID:destID ItemType:[DAItemTypeRelService GetBuildingTypeName:BuildingType_Breeding] ItemSysName:destObj.SysName PosX:destBuilding.nPosX PosY:destBuilding.nPosY BuildTime:[DateTool Now] Tag:[destBuilding nTag] Zindex:[destBuilding nZindex]  BTans:[destBuilding BTrans]];
    
    //加入到缓存
    [[DAWorldMapService shareWorldMapService]RefreshWorldMap];//刷新缓存
    
    result.bErr=NO;
    
    ////////
    ////////
    return [result autorelease];
}
//升级加工厂
-(DAState*) UpgradFactoryByDestFactoryID:(NSString*)destID SrcFactoryID:(NSString*)srcID
{
    DAState * result=[[DAState alloc]init];
    DABuildingEntity *destBuilding=[[DAWorldMapService shareWorldMapService]getBuildingByID:destID];
    DABuildingEntity *srcBuilding=[[DAWorldMapService shareWorldMapService]getBuildingByID:srcID];
    if (nil==destBuilding||srcBuilding==nil) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"升级加工厂数据错误"];
        return [result autorelease];
    }
    int src1Level=destBuilding.nLevel;
    int src2Level=srcBuilding.nLevel;
    int nDestLevel=src1Level+src2Level;
    NSString *buildType=[DAItemTypeRelService GetBuildingTypeName:BuildingType_Processing];
    NSData* xmldata=[[sqlliteService sharSqlliteservice]SelBuildingByItemType:buildType MaxLevel:nDestLevel];
    NSArray *elements=[DAItemParseXml getAllElement:xmldata];
    NSArray * allObj=[DAItemParseXml getProcessBuilding:elements];
    if (nil==allObj||allObj.count<1) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"加工厂数据错误"];
        return [result autorelease];
    }
    DAProcessingBuildingEntity * destObj=nil;
    for (DAProcessingBuildingEntity *subObj  in allObj) {
        if (subObj.nLevel>src1Level&&subObj.nLevel>src2Level&&subObj.nLevel<=nDestLevel) {
            if (destObj) {
                if (subObj.nLevel>destObj.nLevel) {
                    destObj=subObj;
                }
            }
            else
            {
                destObj=subObj;
            }
        }
    }
    //升级
    if (!destObj) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"升级失败！"];
        return [result autorelease];
    }
    //检测升级所需物品
    NSString * needItemName=destObj.upgradNeedItem;
    DAItemProp * itemNeed;
    if (needItemName) {
        //仓库检测是否有升级物品
        DAItemInWareHouse *item= [[DAWareHouseService shareWareHouseService]FindPropItem:needItemName];
        itemNeed=[[DAItemService shareService]GetGeneralItemByName:needItemName GeneralItemType:GeneralItem_Prop];
        if (nil==item) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"没有升级物品%@",needItemName];
            return [result autorelease];
        }
        if (nil==itemNeed) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"查找物品%@失败",needItemName];
            return [result autorelease];
            
        }
    }
    //
    int needMoney=destObj.nUpgradeNeedMoney;
    if (needMoney>[self.playerEntity nMoney]) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"你没有足够的金币来升级"];
        return [result autorelease];
    }
    //扣除金钱
    [self DirectAddMoney:-needMoney Diamond:0];
    //扣除物品
    
    if (needItemName) {
        [[sqlliteService sharSqlliteservice]SubFromWareHouseByItemName:needItemName PlayerID:[self.playerEntity ID]];
    }
    //加入到数据库
    [[sqlliteService sharSqlliteservice]DeleteBuildingByBuildingID:destID];
    [[sqlliteService sharSqlliteservice]DeleteBuildingByBuildingID:srcID];
    [[sqlliteService sharSqlliteservice]AddBuildingByPlayerID:[self.playerEntity ID] BuildingID:destID ItemType:[DAItemTypeRelService GetBuildingTypeName:BuildingType_Processing] ItemSysName:destObj.SysName PosX:destBuilding.nPosX PosY:destBuilding.nPosY BuildTime:[DateTool Now] Tag:[destBuilding nTag] Zindex:[destBuilding nZindex]  BTans:[destBuilding BTrans]];
    
    //加入到缓存
    [[DAWorldMapService shareWorldMapService]RefreshWorldMap];//刷新缓存
    
    result.bErr=NO;
    return [result autorelease];
}
//升级魔法类建筑
-(DAState*) UpgradMagicByDestFactoryID:(NSString*)destID SrcMagicID:(NSString*)srcID
{
    DAState * result=[[DAState alloc]init];
    DABuildingEntity *destBuilding=[[DAWorldMapService shareWorldMapService]getBuildingByID:destID];
    DABuildingEntity *srcBuilding=[[DAWorldMapService shareWorldMapService]getBuildingByID:srcID];
    if (nil==destBuilding||srcBuilding==nil) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"升级装饰性建筑数据错误"];
        return [result autorelease];
    }
    int src1Level=destBuilding.nLevel;
    int src2Level=srcBuilding.nLevel;
    int nDestLevel=src1Level+src2Level;
    NSString *buildType=[DAItemTypeRelService GetBuildingTypeName:BuildingType_Magic];
    NSData* xmldata=[[sqlliteService sharSqlliteservice]SelBuildingByItemType:buildType MaxLevel:nDestLevel];
    NSArray *elements=[DAItemParseXml getAllElement:xmldata];
    NSArray * allObj=[DAItemParseXml getMagicBuilding:elements];
    if (nil==allObj||allObj.count<1) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"装饰性建筑数据错误"];
        return [result autorelease];
    }
    DAMagicBuildingEntity * destObj=nil;
    for (DAMagicBuildingEntity *subObj  in allObj) {
        if (subObj.nLevel>src1Level&&subObj.nLevel>src2Level&&subObj.nLevel<=nDestLevel) {
            if (destObj) {
                if (subObj.nLevel>destObj.nLevel) {
                    destObj=subObj;
                }
            }
            else
            {
                destObj=subObj;
            }
        }
    }
    //升级
    if (!destObj) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"升级失败！"];
        return [result autorelease];
    }
    //检测升级所需物品
    NSString * needItemName=destObj.upgradNeedItem;
    DAItemProp * itemNeed;
    if (needItemName) {
        //仓库检测是否有升级物品
        DAItemInWareHouse *item= [[DAWareHouseService shareWareHouseService]FindPropItem:needItemName];
        itemNeed=[[DAItemService shareService]GetGeneralItemByName:needItemName GeneralItemType:GeneralItem_Prop];
        if (nil==item) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"没有升级物品%@",needItemName];
            return [result autorelease];
        }
        if (nil==itemNeed) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"查找物品%@失败",needItemName];
            return [result autorelease];
            
        }
    }
    //
    int needMoney=destObj.nUpgradeNeedMoney;
    if (needMoney>[self.playerEntity nMoney]) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"你没有足够的金币来升级"];
        return [result autorelease];
    }
    //扣除金钱
    [self DirectAddMoney:-needMoney Diamond:0];
    //扣除物品
    
    if (needItemName) {
        [[sqlliteService sharSqlliteservice]SubFromWareHouseByItemName:needItemName PlayerID:[self.playerEntity ID]];
    }
    //加入到数据库
    [[sqlliteService sharSqlliteservice]DeleteBuildingByBuildingID:destID];
    [[sqlliteService sharSqlliteservice]DeleteBuildingByBuildingID:srcID];
    [[sqlliteService sharSqlliteservice]AddBuildingByPlayerID:[self.playerEntity ID] BuildingID:destID ItemType:[DAItemTypeRelService GetBuildingTypeName:BuildingType_Magic] ItemSysName:destObj.SysName PosX:destBuilding.nPosX PosY:destBuilding.nPosY BuildTime:[DateTool Now] Tag:[destBuilding nTag] Zindex:[destBuilding nZindex]  BTans:[destBuilding BTrans]];
    
    //加入到缓存
    [[DAWorldMapService shareWorldMapService]RefreshWorldMap];//刷新缓存
    
    result.bErr=NO;
    return [result autorelease];
}
//禽类喂食物 或喂水
-(DAState*) EatOrWaterPoultryByTID:(NSString*)tID BEat:(BOOL)beat HenHouseID:(NSString*)henHouseID Cost:(int) nFood Time:(NSString*)nStr
{
    DAState * result=[[DAState alloc]init];
    
    DAHenHouseDataEntity*henHouseData= [[DAHenHousesDataService shareHenHouseDataService]getHenHouseData:henHouseID];
    if (nil==henHouseData) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"鸡舍ID有错误%@",henHouseID];
        return [result autorelease];
    }
    int nRestFood=henHouseData.restFood;
    int nRestWater=henHouseData.restWater;
    if (beat) {
        if (nFood>nRestFood) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"鸡舍中没有足够的食料"];
            return [result autorelease];
        }
        else
            nRestFood=nRestFood-nFood;
    }
    else
    {
        if (nFood>nRestWater) {
            result.bErr=YES;
            result.errMsg=[NSString stringWithFormat:@"鸡舍中没有足够的水"];
            return [result autorelease];
        }
        else
        {
            nRestWater=nRestWater-nFood;
        }
    }
    //喂水并修改时间
    //itemName 可以不用传
    NSString *eatTime=nil;
    NSString *waterTime=nil;
    if (beat) {
        eatTime=nStr;
    }
    else{
        waterTime=nStr;
    }
    [[sqlliteService sharSqlliteservice]UpdateHenHouse:henHouseID Water:nRestWater Food:nRestFood];
    [[sqlliteService sharSqlliteservice]UPdateItemInHenHouse:tID HenHouseID:henHouseID ItemName:nil LastWater:waterTime  LastFood:eatTime ActiveTime:-1 LayEggs:-1 LastLayTime:nil];
    
    henHouseData.restFood=nRestFood;
    henHouseData.restWater=nRestWater;
    DAItemInHenHouse * item=[[DAHenHousesDataService shareHenHouseDataService]GetItemFromHenHouse:henHouseID TableID:tID];
    if (item) {
        if (beat) {
            item.lastFoodTime=nStr;
            
        }
        else{
            item.lastWaterTime=nStr;
        }
        
    }
    result.bErr=NO;
    return [result autorelease];
}
//增加水分和食物
-(DAState*) AddWaterAndFoodByHenHouseID:(NSString*)henHouseID BWater:(BOOL) bWater BFood:(BOOL)bFood
{
    DAState * result=[[DAState alloc]init];
    
    DAHenHouseDataEntity*henHouseData= [[DAHenHousesDataService shareHenHouseDataService]getHenHouseData:henHouseID];
    if (nil==henHouseData) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"鸡舍ID有错误%@",henHouseID];
        return [result autorelease];
    }
    int nRestFood=henHouseData.restFood;
    int nRestWater=henHouseData.restWater;
    if (bWater) {
        nRestWater=100;
    }
    if (bFood) {
        nRestFood=100;
    }
    [[sqlliteService sharSqlliteservice]UpdateHenHouse:henHouseID Water:nRestWater Food:nRestFood];
    henHouseData.restFood=nRestWater;
    henHouseData.restWater=nRestFood;
    result.bErr=NO;
    return [result autorelease];
}

//转换禽类（禽类生长)
-(DAState*) PoultryGrowInhenHouse:(NSString*)henHouseID TID:(NSString*)tid TransDest:(NSString*)destName
{
    DAState * result=[[DAState alloc]init];
    
    DAItemInHenHouse * item=[[DAHenHousesDataService shareHenHouseDataService]GetItemFromHenHouse:henHouseID TableID:tid];
    
    if (nil==item) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"TID有错误%@",tid];
        return [result autorelease];
    }
    DAItemPoultryEntity * itemPoultry=[[DAItemService shareService]GetPoultryItemByName:destName];
    if (nil==itemPoultry) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"找不到物品%@",destName];
        NSLog(@"%@",result.errMsg);
        return [result autorelease];
    }
    //更改
    if(nil == destName)
    {
        NSLog(@"%@",destName);
    }
    [[sqlliteService sharSqlliteservice]UPdateItemInHenHouse:tid HenHouseID:henHouseID ItemName:destName LastWater:nil LastFood:nil ActiveTime:-1 LayEggs:-1 LastLayTime:nil];
    
    [[DAHenHousesDataService shareHenHouseDataService]RefreshAllHenHouseData];
    result.bErr=NO;
    return [result autorelease];
    
}
//下蛋
-(DAState*)PoultryLayInHenHouse:(NSString*)HenHouseID TID:(NSString*)tiD
{
    DAState * result=[[DAState alloc]init];
    
    DAItemInHenHouse * item=[[DAHenHousesDataService shareHenHouseDataService]GetItemFromHenHouse:HenHouseID TableID:tiD];
    
    if (nil==item) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"TID有错误%@",tiD];
        return [result autorelease];
    }
    int layNum=item.layEggs+1;
    [[sqlliteService sharSqlliteservice]UPdateItemInHenHouse:tiD HenHouseID:HenHouseID ItemName:nil LastWater:nil  LastFood:nil ActiveTime:-1 LayEggs:layNum LastLayTime:[DateTool Now]];
    item.layEggs=layNum;
    result.bErr=NO;
    return [result autorelease];
    
}
-(DAState*)ChgPoultryActiveByTID:(NSString*)tID ActiveTime:(int)nTime
{
    DAState *result=[[DAState alloc]init];
    BOOL Bsuc=[[sqlliteService sharSqlliteservice]UPdateItemInHenHouse:tID HenHouseID:nil ItemName:nil LastWater:nil LastFood:nil ActiveTime:nTime LayEggs:-1 LastLayTime:nil];
    if (Bsuc) {
        result.bErr=NO;
    }
    else
    {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"更新错误"];
        NSLog(@"更新时间错误");
    }
    return [result autorelease];
}
-(DAState*) SellItemInWare:(NSArray*)szItem Vehilce:(NSString*)vName
{
    DAState *result=[[DAState alloc]init];
    int nNeed=0;//运费
    int nGet=0;//获得
    DAItemVehicle *itemVehicle=[[DAItemService shareService]GetGeneralItemByName:vName GeneralItemType:GeneralItem_Vehicle];
    if (nil==itemVehicle) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"无法获得物品%@",vName];
        return [result autorelease];
    }
    nNeed=itemVehicle.nNeedPrice;
    
    //计算获得
    for (DAItemInWareHouse * subItem in szItem) {
        if (ItemType_Poultry==[DAItemTypeRelService GetItemType:subItem.itemType]) {
            DAItemPoultryEntity *itemPoultry=[[DAItemService shareService]GetPoultryItemByName:subItem.sysName];
            if (itemPoultry) {
                 nGet+=subItem.iNum*itemPoultry.SellPrice;
            }
           
        }
        else
        {
            DAGeneralItemEntity * itemGeneral=[[DAItemService shareService]GetGeneralItemByName:subItem.sysName GeneralItemType:[DAItemTypeRelService GetGetneralType:subItem.itemType]];
            if (itemGeneral) {
                nGet+=subItem.iNum*itemGeneral.nSellPrice;
            }
        }
    }
    //计算剩余金币
    int nRest=nGet+self.playerEntity.nMoney-nNeed;
    if (nRest<=0) {
        result.bErr=YES;
        result.errMsg=[NSString stringWithFormat:@"没有足够的运费来运输这些物品"];
        return [result autorelease];
    }
    //修改数据库
    int nRestItem=0;
    for (DAItemInWareHouse * subItem in szItem) {
        if (ItemType_Poultry==[DAItemTypeRelService GetItemType:subItem.itemType]) {
            nRestItem=[[[DAWareHouseService shareWareHouseService]FindPoultryItem:subItem.sysName]iNum]-subItem.iNum;
            if (nRestItem>0) {
                //修改
                [[sqlliteService sharSqlliteservice]UpdateItemInWareHouse:subItem.sysName PlayerID:[self.playerEntity ID] itemNum:nRestItem];
            }else
            {
                //删除
                [[sqlliteService sharSqlliteservice]SubFromWareHouseByItemName:subItem.sysName PlayerID:[self.playerEntity ID]];
            }
            
        }
        else
        {
            switch ([DAItemTypeRelService GetGetneralType:subItem.itemType]) {
                case GeneralItem_Eggs:
                    nRestItem=[[[DAWareHouseService shareWareHouseService]FindEggsItem:subItem.sysName]iNum]-subItem.iNum;
                    break;
                case GeneralItem_Products:
                    nRestItem=[[[DAWareHouseService shareWareHouseService]FineProductsItem:subItem.sysName]iNum]-subItem.iNum;
                    break;
                default:
                    break;
            }
        }
        if (nRestItem>0) {
            //修改
            [[sqlliteService sharSqlliteservice]UpdateItemInWareHouse:subItem.sysName PlayerID:[self.playerEntity ID] itemNum:nRestItem];
        }else
        {
            //删除
            [[sqlliteService sharSqlliteservice]SubFromWareHouseByItemName:subItem.sysName PlayerID:[self.playerEntity ID]];
        }
    }
    //增加金币//////
    [self DirectAddMoney:(nGet-nNeed) Diamond:0];
    //刷新仓库
    [[DAWareHouseService shareWareHouseService]RefreshWareHouseData];
    result.bErr=NO;
    return [result autorelease];
}
//直接增加物品到加工厂 一般测试用
//-(DAState*) DirectAddItemToPFactory:(NSString *)factoryID ItemName:(NSString*) iname ItemNum:(int) iNum
//{
//    DAState* result=[[DAState alloc]init];
//    
//    return [result autorelease];
//}


//直接增加物品到仓库 一般测试用
//-(DAState*) DirectAddItemByName:(NSString*)itemName ItemNum:(NSString*)itemNum
//{
//    DAState* result=[[DAState alloc]init];
//    
//    return [result autorelease];
//}
-(void )dealloc
{
    self.curPlayerName=nil;
    self.playerEntity=nil;
    [super dealloc];
}
@end
