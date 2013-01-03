//
//  SiLiaoChi.m
//  Sheds
//
//  Created by Any on 12-4-13.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SiLiaoChi.h"


@implementation SiLiaoChi

@synthesize _up;
@synthesize _down;
@synthesize _fall;
@synthesize _addAction_up;
@synthesize _addAction_down;
@synthesize _type;
@synthesize _delegate;
@synthesize _shadow;
@synthesize _addAction_fall;

- (id)initWithType:(NSInteger)type delegate:(id)delegate
{
    if ((self = [super init])) {
        
        self._delegate = delegate;
        
        self._type = type;
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"food.plist"];        
        CCSpriteBatchNode *spriteSheet_chick = [CCSpriteBatchNode batchNodeWithFile:@"food.png"];
        [self addChild:spriteSheet_chick];
        
        NSMutableArray *animFrames_up = [NSMutableArray array];
        NSMutableArray *animFrames_down = [NSMutableArray array];
        NSMutableArray *animFrames_fall = [NSMutableArray array];
        if (self._type == shiCao) {
            for(int i = 1; i <= 4; ++i) {
                [animFrames_up addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                          [NSString stringWithFormat:@"food_up_%d.png",  i]]];
            }
            for (int i=1; i<=5; ++i) {
                [animFrames_down addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                          [NSString stringWithFormat:@"food_down_%d.png",  i]]];
            }
            for (int i=1; i<=8; ++i) {
                [animFrames_fall addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"yellowFall%d.png",  i]]];
            }
        }
        else{
            for(int i = 1; i <= 4; ++i) {
                [animFrames_up addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                          [NSString stringWithFormat:@"water_up_%d.png",  i]]];
            }
            for (int i=1; i<=5; ++i) {
                [animFrames_down addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                            [NSString stringWithFormat:@"water_down_%d.png",  i]]];
            }
            for (int i=1; i<=9; ++i) {
                [animFrames_fall addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                            [NSString stringWithFormat:@"blueFall%d.png",  i]]];
            }
        }
        
        
        CCAnimation *upAnim = [CCAnimation animationWithFrames:animFrames_up delay:0.15f];
        CCAction *upAnimAct = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:upAnim restoreOriginalFrame:NO] times:4];
        CCAction *upCall = [CCCallFunc actionWithTarget:self selector:@selector(addCall:)];
        self._addAction_up = [CCSequence actions:upAnimAct, upCall, nil];
        
        CCAnimation *downAnim = [CCAnimation animationWithFrames:animFrames_down delay:0.5f];
        self._addAction_down = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:downAnim restoreOriginalFrame:NO] times:1];
        
        CCAnimation *fallAnim = [CCAnimation animationWithFrames:animFrames_fall delay:0.33f];
        CCAction *fallAnimAct = [CCRepeat actionWithAction:[CCAnimate actionWithAnimation:fallAnim restoreOriginalFrame:NO] times:1];
        CCAction *fallCall = [CCCallFunc actionWithTarget:self selector:@selector(hideFall:)];
        self._addAction_fall = [CCSequence actions:fallAnimAct, fallCall, nil];;
        
        NSInteger food = [self._delegate reportFood];
        NSInteger water = [self._delegate reportWater];
        if (self._type == shiCao) {
            _shadow = [[CCSprite alloc] initWithFile:@"shadow.png"];
            self._shadow.position = ccp(515,460);
            self._shadow.anchorPoint = ccp(0.5, 0.5);
            [self addChild:self._shadow z:0];
            
            _down = [[CCSprite alloc] initWithSpriteFrameName:@"food_down_1.png"];
            self._down.position = ccp(530,500);
            self._down.anchorPoint = ccp(0.5, 0.5);
            [self setNum:food];
            [self addChild:self._down z:1];
            
            _up = [[CCSprite alloc] initWithSpriteFrameName:@"food_up_1.png"];
            self._up.position = ccp(530,500);
            self._up.anchorPoint = ccp(0.5, 0.5);
            [self addChild:self._up z:2];
            
            _fall = [[CCSprite alloc] init];
            self._fall.position = ccp(500,460);
            self._fall.anchorPoint = ccp(0.5, 0.5);
            [self addChild:self._fall z:3];
            
        }
        else{
            _shadow = [[CCSprite alloc] initWithFile:@"shadow.png"];
            self._shadow.position = ccp(515,220);
            self._shadow.anchorPoint = ccp(0.5, 0.5);
            [self addChild:self._shadow z:0];
            
            _down = [[CCSprite alloc] initWithSpriteFrameName:@"water_down_1.png"];
            self._down.position = ccp(530,260);
            self._down.anchorPoint = ccp(0.5, 0.5);
            [self setNum:water];
            [self addChild:self._down z:1];

            _up = [[CCSprite alloc] initWithSpriteFrameName:@"water_up_1.png"];
            self._up.position = ccp(530,260);
            self._up.anchorPoint = ccp(0.5, 0.5);
            [self addChild:self._up z:2];
            
            _fall = [[CCSprite alloc] init];
            self._fall.position = ccp(490,215);
            self._fall.anchorPoint = ccp(0.5, 0.5);
            [self addChild:self._fall z:3];
        }
        
        self.isTouchEnabled = YES;
    }
    
    return self;
}

- (void)add
{
    [self._up stopAllActions];
    [self._down stopAllActions];
    [self._fall stopAllActions];
    self._fall.visible = YES;
    [self._up runAction:self._addAction_up];
    [self._down runAction:self._addAction_down];
    [self._fall runAction:self._addAction_fall];
}

- (void)hideFall:(id)sender
{
    self._fall.visible = NO;
}

- (void)setNum:(NSInteger)num
{
    NSString *picName;
    if (self._type == shiCao) {
        if (num <= 0) {
            picName = @"food_down_1.png";
        }
        else if (num <= 20){
            picName = @"food_down_2.png";
        }
        else if (num <= 50) {
            picName = @"food_down_3.png";
        }
        else if (num <= 80) {
            picName = @"food_down_4.png";
        }
        else{
            picName = @"food_down_5.png";
        }
    }
    else{
        if (num <= 0) {
            picName = @"water_down_1.png";
        }
        else if (num <= 20){
            picName = @"water_down_2.png";
        }
        else if (num <= 50) {
            picName = @"water_down_3.png";
        }
        else if (num <= 80) {
            picName = @"water_down_4.png";
        }
        else{
            picName = @"water_down_5.png";
        }
    }
    [self._down setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:picName]];
}

- (void)addCall:(id)sender
{
    if (self._type == shiCao) {
        [self._delegate addFood];
    }
    else{
        [self._delegate addWater];
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    if (CGRectContainsPoint(self._up.boundingBox, location)) {
        [self add];
    }
}

- (CGRect)getRect
{
    //CGRect rect = self._down.boundingBox;
    //rect.size.width = CGRE
    
    return self._down.boundingBox;
}

- (void)dealloc
{
    self._up  = nil;
    self._down = nil;
    self._addAction_up = nil;
    self._addAction_down = nil;
    self._shadow  = nil;
    [super dealloc];
}

@end
