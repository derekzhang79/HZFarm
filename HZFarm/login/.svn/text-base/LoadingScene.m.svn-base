//
//  LoadingScene.m
//  MapTest
//
//  Created by mac on 12-4-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoadingScene.h"
#import "Import.h"
#import "SceneManager.h"

#import "DAHenHousesDataService.h"
#import "DAPFactoryService.h"
#import "DAShopService.h"
#import "DAWareHouseService.h"
#import "DAWorldMapService.h"
#import "DAPlayerService.h"

@implementation LoadingScene

@synthesize processDegree;
@synthesize username;
@synthesize layer0;
@synthesize layer1;
@synthesize layer2;


-(id) init
{
    if (self = [super init])
    {
        int width = [[CCDirector sharedDirector] winSize].width;
        int height = [[CCDirector sharedDirector] winSize].height;
        
        CCSprite *background = [CCSprite spriteWithFile:@"base maps.png"];
        background.position = ccp(width/2, height/2);
        [self addChild:background];
        
        CCSprite *process1 = [CCSprite spriteWithFile:@"loading条_1.png"];
        process1.anchorPoint = ccp(0, 1);
        process1.position = CCXY(206, 660);
        [self addChild:process1 z:2 tag:21];
        [process1 setTextureRect:CGRectMake(0, 0, 0, 51)];   //631
        
        CCSprite *process2 = [CCSprite spriteWithFile:@"loading条.png"];
        process2.anchorPoint = ccp(0, 1);
        process2.position = CCXY(206, 660);
        [self addChild:process2 z:1];
        
        CCSprite *loading = [CCSprite spriteWithFile:@"加载中.png"];
        loading.position = CCXY(327, 622);
        [self addChild:loading]; 
        
        CCSprite *point1 = [CCSprite spriteWithFile:@"点.png"];
        point1.position = CCXY(398, 635);
        point1.opacity = 0;
        [self addChild:point1 z:1 tag:5]; 
        
        CCSprite *point2 = [CCSprite spriteWithFile:@"点.png"];
        point2.position = CCXY(428, 635);
        point2.opacity = 0;
        [self addChild:point2 z:1 tag:6]; 
        
        CCSprite *point3 = [CCSprite spriteWithFile:@"点.png"];
        point3.position = CCXY(458, 635);
        point3.opacity = 0;
        [self addChild:point3 z:1 tag:7]; 
        
        id call1 = [CCCallFuncN actionWithTarget:self selector:@selector(animationPoint1:)];
        id call2 = [CCCallFuncN actionWithTarget:self selector:@selector(animationPoint2:)];
        id call3 = [CCCallFuncN actionWithTarget:self selector:@selector(animationPoint3:)];
        id call4 = [CCCallFuncN actionWithTarget:self selector:@selector(allPoints:)];
        CCAction *p1 = [CCSequence actions:
                                [CCDelayTime actionWithDuration: DURINGTIME],
                                call1,
                                [CCDelayTime actionWithDuration: DURINGTIME],
                                call2,
                                [CCDelayTime actionWithDuration: DURINGTIME],
                                call3,
                                [CCDelayTime actionWithDuration: DURINGTIME],
                                call4,
                                nil];
        CCAction* pf1 = [CCRepeatForever actionWithAction:p1];
        [point1 runAction:pf1];
        
        /****************************************/
//        [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
        
        
        
        /****************************************/
        
        [self scheduleUpdate];
    }
    return self;
}

