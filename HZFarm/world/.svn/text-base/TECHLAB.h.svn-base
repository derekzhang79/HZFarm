//
//  TECHLAB.h
//  MapTest
//
//  Created by hzbc on 12-4-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Worldlayerprotocol.h"

typedef enum
{
	TECHLABKIND = 0,
	FACTORY=1,
    WINDMILL=2,
    MACHINE,
} FUNCBUILSINGSLIND;
@interface TECHLAB : CCSprite
{
    id <Worldlayerprotocol> worldlayerprotocol;

        CCMenu *buildmenu ;
    CCSprite *myaslf;
    CCSprite *undercolorbig;
    FUNCBUILSINGSLIND kindd;
    CCSprite *factorypet;
    CCSprite *machinepet;
    CCSprite *windwillpet;
    CGPoint selfpositionintiels;
    int linesize;
    int buildkind;
    CCMenuItemImage *sure;
    
}
@property (nonatomic, assign)id <Worldlayerprotocol> worldlayerprotocol;//背景
@property (readwrite, nonatomic) CGPoint selfpositionintiels;;
@property (readwrite, nonatomic) int linesize;
@property (readwrite, nonatomic)    FUNCBUILSINGSLIND kindd;;

@property (readwrite, nonatomic)    CCMenuItemImage *sure;
+(id) TECHLAB:(FUNCBUILSINGSLIND) kind;
+(id) TECHLABinview:(FUNCBUILSINGSLIND) kind;

@end
