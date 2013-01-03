//
//  DAWareHouseService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAWareHouseDataEntity.h"
#import "DAItemInWareHouse.h"

//仓库服务
@interface DAWareHouseService : NSObject
{
    DAWareHouseDataEntity * wareHouseData;
}

+(DAWareHouseService*) shareWareHouseService;

-(void) RefreshWareHouseData;
-(DAItemInWareHouse *) FindEggsItem:(NSString*)iName;
-(DAItemInWareHouse *) FineProductsItem:(NSString*)iName;
-(DAItemInWareHouse *) FindPoultryItem:(NSString*)iName;
-(DAItemInWareHouse *) FindVehicleItem:(NSString*)iName;
-(DAItemInWareHouse *) FindPropItem:(NSString*)iName;
#pragma mark    操作仓库服务中的物品，不会影响数据库，只会影响内存，目比是避免频繁读取数据库操作。所有影响动态数据的操作，都需要由玩家服务调用

//增加或减少物品数量，仅影响内存中物品数量，不影响数据库
-(void) AddItemByName:(NSString*) itemName ItemType:(DAGeneralItemType) itype ItemNum:(int)iNum;
-(void) AddPoultryItemByName:(NSString*)itemName ItemNum:(int) iNum;
-(void) SubItemByName:(NSString*) itemName ItemType:(DAGeneralItemType) itype ItemNum:(int)iNum;
-(void) SubPoultryItemByName:(NSString*)itemName ItemNum:(int) iNum;

@property(nonatomic,retain) DAWareHouseDataEntity * wareHouseData;
@end
