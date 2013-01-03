//
//  SceneManager.m
//  MapTest
//
//  Created by mac on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SceneManager.h"
#import "Menu_Effect.h"
#import "Firstlayermenu.h"
#import "Login.h"

@interface SceneManager ()
+(void) go: (CCLayer *)layer;
+(CCScene*) wrap: (CCLayer*)layer;
@end


@implementation SceneManager

+(void) go:(CCLayer*)layer effectIndex:(int) index
{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [self wrap:layer];
    
    if ([director runningScene])
    {
        //根据字符串返回需要的类名称
        Class transition = Transitions(index);
        
        NSLog(@"hedafdf: %@", transition);
        
        //Old Method:CCXXXTransition->New Method:CCTransitionXXX
        [director replaceScene: [transition transitionWithDuration:TRANSITION_DURATION scene:newScene]];
    }
    else 
    {
        [director runWithScene:newScene];
    }
}

//不使用过度效果
+(void) go:(CCLayer*)layer
{
    CCDirector *director = [CCDirector sharedDirector];
    CCScene *newScene = [self wrap:layer];
    
    if ([director runningScene])
    {
        [director replaceScene: newScene];
    }
    else 
    {
        [director runWithScene:newScene];
    }
}

+(CCScene*) wrap: (CCLayer*) layer
{
    CCScene *newScene = [CCScene node];
    [newScene addChild: layer];
    return newScene;
}



/*******************************************************************/
+(void) goLogoAnimation
{
    CCLayer *layer = [LogoAnimation node];
    [self go: layer];
}

+(void) goLogin
{
    CCLayer *layer = [Login node];
    [self go: layer effectIndex:TRANSITION_FADE];
}

+(void) backLogin
{
    CCLayer *layer = [Login node];
    [self go: layer effectIndex:TRANSITION_FADEBL];
}

+(void) goFirstScene
{
    
    CCLayer *layer0 = [CCLayer node];
    CCLayer *layer1 = [WorldLayer node];
    CCLayer *layer2 = [Firstlayermenu node];
    [layer0 addChild:layer1 z:0];
    [layer0 addChild:layer2 z:1];
    [self go: layer0 effectIndex:TRANSITION_FADE];
}

+(void) goFirstScene: (CCLayer*)firstScene
{
    [self go: firstScene effectIndex:TRANSITION_FADE];
}

+(void) goSecondScene:(NSString *)shedsId
{
    ShedsController *sheds = [[ShedsController alloc] initWithID:shedsId];
    CCLayer *layer = (CCLayer*)sheds;
    [self go: layer effectIndex:TRANSITION_FADETR];
    [sheds release];
}

+(void) backFirstScene
{
    CCLayer *layer = [WorldLayer node];
    [self go: layer effectIndex:TRANSITION_FADEBL];
}

/**************************************************/
+(void) goHelp
{
    CCLayer *layer = [Menu_Help node];
    [self go: layer effectIndex:TRANSITION_FADETR];
}

+(void) goAbout
{
    CCLayer *layer = [Menu_About node];
    [self go: layer effectIndex:TRANSITION_FADETR];
}

+(void) goSetting
{
    CCLayer *layer = [Menu_Setting node];
    [self go: layer effectIndex:TRANSITION_FADETR];
}

@end












