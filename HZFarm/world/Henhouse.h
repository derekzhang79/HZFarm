//
//  Henhouse.h
//  MapTest
//
//  Created by hzbc on 12-3-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Worldlayerprotocol.h"



@interface Henhouse :  CCSprite {
    
    CCMenu *buildmenu ;
    id <Worldlayerprotocol> worldlayerprotocoll;
    CCSprite *pet;
    int linesize;
    CCSprite *petgear;
    int houselevel;
    CCSprite *smallicon;
    NSMutableArray *iconmutablerray;
    
    NSString *iid;
    CCMenuItemImage *undercolor;
    CCMenuItemImage *sure;
    CCMenu *menuhasbeentap;
    CCMenuItemImage *levelup;
    BOOL isleveluporgoginglevelup;
    CCMenuItemImage *inhenhouseen;

}
@property (nonatomic, assign)id <Worldlayerprotocol> worldlayerprotocoll;//背景
@property (readwrite, nonatomic) int linesize;
@property (readwrite, nonatomic) int houselevel;
@property (readwrite, nonatomic)     NSString *iid;
@property (readwrite, nonatomic) CCMenuItemImage *sure;
@property (readwrite, nonatomic)  CCMenu *menuhasbeentap;
@property (readwrite, nonatomic)  CCMenuItemImage *levelup;
@property (readwrite, nonatomic)  CCMenuItemImage *inhenhouseen;
@property (readwrite, nonatomic)   BOOL isleveluporgoginglevelup;;


+(id) Henhouse:(int)level;
+(id) Henhouseview:(int)level;

-(void)showtheiconofhouse:(BOOL)SHOW ICONKIND:(EFFECTIONSTOHOUSE)iconkind ISSENDERCALMDOWN:(bool)ISDOWN;
-(CCNode *)getthespritewithiconkind:(EFFECTIONSTOHOUSE)iconkind ISSENDERCALMDOWN:(bool)ISDOWN;

@end
