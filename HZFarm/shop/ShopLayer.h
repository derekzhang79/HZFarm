//
//  ShopLayer.h
//  Shop
//
//  Created by hzbc on 4/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "WomanWarning.h"
#import "SWScrollView.h"
#import "DAPlayerService.h"
#import "WomanWarningDelegate.h"

@interface ShopLayer : CCLayer <WomanWarningDelegate>{
    WomanWarning *womanWarn;
    NSMutableArray *updateItems;
    NSMutableArray *toolItems;
    SWScrollView *updataView;
    NSMutableArray *updateNames;
    NSMutableArray *toolNames;
    DAPlayerService *shopPlayerService;
    CCLabelAtlas *labelGoldBottom;
}

@property(nonatomic, assign) WomanWarning *womanWarn;

-(void) goToUpgrade;

@end
