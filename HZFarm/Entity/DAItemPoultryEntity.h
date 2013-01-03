//
//  DAItemPoultryEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//禽类实体
@interface DAItemPoultryEntity : NSObject
{
    NSString * sysName;
    NSString * disName;
    int     SellPrice;
    int     BuyPrice;
    NSString * imagePath;
    int  nSizeX;
    int  nSizeY;
    BOOL  BTrans;//是否可以转换
    NSString  *TransDestName;
    int TransNeedTime;
    NSString * HaveStates;//可以拥有状态
    BOOL    BCanlay;//是否产蛋
    int    LayNeedTime;
    NSString * LayName;//产蛋目标系统名
    int NeedWater;//消耗水分
    int NeedFood;//消耗食料
    int nLaySum;//下蛋次数
    int nLayNum;//下蛋数量
}
@property(nonatomic,retain)    NSString * sysName;
@property(nonatomic,retain)    NSString * disName;
@property   int     SellPrice;
@property   int     BuyPrice;
@property(nonatomic,retain)    NSString * imagePath;
@property   int  nSizeX;
@property   int  nSizeY;
@property   BOOL  BTrans;//是否可以转换
@property(nonatomic,retain)    NSString  *TransDestName;
@property   int TransNeedTime;
@property(nonatomic,retain)    NSString * HaveStates;//可以拥有状态
@property   BOOL    BCanlay;//是否产蛋
@property   int    LayNeedTime;
@property(nonatomic,retain)    NSString * LayName;//产蛋目标系统名
@property   int NeedWater;//消耗水分
@property   int NeedFood;//消耗食料
@property  int nLaySum;//下蛋次数
@property  int nLayNum;//下蛋数量
//////
@end
