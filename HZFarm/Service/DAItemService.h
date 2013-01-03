//
//  DAItemService.h
//  HZFarm
//  物品表服务
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"

@interface DAItemService : NSObject
{
    NSMutableDictionary * itemDic;
}
+(DAItemService*) shareService;
//获得建筑类物品对象养殖建筑 加工类建筑  魔法建筑 一般性建筑
-(id) GetBuildingItemByName:(NSString*) itemName  BuildingType:(DABuildingType) bType;
//获得一般类物品对象 蛋类物品 加工类物品  交通工具类物品 道具类物品
-(id) GetGeneralItemByName:(NSString*) itemName GeneralItemType:(DAGeneralItemType) gType;
//获得禽类物品 如：幼鸡  成鸡  收获期孔雀
-(id) GetPoultryItemByName:(NSString*) itemName;
//获得特殊类别的物品,金币
-(id) GetMoneyItemByName:(NSString*) itemName;


-(void) privateInit;
@end
