//
//  DAPFactoryService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAHeader.h"
#import "DAPFactoryDataEntity.h"
#import "DAItemInFactory.h"
#import "DAProductItemInfo.h"

@interface DAPFactoryService : NSObject
{
    DAPFactoryDataEntity *factoryData;
    NSArray *allProductItems;
}

+(DAPFactoryService*) sharePFactoryService;
-(void)RefreshFactoryData;
-(NSArray*) GetDataFromFactoryID:(NSString*) factoryID;
-(void) OnItemAdd:(DAItemInFactory*)item;

#pragma mark    加工产品接口
//获得物品的加工系数
-(float) getKpramByItemName:(NSString*)iName;
//获得加工品类别名字
-(NSString*) getProductItemTypeNameByItem:(NSString*)iName;

-(void)privateInit;

//-(void) StartFactoryTask;//开启加工任务监听
//-(void) StopFactoryTask;//Stop 加工任务监听
@property(nonatomic,retain)DAPFactoryDataEntity  * factoryData;
@property(nonatomic,retain)NSArray* allProductItems;
@end
