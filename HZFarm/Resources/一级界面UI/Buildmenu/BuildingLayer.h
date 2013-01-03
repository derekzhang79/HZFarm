//
//  BuildingView.h
//  FARM
//
//  Created by Yunky on 12-4-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SWScrollView.h"
#import "DAHeader.h"
#import "WorldLayer.h"
#import "Firstlayermenu.h"
#import "DABuildingEntity.h"
#import "DAItemService.h"

@interface BuildingLayer : CCLayer 
{
    NSMutableArray *generalBuildButton, *decorationBuildButton;
    CCMenuItemImage *bottomButton;
    DAPlayerService *shopPlayerService;
    NSArray *generalBuildMoney;
    NSArray *money;
}

//- (void)newProduct;

-(void)generalBuilding;

- (void)decoration;

@end
