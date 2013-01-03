//
//  MyCocos2DClass.m
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "FactoryAnim.h"


@implementation FactoryAnim

- (id)initWithTimeLong:(NSInteger)timeLong delegate:(id)delegate
{
    if ((self = [super init])) {
        
        _delegate = delegate;
        
        _bar = [[ProgressBar alloc] initWithTimeLong:5 delegate:self];
        _bar.position = ccp(680, 110);
        _bar.anchorPoint = ccp(0.5,0.5);
        [self addChild:_bar z:1 tag:100];
        
        //图片集
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"factory.plist"];        
        CCSpriteBatchNode *spriteSheet_chick = [CCSpriteBatchNode batchNodeWithFile:@"factory.plist"];
        [self addChild:spriteSheet_chick];
        
        _base = [[CCSprite alloc] initWithFile:@"process_0.png"];
        _base.position = ccp(730,60);
        [self addChild:_base z:2];
        
        _light = [[CCSprite alloc] initWithFile:@"光晕.png"];
        _light.position = ccp(730,80);
        _light.opacity = 0;
        [self addChild:_light z:1];
        
        NSMutableArray *loopAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 4; ++i) {
            [loopAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"1_1_%d.png", i]]];
        }
        CCAnimation *loopAnim = [CCAnimation animationWithFrames:loopAnimFrames delay:0.1];
        _loop = [[CCRepeatForever alloc] initWithAction:[CCAnimate actionWithAnimation:loopAnim restoreOriginalFrame:NO]];
        
        NSMutableArray *eruptAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 4; ++i) {
            [eruptAnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                        [NSString stringWithFormat:@"2_1_%d.png", i]]];
        }
        CCAnimation *eruptAnim = [CCAnimation animationWithFrames:eruptAnimFrames delay:0.1];
        _erupt = [[CCRepeat alloc] initWithAction:[CCAnimate actionWithAnimation:eruptAnim restoreOriginalFrame:NO] times:1];
        
        [_base runAction:_loop];
        
    }
    
    return self;
}


- (void)CallPop:(id)sender
{
    [_delegate processEnd];
}


#pragma ProgressBarDelegate mark
- (void)progressEnd
{
    [self removeChildByTag:100 cleanup:YES];
    [_base stopAllActions];
    [_base runAction:_erupt];
    CCAction *act1 = [CCFadeIn actionWithDuration:0.3];
    CCAction *act2 = [CCFadeOut actionWithDuration:0.3];
    CCCallFuncN* call_iws1 = [CCCallFuncN actionWithTarget:self selector:@selector(CallPop:)];
    CCAction *act = [CCSequence actions:act1,act2,act1,act2,act1,act2,call_iws1,nil];
    [_light runAction:act];
    CCParticleSystem *system = [ARCH_OPTIMAL_PARTICLE_SYSTEM particleWithFile:@"erupt.plist"];
    CCTexture2D *aTexture = [[CCTextureCache sharedTextureCache] addImage:@"星星.png"];
    [system setTexture:aTexture];
    system.positionType = kCCPositionTypeFree;
    [self addChild: system];
    
}


- (void)dealloc
{
    _bar = nil;
    _loop = nil;
    _base = nil;
    _light = nil;
    _erupt = nil;
    
}

@end
