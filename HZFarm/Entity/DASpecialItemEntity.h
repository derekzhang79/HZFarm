//
//  DASpecialItemEntity.h
//  MapTest
//
//  Created by liwensheng on 12-4-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DASpecialItemEntity : NSObject
{
    NSString * sysName;
    NSString * disName;
    int nMoney;
    int nDiamond;
}
@property(nonatomic,retain) NSString * sysName;
@property(nonatomic,retain) NSString * disName;
@property int nMoney;
@property  int nDiamond;
@end
