//
//  DAItemVehicle.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAGeneralItemEntity.h"

@interface DAItemVehicle : DAGeneralItemEntity
{
    int nSpeed;// 速度
    int nCapacity;//每格容量
    int nBags;//格数
    int nCargo;//每格承载货物
    int nNeedPrice;//载货需要金币
    int nNeedTime;//载货需要时间
}
@property   int nSpeed;// 速度
@property   int nCapacity;//每格容量
@property   int nBags;//格数
@property   int nCargo;//每格承载货物
@property   int nNeedPrice;//载货需要金币
@property   int nNeedTime;//载货需要时间
@end
