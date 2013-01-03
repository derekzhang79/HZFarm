//
//  Staticfunctionalobject.h
//  MapTest
//
//  Created by hzbc on 12-4-23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TECHLAB.h"
#import "Worldlayerprotocol.h"

@interface Staticfunctionalobject : CCSprite {
    CCMenu *buildmenu ;
     CCSprite *undercolorbig;
    CGPoint selfpositionintiels;
    int linesize;
     id <Worldlayerprotocol> worldlayerprotocoll;
    CCSprite *undercolor;
    EFFECTIONSTOHOUSE effect;
    CCMenuItemImage *sure;
    

   
}
@property (readwrite, nonatomic) CGPoint selfpositionintiels;;
@property (readwrite, nonatomic) int linesize;
@property (nonatomic, assign)id <Worldlayerprotocol> worldlayerprotocoll;//背景
@property (nonatomic, assign) CCSprite *undercolor;//背景
@property (nonatomic, assign) CCMenuItemImage *sure;;
@property (nonatomic, assign) EFFECTIONSTOHOUSE effect;
+(id) Staticfunctionalobject:(EFFECTIONSTOHOUSE)effectionkind;
+(id) Staticfunctionalobjectinview:(EFFECTIONSTOHOUSE)effectionkind;

@end
