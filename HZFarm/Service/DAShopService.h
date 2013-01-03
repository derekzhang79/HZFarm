//
//  DAShopService.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAShopDataEntity.h"

@interface DAShopService : NSObject
{
    DAShopDataEntity *shopData;
}
+(DAShopService *) shareShopService;
-(void) RefreshShopData;
@property (readonly) DAShopDataEntity *shopData;
@end
