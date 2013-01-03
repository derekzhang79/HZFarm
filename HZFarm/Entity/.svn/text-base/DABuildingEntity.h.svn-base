//
//  DABuildingEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"

@interface DABuildingEntity : NSObject
{
    NSString * ID;//建筑ID
    NSString * SysName;//建筑系统名字
    NSString * DisName;//显示名称
    BOOL       BNearRoad;//是否是职能建筑（建造在公路旁)
    BOOL        BMagic;//是否是魔法建造（装饰性）
    BOOL        BCanSetup;//是否可以建造
    BOOL        BCanBuy;
    BOOL        BCanUpgrade;//
    int         nDestroyHavePrice;//拆毁获得价格
    int         nBuyPrice;//买入价格
    int         nUpgradeNeedMoney;//升级需要金币
    int         nExp;//建造时或升级时获得经验
    BOOL        BCanDestroy;//可否拆毁
    BOOL        BCanMove;//可否移动
    int         nSetNeedTime;//建造需要时间
   // CGSize      nSize;
    int         nSizeX;
    int         nSizeY;
    NSString *  DestroyImagePath;
    NSString *  BuildingImagePath;//建造中的建筑图片
    NSString *  BuildedImagePath;//建造后建筑图片
    int         nDestoryNeedTime;//拆毁时图片
    DABuildingType Buildtype;
    int     nLevel;// 建筑级别
    NSString * upgradNeedItem;
    ////动态数据
    int     nPosX;
    int     nPosY;
    NSString *BuildTime;
    int     nTag;
    int     nZindex;
    BOOL    BTrans;
}
@property(nonatomic,retain) NSString * ID;//建筑ID
@property(nonatomic,retain) NSString * SysName;//建筑系统名字
@property(nonatomic,retain) NSString * DisName;//显示名称
@property BOOL       BNearRoad;//是否是职能建筑（建造在公路旁)
@property BOOL        BMagic;//是否是魔法建造（装饰性）
@property BOOL        BCanSetup;//是否可以建造
@property BOOL        BCanBuy;
@property BOOL        BCanUpgrade;//
@property int         nDestroyHavePrice;//拆毁获得价格
@property int         nBuyPrice;//买入价格
@property int         nUpgradeNeedMoney;//升级需要金币
@property int         nExp;//建造时或升级时获得经验
@property BOOL        BCanDestroy;//可否拆毁
@property BOOL        BCanMove;//可否移动
@property int         nSetNeedTime;//建造需要时间
//@property CGSize      nSize;
@property   int nSizeX;
@property   int nSizeY;
@property(nonatomic,retain) NSString *  DestroyImagePath;
@property(nonatomic,retain) NSString *  BuildingImagePath;//建造中的建筑图片
@property(nonatomic,retain) NSString *  BuildedImagePath;//建造后建筑图片
@property int         nDestoryNeedTime;//拆毁时图片
@property DABuildingType Buildtype;
@property int nLevel;
@property (nonatomic,retain) NSString * upgradNeedItem;
@property int     nPosX;
@property int     nPosY;
@property (nonatomic,retain)    NSString *BuildTime;
@property int     nTag;
@property int     nZindex;
@property BOOL    BTrans;
@end
