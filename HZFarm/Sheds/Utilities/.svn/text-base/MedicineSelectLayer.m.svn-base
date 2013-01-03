//
//  MedicineSelectLayer.m
//  Sheds
//
//  Created by baijing on 4/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MedicineSelectLayer.h"


@implementation MedicineSelectLayer

@synthesize _currSelect;
@synthesize _frames;
@synthesize _delegate;
@synthesize _needSelect;

- (id)initWithNeed:(NSInteger)need delegate:(id)delegate
{
    if ((self = [super init])) {
        self._delegate = delegate;
        
        self._needSelect = need;
        
        NSMutableArray *names = [NSMutableArray arrayWithObjects:@"medical_red.png", @"medical_blue.png", @"medical_green.png", nil];
        _frames = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i=0; i<=2; i++) {
            CCSprite *sp = [[CCSprite alloc] initWithFile:@"bubble_1.png"];
            sp.position = ccp(i*70-100, 0);
            sp.anchorPoint = ccp(0, 0);
            [self addChild:sp];
            CCSprite *pieceSp = [CCSprite spriteWithFile:[names objectAtIndex:i]];
            pieceSp.position = ccp(sp.contentSize.width/2, sp.contentSize.height/2);
            pieceSp.anchorPoint = ccp(0.5, 0.5);
            [sp addChild:pieceSp];
            [self._frames addObject:sp];
            [sp release];
        }
        
        
        self.isTouchEnabled = YES;
    }
    
    return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    CCAction *scaleAct = [CCScaleTo actionWithDuration:0.1 scale:1.1];
    self._currSelect = -1;
    for (int i=0; i<=2; i++) {
        CCSprite *sp = [self._frames objectAtIndex:i];
        if (CGRectContainsPoint(sp.boundingBox, location)) {
            [sp runAction:scaleAct];
            self._currSelect = i;
            return;
        }
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    
    if (self._currSelect == -1) {
        return;
    }
    CCAction *scaleAct = [CCScaleTo actionWithDuration:0.03 scale:1];
    CCAction *callFunc = [CCCallFunc actionWithTarget:self selector:@selector(selectEnd:)];
    CCAction *act = [CCSequence actions:scaleAct, callFunc, nil];
    CCSprite *sp = [self._frames objectAtIndex:self._currSelect];
    if (CGRectContainsPoint(sp.boundingBox, location)) {
        [sp runAction:act];
    }
    else{
        [sp runAction:scaleAct];
    }
}

- (void)selectEnd:(id)sender
{
    BOOL isRight = (self._currSelect+4==self._needSelect);
    [self._delegate selectEnd:isRight];
}

- (void)dealloc
{
    self._frames = nil;
    [super dealloc];
    
}

@end
