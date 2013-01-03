//
//  LogoAnimation.m
//  MapTest
//
//  Created by mac on 12-4-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "LogoAnimation.h"
#import "SceneManager.h"

@implementation LogoAnimation

#define DURINGTIME 1.6

-(void) dealloc
{
    [super dealloc];
}

-(id) init
{
    if (self = [super initWithColor:ccc4(255, 255, 255, 255)])
    {
        int width = [[CCDirector sharedDirector] winSize].width;
        int height = [[CCDirector sharedDirector] winSize].height;
        
        id call = [CCCallFuncN actionWithTarget:self selector:@selector(start:)];
        
        
        CCSprite *logo = [CCSprite spriteWithFile:@"HZBC_LOGO.png"];
        logo.position = ccp(width/2, height/2);
        logo.opacity = 0;
        [self addChild:logo];
        
        CCAction *p1 = [CCSequence actions:
                        [CCFadeIn actionWithDuration:DURINGTIME],
                        [CCDelayTime actionWithDuration: 2.5f],
                        [CCFadeOut actionWithDuration:DURINGTIME],
                        call,
                        nil];
        [logo runAction:p1];
        
    }
    return self;
}

-(void) start: (id)sender
{
    [SceneManager goLogin];
}

@end
