//
//  CallForSth.m
//  Sheds
//
//  Created by Any on 12-4-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "CallForSth.h"
#import "MedicineSelectLayer.h"

@implementation CallForSth

@synthesize _delegate;
@synthesize _bubbleSp;
@synthesize _contentSp;
@synthesize _type;

- (id)initWithType:(NeedType)type delegate:(id)delegate
{
    if ((self = [super init])) {
        self._delegate = delegate;
        
        self._type = type;
        
        NSInteger eggType = [self._delegate reportType];  
        NSString *name;
        switch (type) {
            case harvest:
                name = @"medal.png";
                break;
            case lay:
                name = [NSString stringWithFormat:@"egg%d.png", eggType];
                break;
            case food:
                name = @"eat.png";
                break;
            case water:
                name = @"glass.png";
                break;
            case medicineRed:
                name = @"medical_red.png";
                break;
            case medicineBlue:
                name = @"medical_blue.png";
                break;
            case medicineGreen:
                name = @"medical_green.png";
                break;
                
            default:
                break;
        }
        CCCallFuncN* call_iws1 = [CCCallFuncN actionWithTarget:self selector:@selector(CallPop:)];
        CCCallFuncN *loop = [CCCallFuncN actionWithTarget:self selector:@selector(loop:)];
        CCAction *allAct = [CCSequence actions:call_iws1, loop, nil];
        
        _bubbleSp = [[CCSprite alloc] initWithFile:@"bubble.png"];
        self._bubbleSp.position = ccp(0, 0);
        self._bubbleSp.anchorPoint = ccp(0.2, 0.2);
        [self addChild:self._bubbleSp z:1];
        
        
        _contentSp = [[CCSprite alloc] initWithFile:name];
        self._contentSp.position = ccp(self._bubbleSp.contentSize.width/2, self._bubbleSp.contentSize.height/2+5);
        self._contentSp.anchorPoint = ccp(0.5, 0.5);
        [self._bubbleSp addChild:self._contentSp z:1];
        
        CGSize size = [self._delegate reportSize];
        if (size.width <= self._bubbleSp.contentSize.width) {
            self.scale = 0.7;
        }
        
        [self._bubbleSp runAction:allAct];
        
    }
    
    return self;
}


-(void) CallPop :(id)sender
{
    CCAction *delay = [CCDelayTime actionWithDuration: 0.05f];
    CCAction *scaleBigger1 = [CCScaleTo actionWithDuration:0.1 scale:1.15];
    CCAction *scaleBigger2 = [CCScaleTo actionWithDuration:0.07 scale:1.05];
    CCAction *scaleSmaller = [CCScaleTo actionWithDuration:0.1 scale:1];
    CCAction *act = [CCSequence actions: scaleBigger1, delay,scaleSmaller,delay,scaleBigger2, delay,scaleSmaller, nil];
    [sender runAction:act];
}

- (void)loop:(id)sender
{
    CCAction *delay = [CCDelayTime actionWithDuration: 0.5f];
    CCAction *scaleBigger1 = [CCScaleTo actionWithDuration:0.2 scale:1.15];
    CCAction *scaleSmaller = [CCScaleTo actionWithDuration:0.2 scale:1];
    CCAction *act = [CCSequence actions: scaleBigger1, scaleSmaller,delay, nil];
    CCAction *result = [CCRepeatForever actionWithAction:act];
    [sender runAction:result];
}

- (void)onTouched
{
    CCAction *callFunc = [CCCallFunc actionWithTarget:self selector:@selector(selectMedicine:)];
    CCAction *callFunc1 = [CCCallFunc actionWithTarget:self selector:@selector(goToLay:)];
    CCAction *callFunc2 = [CCCallFunc actionWithTarget:self selector:@selector(havest:)];
    
    if (self._type == lay) {
        [self._bubbleSp runAction:callFunc1];
    }
    else if (self._type == harvest) {
        [self._bubbleSp runAction:callFunc2];
    }
    else {
        //[self._bubbleSp runAction:callFunc];
    }
}

- (void)selectMedicine:(id)sender
{
    [self._bubbleSp runAction:[CCScaleTo actionWithDuration:0.1f scale:0]];
    self._bubbleSp.visible = NO;
    MedicineSelectLayer *layer = [[MedicineSelectLayer alloc] initWithNeed:self._type delegate:self];
    layer.position = self._bubbleSp.position;
    layer.anchorPoint = ccp(1, 0);
    [self addChild:layer z:2 tag:100];
    [layer release];
}

- (void)goToLay:(id)sender
{
    [self._delegate goToLay];
}

- (void)havest:(id)sender
{
    [self._delegate harvest];
}

#pragma MedicineSelectDelegate mark
- (void)selectEnd:(BOOL)isRight
{
    self._bubbleSp.scale = 0;
    self._bubbleSp.visible = YES;
    [self._bubbleSp runAction:[CCScaleTo actionWithDuration:0.05f scale:1]];
    [self._delegate medicineSelectEnd:isRight];
    [self removeChildByTag:100 cleanup:YES];
}

- (void)dealloc
{
    self._bubbleSp = nil;
    self._contentSp = nil;
    [super dealloc];
}

@end
