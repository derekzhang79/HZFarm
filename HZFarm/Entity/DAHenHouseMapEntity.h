//
//  DAHenHouseMapEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DAHenHouseMapEntity : NSObject
{
    NSMutableArray * itemArr;//鸡舍中建筑列表
}
@property(nonatomic,retain) NSMutableArray* itemArr;
@end
