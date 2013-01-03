//
//  Tilednode.h
//  MapTest
//
//  Created by hzbc on 12-4-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Tilednode :  CCNode {
    BOOL ISTREE;
    BOOL ISBLUE;
    BOOL ISHOUSE;
    BOOL ISROAD;
    BOOL ISCANADDOBJECT;
    BOOL ISORNAMENT;
}

@property (readwrite, nonatomic) BOOL ISTREE;
@property (readwrite, nonatomic) BOOL ISBLUE;
@property (readwrite, nonatomic) BOOL ISHOUSE;
@property (readwrite, nonatomic) BOOL ISROAD;
@property (readwrite, nonatomic) BOOL ISCANADDOBJECT;
@end
