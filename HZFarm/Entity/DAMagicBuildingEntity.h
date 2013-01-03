//
//  DAMagicBuildingEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DABuildingEntity.h"
#import "DAMagicForHenHouseEntity.h"
#import "DAForWareHouseEntity.h"
#import "DAForProcessHouseEntity.h"

@interface DAMagicBuildingEntity : DABuildingEntity
{
    //DAMagicBuildingType   magicType;//装饰类别
    NSString        *    magicInfo;//影响叠加系数
    
    DAMagicForHenHouseEntity *HenHouseParam;//对鸡舍影响参数
   // DAForWareHouseEntity * wareHouseParam;//对仓库影响参数
   // DAForProcessHouseEntity * processHouseParam;//对加工厂影响参数
    
}
@property (nonatomic,retain) NSString * magicInfo;
@property(nonatomic,retain) DAMagicForHenHouseEntity *HenHouseParam;
@end
