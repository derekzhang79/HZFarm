//
//  chick.m
//  MapTest
//
//  Created by Any on 12-3-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//100 99

#import "ChickView.h"
#import "CallForSthLayer.h"
#import "PoultryModel.h"
#import "ProgressBar.h"
#import "Contents.h"
#import "EightDirFinder.h"
#import "PoultryTarget.h"
#import "DAPlayerService.h"

@implementation ChickView

@synthesize _viewServer;
@synthesize _callLayer;
@synthesize _model;
@synthesize _chickActions;
@synthesize _shadow;
@synthesize _finder;
@synthesize _foot_young;
@synthesize _foot_adult;


- (id)initWithModel:(PoultryModel *)model{
    if ((self = [super init])) {
        
        self._model = model;
        self._model._delegate = self;
        self._viewServer = nil;
        
        NSMutableDictionary *_eatAction = [[NSMutableDictionary alloc] initWithCapacity:8];
        NSMutableDictionary *_stayAction = [[NSMutableDictionary alloc] initWithCapacity:8];
        NSMutableDictionary *_walkAction = [[NSMutableDictionary alloc] initWithCapacity:8];
        NSMutableDictionary *_adultEatAction = [[NSMutableDictionary alloc] initWithCapacity:8];
        NSMutableDictionary *_adultStayAction = [[NSMutableDictionary alloc] initWithCapacity:8];
        NSMutableDictionary *_adultStayAction2 = [[NSMutableDictionary alloc] initWithCapacity:8];
        NSMutableDictionary *_adultWalkAction = [[NSMutableDictionary alloc] initWithCapacity:8];
        
        //图片集
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"%d.plist", self._model._type]];        
        CCSpriteBatchNode *spriteSheet_chick = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"%d.png", self._model._type]];
        [self addChild:spriteSheet_chick];
        
        Contents *m = [Contents getContents];
        
        NSMutableDictionary *frameTime = [[m._frame objectForKey:@"frameTime"] 
                                          objectForKey:[NSString stringWithFormat:@"poultry%d", self._model._type]] ;
        NSMutableDictionary *frameNum = [[m._frame objectForKey:@"frameNum"] 
                                         objectForKey:[NSString stringWithFormat:@"poultry%d", self._model._type]] ;
        
        
        //八个方向
        for (enum Direction dir=back; dir<=rightUp; dir++) {
            if (dir <= 5) {
                //小鸡吃东西
                NSMutableArray *eatAnimFrames = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"eat"] intValue]; ++i) {
                    [eatAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                              [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 1, dir, i]]];
                }
                CCAnimation *eatAnim = [CCAnimation animationWithFrames:eatAnimFrames delay:[[frameTime objectForKey:@"eat"] floatValue]];
                CCAction *eatAnimAct = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:eatAnim restoreOriginalFrame:NO] times:3];
                CCAction *eatCall = [CCCallFunc actionWithTarget:self selector:@selector(eatCall:)];
                CCAction *eatAct = [CCSequence actions:eatAnimAct, eatCall, nil];
                [_eatAction setObject:eatAct forKey:[NSNumber numberWithInt:dir]];
                
                //小鸡待机
                NSMutableArray *stayAnimFrames = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"stay"] intValue]; ++i) {
                    [stayAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 2, dir, i]]];
                }
                CCAnimation *stayAnim = [CCAnimation animationWithFrames:stayAnimFrames delay:[[frameTime objectForKey:@"stay"] floatValue]];
                [_stayAction setObject:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:stayAnim restoreOriginalFrame:NO]] forKey:[NSNumber numberWithInt:dir]];
                
                //小鸡走路
                NSMutableArray *walkAnimFrames = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"walk"] intValue]; ++i) {
                    [walkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 4, dir, i]]];
                }
                CCAnimation *walkAnim = [CCAnimation animationWithFrames:walkAnimFrames delay:[[frameTime objectForKey:@"walk"] floatValue]];
                [_walkAction setObject:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim restoreOriginalFrame:NO]] forKey:[NSNumber numberWithInt:dir]];
                
                //大鸡吃东西
                NSMutableArray *adultEatAnimFrames = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"adultEat"] intValue]; ++i) {
                    [adultEatAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                   [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 5, dir, i]]];
                }
                CCAnimation *adultEatAnim = [CCAnimation animationWithFrames:adultEatAnimFrames delay:[[frameTime objectForKey:@"adultEat"] floatValue]];
                CCAction *adultEatAnimAct = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:adultEatAnim restoreOriginalFrame:NO] times:3];
                CCAction *adultEatCall = [CCCallFunc actionWithTarget:self selector:@selector(eatCall:)];
                CCAction *adultEattAct = [CCSequence actions:adultEatAnimAct, adultEatCall, nil];
                [_adultEatAction setObject:adultEattAct forKey:[NSNumber numberWithInt:dir]];
                
                //大鸡待机1
                NSMutableArray *adultStayAnimFrames = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"adultStay"] intValue]; ++i) {
                    [adultStayAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                    [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 6, dir, i]]];
                }
                CCAnimation *adultStayAnim = [CCAnimation animationWithFrames:adultStayAnimFrames delay:[[frameTime objectForKey:@"adultStay"] floatValue]];
                [_adultStayAction setObject:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:adultStayAnim restoreOriginalFrame:NO]] forKey:[NSNumber numberWithInt:dir]];
                
                //大鸡待机2
                NSMutableArray *adultStayAnimFrames2 = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"adultStay2"] intValue]; ++i) {
                    [adultStayAnimFrames2 addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                     [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 7, dir, i]]];
                }
                CCAnimation *adultStayAnim2 = [CCAnimation animationWithFrames:adultStayAnimFrames2 delay:[[frameTime objectForKey:@"adultStay2"] floatValue]];
                [_adultStayAction2 setObject:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:adultStayAnim2 restoreOriginalFrame:NO]] forKey:[NSNumber numberWithInt:dir]];
                
                //大鸡走路
                NSMutableArray *adultWalkAnimFrames = [NSMutableArray array];
                for(int i = 1; i <= [[frameNum objectForKey:@"adultWalk"] intValue]; ++i) {
                    [adultWalkAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                    [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, 8, dir, i]]];
                }
                CCAnimation *adultWalkAnim = [CCAnimation animationWithFrames:adultWalkAnimFrames delay:[[frameTime objectForKey:@"adultWalk"] floatValue]];
                [_adultWalkAction setObject:[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:adultWalkAnim restoreOriginalFrame:NO]] forKey:[NSNumber numberWithInt:dir]];
            }//if
            else
            {
                NSInteger dirRight = dir-3;
                [_eatAction setObject:[_eatAction objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
                [_stayAction setObject:[_stayAction objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
                [_walkAction setObject:[_walkAction objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
                [_adultEatAction setObject:[_adultEatAction objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
                [_adultStayAction setObject:[_adultStayAction objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
                [_adultStayAction2 setObject:[_adultStayAction2 objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
                [_adultWalkAction setObject:[_adultWalkAction objectForKey:[NSNumber numberWithInt:dirRight]] forKey:[NSNumber numberWithInt:dir]];
            }
            
        }//for
        self._chickActions = [NSMutableDictionary dictionaryWithCapacity:6];
        [self._chickActions setObject:_eatAction forKey:[NSNumber numberWithInt:1]];
        [self._chickActions setObject:_stayAction forKey:[NSNumber numberWithInt:2]]; 
        [self._chickActions setObject:_walkAction forKey:[NSNumber numberWithInt:4]];
        [self._chickActions setObject:_adultEatAction forKey:[NSNumber numberWithInt:5]];
        [self._chickActions setObject:_adultStayAction forKey:[NSNumber numberWithInt:6]]; 
        [self._chickActions setObject:_adultStayAction2 forKey:[NSNumber numberWithInt:7]]; 
        [self._chickActions setObject:_adultWalkAction forKey:[NSNumber numberWithInt:8]];
        
        
        _finder = [[EightDirFinder alloc] initWithPos:self._model._pos];
        
        NSMutableDictionary *foot = [[m._frame objectForKey:@"poultryFootPoint"] 
                                     objectForKey:[NSString stringWithFormat:@"footPoint%d", self._model._type]];
        int x = [[[foot objectForKey:@"young"] objectForKey:@"x"] intValue];
        int y = [[[foot objectForKey:@"young"] objectForKey:@"y"] intValue];
        self._foot_young = ccp(x, y);
        x = [[[foot objectForKey:@"adult"] objectForKey:@"x"] intValue];
        y = [[[foot objectForKey:@"adult"] objectForKey:@"y"] intValue];
        self._foot_adult = ccp(x, y);
        
        self.position = [self calcPosByFoot];
        [self flipProcess];
        if (self._model._isAdult == YES) {
            [self runAction:[[self._chickActions objectForKey:[NSNumber numberWithInt:self._model._poultryAction+4]] objectForKey:[NSNumber numberWithInt:self._model._direction]]];
        }
        else
        {
            [self runAction:[[self._chickActions objectForKey:[NSNumber numberWithInt:self._model._poultryAction]] objectForKey:[NSNumber numberWithInt:self._model._direction]]];
        }
        
        _shadow = [[CCSprite alloc] initWithFile:@"shadow1.png"];
        self._shadow.position = ccp(0, 0);
        self._shadow.anchorPoint = ccp(-0.5, -0.55);
        [self addChild:self._shadow z:-1];
        
        _callLayer = [[CallForSthLayer alloc] init];
        [self addChild:self._callLayer z:99];
        
        
        if (self._model._isHungry) {
            [self callForFood];
        }
        if (self._model._isThirsty) {
            [self callForWater];
        }
        if (self._model._isReadyLay) {
            [self callForLay];
        }
        if (self._model._isSick) {
            [self callForMedicine:RANDOM(3, 5)];
        }
    }
    return self;
}

- (void)flipProcess
{
    if (self._model._direction >= 6) {
        self.flipX = YES;
    }
    else
    {
        self.flipX = NO;
    }
}

- (CGPoint)getDis
{
    CGPoint foot;
    if (self._model._isAdult == YES) {
        foot = self._foot_adult;
    }
    else{
        foot = self._foot_young;
    }
    foot = ccpSub(foot, ccp(self.contentSize.width/2,self.contentSize.height/2));
    return foot;
}

- (CGPoint)calcPosByFoot
{
    CGPoint foot = [self getDis];
    CGPoint pos = ccp(self._model._pos.x, self._model._pos.y+foot.y);
    return pos;
}

- (void)eatCall:(id)sender
{
    [self._model hasEat];
}

- (void)dealCollision:(NSMutableArray*)fences
{
    if ([self._model._target isAnyTarget] == NO) {
        NSInteger dir = [self._finder dealWithColl:fences currDir:self._model._direction];
        if (dir != -1) {
            [self._model turnTo:dir];
        }
    }
}

#pragma chickModelDelegate mark
- (void)updatePos
{
    if (self._model._isUpdatePos==NO) {
        return;
    }
    CGFloat bili_x = self.boundingBox.size.width/self._shadow.contentSize.width/2;
    CGFloat bili_y = self.boundingBox.size.height/self._shadow.contentSize.height/4;
    self._shadow.scaleX = bili_x;
    self._shadow.scaleY = bili_y;
    self._callLayer.position = ccp(self.contentSize.width/2, self.contentSize.height);
    
    self.position = [self calcPosByFoot];
    self._finder._pos = self._model._pos;
}

- (void)animChange
{
    [self stopAllActions];
    NSInteger actId;
    [self flipProcess];
    if (self._model._isAdult == NO) {
        actId = self._model._poultryAction;
    }
    else{
        actId = self._model._poultryAction+4;
        if (self._model._poultryAction == stay) {//待机2
            NSInteger act = RANDOM(1, 100);
            if (act > 50) {
                actId += 1;
            }
        }
    }
    
    [self runAction:[[self._chickActions objectForKey:[NSNumber numberWithInt:actId]] objectForKey:[NSNumber numberWithInt:self._model._direction]]];
}

- (void)growUp
{
    NSMutableArray *frames = [NSMutableArray array];
    NSInteger actId = self._model._poultryAction;
    NSInteger dir = self._model._direction;
    if (dir >= 6) {
        dir -= 3;
    }
    [frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                       [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, actId, dir, 1]]];
    [frames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                       [NSString stringWithFormat:@"%d_%d_%d_%d.png", self._model._type, actId+4, dir, 1]]];
    CCAnimation *anim = [CCAnimation animationWithFrames:frames delay:0.08f];
    CCAction *callFunc = [CCCallFunc actionWithTarget:self selector:@selector(growUpCallBack:)];
    CCAction *animAct = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:anim restoreOriginalFrame:NO] times:5];
    CCAction *act = [CCSequence actions:animAct, callFunc, nil];
    [self runAction:act];  
}  

- (void)callForHarvest
{
    [self._callLayer callForHarvest:self];
}

- (void)growUpCallBack:(id)sender
{
    [self animChange];
}

- (void)callForFood
{
    [self._callLayer callForFood:self];
}

- (void)callForWater
{
    [self._callLayer callForWater:self];
}

- (void)callForMedicine:(NSInteger)medKind
{
    switch (medKind) {
        case 3:
            [self._callLayer callForRedMedicine:self];
            break;
        case 4:
            [self._callLayer callForBlueMedicine:self];
            break;
        case 5:
            [self._callLayer callForGreenMedicine:self];
            break;
            
        default:
            break;
    }
}

- (void)callForLay
{
    [self._callLayer callForLay:self];
}

- (void)laying:(NSInteger)timeLong
{
    ProgressBar *bar = [[ProgressBar alloc] initWithTimeLong:timeLong delegate:self];
    bar.position = ccp(0, self.boundingBox.size.height);
    bar.anchorPoint = ccp(0, 0);
    [self addChild:bar z:5 tag:100];
    [self._callLayer lay];
    [bar release];
}

- (void)hasAte
{
    [self._callLayer eat];
}

- (void)hasDrinked
{
    [self._callLayer drink];
}

#pragma CallForSthDelegate mark
- (CGPoint)reportTopPos
{
    NSInteger halfHeight = self.boundingBox.size.height/2;
    return ccp(self.position.x, self.position.y + halfHeight);
}

- (void)medicineSelectEnd:(BOOL)isRight
{
    if (isRight == YES) {
        if ([self._model payForMedicine] == YES) {
            [self._model recoverFromSick];
            [self._callLayer recover];
        }
    }
    else{
        [self._viewServer showWarning:@"悲剧啊，吃错药了！！"];
    }
}

- (void)UnAbleUpdate
{
    self._model._isUpdatePos = NO;
}

- (void)goToLay
{
    if ([self._model goToLay] == NO) {
        [self._viewServer showWarning:@"稍后再点，亲~~"];
    }
}

- (void)harvest
{
    [self._viewServer harvest:self];
    [self._callLayer harvest];
}

- (NSInteger)reportType
{
    return self._model._type;
}

- (CGSize)reportSize
{
    return self.contentSize;
}

- (void)dataHarvest:(id)sender
{
    [self._viewServer harvestEnd:self];
}

#pragma ProgressBarDelegate mark
- (void)progressEnd
{
    [self removeChildByTag:100 cleanup:YES];
    [self._model lay];
}

- (void) dealloc
{
    self._chickActions = nil;
    self._shadow = nil;
	[super dealloc];
    
}

@end
