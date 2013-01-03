//
//  DAPFactoryDataEntity.h
//  HZFarm
//
//  Created by liwensheng on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DAPFactoryDataEntity : NSObject
{
    NSMutableArray * ItemsInfactory;
}
-(NSArray*) GetDataFromFactoryID:(NSString*)factoryID;
@property(nonatomic,retain) NSMutableArray  *ItemsInfactory;
@end
