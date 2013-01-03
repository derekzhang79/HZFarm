//
//  Menu_Effect.h
//  往死里喊
//
//  Created by mac on 12-1-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


//菜单过度效果类
#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define TRANSITION_DURATION (1.f)

enum
{
    TRANSITION_FADE,
    TRANSITION_ZOOMFLIP_X,
    TRANSITION_ZOOMFLIP_Y,
    TRANSITION_MOVEINLEFT,
    TRANSITION_ROTOZOOM,
    TRANSITION_FADETR,
    TRANSITION_FADEBL
};

@interface FadeWhiteTransition : CCTransitionFade 

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;

@end


@interface ZoomFlipXLeftOver : CCTransitionZoomFlipX 

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;

@end


@interface FlipYDownOver : CCTransitionFlipY 

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;

@end


@interface RotoZoom : CCTransitionRotoZoom

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;  

@end


@interface MoveInFromLeft : CCTransitionMoveInL

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;

@end


@interface FadeTR : CCTransitionFadeTR

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;  

@end


@interface FadeBL : CCTransitionFadeBL

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s;  

@end


/***********@implementation************/

@implementation FadeWhiteTransition

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s
{
	return [self transitionWithDuration:t scene:s withColor:ccWHITE];
}

@end


@implementation ZoomFlipXLeftOver

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s 
{
	return [self transitionWithDuration:t scene:s orientation:kOrientationLeftOver];
}

@end


@implementation FlipYDownOver

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s 
{
	return [self transitionWithDuration:t scene:s orientation:kOrientationDownOver];
}

@end


@implementation MoveInFromLeft

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s 
{
	return [self transitionWithDuration:t scene:s];
}

@end


@implementation RotoZoom

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s 
{
	return [[[self alloc] initWithDuration:t scene:s] autorelease];
}

@end


@implementation FadeTR : CCTransitionFadeTR

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s 
{
	return [[[self alloc] initWithDuration:t scene:s] autorelease];
}

@end


@implementation FadeBL : CCTransitionFadeBL

+(id) transitionWithDuration:(ccTime)t scene:(CCScene*)s 
{
	return [[[self alloc] initWithDuration:t scene:s] autorelease];
}

@end


static NSString *transitions[] =
{
	@"FadeWhiteTransition",
	@"ZoomFlipXLeftOver",
	@"FlipYDownOver",
    @"MoveInFromLeft",
    @"RotoZoom",
    @"FadeTR",
    @"FadeBL"
};

//id myObj = [[NSClassFromString(@"MySpecialClass") alloc] init];
//id myObj = [[MySpecialClass alloc] init];
//两种初始化结果是一样的。但是，如果你的程序中并不存在MySpecialClass这个类，下面的写法会出错，而上面的写法只是返回一个空对象而已。
//因此，在某些情况下，可以使用NSClassFromString来进行你不确定的类的初始化。
//NSClassFromString的好处是：
//1 弱化连接，因此并不会把没有的Framework也link到程序中。
//2 不需要使用import，因为类是动态加载的，只要存在就可以加载。因此如果你的toolchain中没有某个类的头文件定义，而你确信这个类是可以用的，那么也可以用这种方法。

Class Transitions(int sceneIndex)
{	
	//[CCRadialCCWTransition node];
	NSString *trans = transitions[sceneIndex];
	Class c = NSClassFromString(trans);
	return c;
}











