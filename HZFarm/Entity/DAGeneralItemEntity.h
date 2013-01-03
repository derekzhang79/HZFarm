//
//  DAGeneralItemEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"
//一般性物品类
@interface DAGeneralItemEntity : NSObject
{
    NSString *sysName;
    NSString *disName;
    DAGeneralItemType  itemType;
    BOOL    CanBuy;
    BOOL    CanSell;
    int     nBuyPrice;
    int     nSellPrice;
    NSString   * imagePath;
    
    
    
}
@property(nonatomic,retain)  NSString* sysName;
@property(nonatomic,retain)  NSString* disName;
@property(nonatomic,retain)  NSString* imagePath;
@property   DAGeneralItemType   itemType;
@property   BOOL                CanSell;
@property   int                 nSellPrice;
@property   BOOL                CanBuy;
@property   int                 nBuyPrice;
@end
