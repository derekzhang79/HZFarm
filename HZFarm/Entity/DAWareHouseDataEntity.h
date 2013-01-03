//
//  DAWareHouseDataEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"
//仓库实体

//struct DAItemInWareHouse {
//    NSString *sysName;
//    int iNum;
//};
@interface DAWareHouseDataEntity : NSObject
{
    NSMutableArray * ItemEggs;//蛋类物品
    NSMutableArray * ItemProducts;//加工产品类物品
    NSMutableArray * ItemPoultry;//禽类物品(收获期)
    NSMutableArray * ItemVehicle;//交通工具类物品
    NSMutableArray * ItemProp;//道具类物品
}
@property(nonatomic,retain)    NSMutableArray * ItemEggs;//蛋类物品
@property(nonatomic,retain)    NSMutableArray * ItemProducts;//加工产品类物品
@property(nonatomic,retain)    NSMutableArray * ItemPoultry;//禽类物品(收获期)
@property(nonatomic,retain)    NSMutableArray * ItemVehicle;//交通工具类物品
@property(nonatomic,retain)    NSMutableArray * ItemProp;//道具类物品
@end