- (void)startTheBackgroundJob {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	// wait for 3 seconds before starting the thread, you don't have to do that. This is just an example how to stop the NSThread for some time
    
	//[NSThread sleepForTimeInterval:3];
    [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
    [pool release];
	
}

- (void)makeMyProgressBarMoving {
    
//	float actual = [threadProgressView progress];
//	threadValueLabel.text = [NSString stringWithFormat:@"%.2f", actual];
//	if (actual < 1) {
//		threadProgressView.progress = actual + 0.01;
//		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(makeMyProgressBarMoving) userInfo:nil repeats:NO];
//	}
    [DAPlayerService sharePlayerService].curPlayerName=username; 
    [[DAPlayerService sharePlayerService]RefeshPlayerData];        
    [[DAWorldMapService shareWorldMapService]RefreshWorldMap];
    [[DAHenHousesDataService shareHenHouseDataService]RefreshAllHenHouseData];
    [[DAPFactoryService sharePFactoryService]RefreshFactoryData];
    [[DAShopService shareShopService]RefreshShopData];
    [[DAWareHouseService shareWareHouseService]RefreshWareHouseData];
    
    self.layer0 = [CCLayer node];
    self.layer1 = [WorldLayer node];
    [self.layer0 addChild:layer1 z:0];
    self.layer2 = [Firstlayermenu node];
    [self.layer0 addChild:layer2 z:1];
    
    
    //isGameStart = YES;
	
}

-(void) update: (ccTime)timeDelta
{
    CCSprite *process = (CCSprite*)[self getChildByTag:21];
    
    [process setTextureRect:CGRectMake(0, 0, processDegree, 51)];
    self.processDegree += 20.f;
    
//    if (self.processDegree < 631)
//    {
        if (self.processDegree>100 && !isInit)
        {
            isInit = YES;
            [NSThread detachNewThreadSelector:@selector(startTheBackgroundJob) toTarget:self withObject:nil];
//            [DAPlayerService sharePlayerService].curPlayerName=username;
//            [[DAPlayerService sharePlayerService]RefeshPlayerData];
//            [[DAWorldMapService shareWorldMapService]RefreshWorldMap];
        }
//        
//        if (self.processDegree>250)
//        {
//            [[DAHenHousesDataService shareHenHouseDataService]RefreshAllHenHouseData];
//            [[DAPFactoryService sharePFactoryService]RefreshFactoryData];
//            [[DAShopService shareShopService]RefreshShopData];
//            [[DAWareHouseService shareWareHouseService]RefreshWareHouseData];
//        }
//        
//        if (self.processDegree >= 400)
//        {
//            self.layer0 = [CCLayer node];
//            self.layer1 = [WorldLayer node];
//            [self.layer0 addChild:layer1 z:0];
//            self.layer2 = [Firstlayermenu node];
//            [self.layer0 addChild:layer2 z:1];
//        }
//        
//        if (self.processDegree >= 630)
//        {
//            if (!isGameStart)
//            {
//                [SceneManager goFirstScene: self.layer0];
//                isGameStart = YES;
//            }
//        }
//    }
//    else 
//    {
//        //[SceneManager goFirstScene: layer0];
//    }
    
    //if (self.processDegree >= 630)
        //[SceneManager goFirstScene: self.layer0];
    if (self.processDegree >= 631 && !isGameStart)
    {
        isGameStart = YES;
        //[self unschedule:_cmd];
        [SceneManager goFirstScene: self.layer0];
    }
}

-(void) animationPoint1: (id)sender
{
    CCSprite *point1 = (CCSprite*)[self getChildByTag:5];
    point1.opacity = 255;
}

-(void) animationPoint2: (id)sender
{
    CCSprite *point2 = (CCSprite*)[self getChildByTag:6];
    point2.opacity = 255;
}

-(void) animationPoint3: (id)sender
{
    CCSprite *point3 = (CCSprite*)[self getChildByTag:7];
    point3.opacity = 255;
}

-(void) allPoints: (id)sender
{
    CCSprite *point1 = (CCSprite*)[self getChildByTag:5];
    CCSprite *point2 = (CCSprite*)[self getChildByTag:6];
    CCSprite *point3 = (CCSprite*)[self getChildByTag:7];
    point1.opacity = 0;
    point2.opacity = 0;
    point3.opacity = 0;
}

-(void) loadGame: (NSString*) username
{

}


-(void) dealloc
{
    [super dealloc];
}


@end
