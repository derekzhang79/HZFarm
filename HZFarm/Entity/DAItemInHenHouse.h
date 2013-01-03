//
//  DAItemInHenHouse.h
//  MapTest
//
//  Created by liwensheng on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//鸡舍中物品 记录
@interface DAItemInHenHouse : NSObject
{
    NSString *tID;//主键id
    NSString *henHouseID;//鸡舍id
    NSString * sysName;//系统名称
    NSString * joinTime;//加入时间
    NSString * lastWaterTime;//上一次喂水时间
    NSString * lastFoodTime;//上一次喂食料时间
    NSString * lastLayTime;//上一次下蛋时间
    int ActiveGrowTime;//有效成找时间
    int layEggs;//下蛋个数
}
@property(nonatomic,retain)    NSString *tID;//主键id
@property(nonatomic,retain)    NSString *henHouseID;//鸡舍id
@property(nonatomic,retain)    NSString * sysName;//系统名称
@property(nonatomic,retain)    NSString * joinTime;//加入时间
@property(nonatomic,retain)    NSString * lastWaterTime;//上一次喂水时间
@property(nonatomic,retain)    NSString * lastFoodTime;//上一次喂食料时间
@property(nonatomic,retain)    NSString * lastLayTime;//上一次下蛋时间
@property   int ActiveGrowTime;//有效成找时间
@property  int layEggs;//下蛋个数

@end
