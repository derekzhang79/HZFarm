//
//  DAWorldMapEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"
#import "DABuildingEntity.h"

@interface DAWorldMapEntity : NSObject
{
    NSMutableArray * itemArr;//建筑列表
}
@property(nonatomic,retain) NSMutableArray *itemArr;
@end
