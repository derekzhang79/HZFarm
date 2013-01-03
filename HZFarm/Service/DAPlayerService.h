//
//  DAPlayerService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAHeader.h"
#import "DAitemPoultryEntity.h"
#import "DAItemTypeDefine.h"
#import "DAState.h"

@interface DAPlayerService : NSObject
{
    DAPlayerEntity  * playerEntity;
    NSString   *curPlayerName;//当前玩家姓名
}

#pragma mark 用户操作接口
-(NSArray*)GetAllPlayerName;//已完成
-(DAState*) AddPlayer:(NSString*)playerName;//添加新玩家//已完成
-(DAState*) DeletePlayer:(NSString*)playerName;//删除用户
- (void)RefeshPlayerData;//刷新当前玩家数据//已完成
//修改玩家离开时间
-(DAState*) SetPlayerLeavtime:(NSString*)ltime;//已完成

//直接增加经验
-(DAState*) DirectAddExperience:(int) nexp;//已完成

//直接增加虚拟货币
-(DAState*) DirectAddMoney:(int) nMoney Diamond:(int) nDia;//已完成

#pragma mark 建造接口
//通过建筑名字增加建筑 产生消费
-(DAState*) AddBuildingbyName:(NSString *) name Type:(DABuildingType)btype PosX:(int) nx posY:(int) ny Tag:(int)tag Zindex:(int)z BTans:(BOOL) btans;//已完成
-(DAState*) DeleteBuildingByID:(NSString *)bID;

#pragma mark  建筑影响关系修改
//更改加工厂关联
-(DAState*) ChgRelFactoryByID:(NSString*) factoryID FactorySysName:(NSString*)factoryName HenHouseID:(NSString*)henHouseID;//已完成
//更改魔法建筑影响
-(DAState*) ChgRElMagicByID:(NSString*) magicID MagicBuildingName:(NSString*)bName HenHouseID:(NSString*)henHouseID;//已完成

//通过建筑对象添加建筑 产生消费
//-(DAState*) AddBuildingbyObj:(DABuildingEntity*) buildObj;

#pragma mark 鸡舍中接口
//通过禽类名字向鸡舍中添加禽类 产生消费
-(DAState*) AddPoultryToHenHouse:(NSString *)henHouseID PoultryName:(NSString*)poulName ; //已完成
//收获禽类
-(DAState*) GetPoultryFromHenHouse:(NSString*)henHouseID  TableID:(NSString*)tID; //已完成

//从鸡舍添加物品到仓库(蛋类)     不产生消费，会增加经验
-(DAState*) AddItemFromHenHouseByName:(NSString *) itemName ItemNum:(int) iNum;//已完成

//从工厂添加物品到仓库(加工产品类)    不产生消费，不会增加经验
-(DAState*) AddProductItemToWareHouseByName:(NSString *) itemName ItemNum:(int) iNum;//已完成

//从加工厂增加物品到仓库 不产生消费，不增加经验 
//-(DAState*) AddItemFromPFactoryByName:(NSString *)tableID FactoryID:(NSString *)factoryID ItemName:(NSString *)itemName ItemNum:(int) iNum;

//增加物品到加工厂  不产生消费，会增加经验
-(DAState*) AddItemToPFactoryByName:(NSString *)factoryID ItemName:(NSString *)itemName ItemNum:(int) iNum;//已完成

//通过禽类对象向鸡舍中添加禽类 产生消费
//-(DAState*) AddPoultrytoHenHouse:(NSString*)henHouseID PoultryObj:(DAItemPoultryEntity *) poultryObj;

//禽类喂食物 或喂水
-(DAState*) EatOrWaterPoultryByTID:(NSString*)tID BEat:(BOOL)beat HenHouseID:(NSString*)henHouseID Cost:(int) nFood Time:(NSString*)nStr;
//增加水分和食物
-(DAState*) AddWaterAndFoodByHenHouseID:(NSString*)henHouseID BWater:(BOOL) bWater BFood:(BOOL)bFood;

//转换禽类（禽类生长)
-(DAState*) PoultryGrowInhenHouse:(NSString*)henHouseID TID:(NSString*)tid TransDest:(NSString*)destName;
//下蛋
-(DAState*)PoultryLayInHenHouse:(NSString*)HenHouseID TID:(NSString*)tiD;
-(DAState*)ChgPoultryActiveByTID:(NSString*)tID ActiveTime:(int)nTime;


#pragma mark 商店接口
//从商店购买物品 产生消费 用虚拟货币进行购买道具 交通工具
-(DAState*) BuyItemFromShopByName:(NSString *) itemName ItemType:(DAGeneralItemType)itype ItemNum:(int) iNum;//已完成


#pragma mark 建筑升级接口
//升级鸡舍
-(DAState*) UpgradHenHouseByDestHenhouseID:(NSString*)destID SrcHenHouseID:(NSString*)srcID;
//升级加工厂
-(DAState*) UpgradFactoryByDestFactoryID:(NSString*)destID SrcFactoryID:(NSString*)srcID;
//升级魔法类建筑
-(DAState*) UpgradMagicByDestFactoryID:(NSString*)destID SrcMagicID:(NSString*)srcID;

//直接增加物品到加工厂 一般测试用
//-(DAState*) DirectAddItemToPFactory:(NSString *)factoryID ItemName:(NSString*) iname ItemNum:(int) iNum;

//直接增加物品到仓库 一般测试用
//-(DAState*) DirectAddItemByName:(NSString*)itemName ItemNum:(NSString*)itemNum;

#pragma mark 仓库
-(DAState*) SellItemInWare:(NSArray*)szItem Vehilce:(NSString*)vName;

+(DAPlayerService*) sharePlayerService;

@property(nonatomic,retain) DAPlayerEntity * playerEntity;
@property(nonatomic,retain) NSString   *curPlayerName;//当前玩家姓名
@end
