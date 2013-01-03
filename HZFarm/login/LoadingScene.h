//
//  LoadingScene.h
//  MapTest
//
//  Created by mac on 12-4-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Firstlayermenu.h"

#define DURINGTIME 0.5

@interface LoadingScene : CCLayer
{
    float       processDegree;
    NSString    *username;
    CCLayer     *layer0;
    CCLayer     *layer1;
    CCLayer     *layer2;
    bool        isGameStart;
    bool        isInit;
}

@property (nonatomic, assign) float processDegree;
@property (nonatomic, retain) NSString *username;

@property (nonatomic, retain) CCLayer *layer0;
@property (nonatomic, retain) CCLayer *layer1;
@property (nonatomic, retain) CCLayer *layer2;

-(void) loadGame: (NSString*) username;

@end
