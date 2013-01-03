//
//  DABuildingEntity.m
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DABuildingEntity.h"

//建筑类对象
@implementation DABuildingEntity 
@synthesize ID;//建筑ID
@synthesize SysName;//建筑系统名字
@synthesize DisName;//显示名称
@synthesize       BNearRoad;//是否是职能建筑（建造在公路旁)
@synthesize        BMagic;//是否是魔法建造（装饰性）
@synthesize        BCanSetup;//是否可以建造
@synthesize        BCanBuy;
@synthesize        BCanUpgrade;//
@synthesize         nDestroyHavePrice;//拆毁获得价格
@synthesize         nBuyPrice;//买入价格
@synthesize         nUpgradeNeedMoney;//升级需要金币
@synthesize         nExp;//建造时或升级时获得经验
@synthesize        BCanDestroy;//可否拆毁
@synthesize        BCanMove;//可否移动
@synthesize         nSetNeedTime;//建造需要时间
//@synthesize      nSize;
@synthesize nSizeX;
@synthesize nSizeY;
@synthesize  DestroyImagePath;
@synthesize  BuildingImagePath;//建造中的建筑图片
@synthesize  BuildedImagePath;//建造后建筑图片
@synthesize         nDestoryNeedTime;//拆毁时图片
@synthesize Buildtype;
@synthesize nLevel;
@synthesize upgradNeedItem;


@synthesize nPosX;
@synthesize nPosY;
@synthesize BuildTime;

@synthesize    nTag;
@synthesize     nZindex;
@synthesize    BTrans;


-(void)dealloc
{
    [ID release];
    [SysName release];
    [DisName release];
    [DestroyImagePath release];
    [BuildedImagePath release];
    [BuildingImagePath release];
    [upgradNeedItem release];
    self.BuildTime=nil;
    [super dealloc];
}

@end
