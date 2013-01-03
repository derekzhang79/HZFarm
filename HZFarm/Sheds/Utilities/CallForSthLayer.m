//
//  CallForSthLayer.m
//  Sheds
//
//  Created by Any on 12-4-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "CallForSthLayer.h"
#import "CallForSth.h"

@implementation CallForSthLayer

@synthesize _sprites;

- (id)init
{
    if ((self = [super init])) {
        
        _sprites = [[NSMutableArray alloc] initWithCapacity:10];
        
        
        self.isTouchEnabled = YES;
    }
    return self;
}

- (BOOL)isShow:(NeedType)type
{
    BOOL isShow = YES;
    for (CallForSth *element in self._sprites) {
        if (element._type<type) {
            element.visible = NO;
        }
        else{
            isShow = NO;
        }
    }
    return isShow;
}

- (void)setShow
{
    NeedType maxType = harvest;
    CallForSth *sp = nil;
    for (CallForSth *element in self._sprites) {
        if (element._type>=maxType) {
            maxType = element._type;
            sp = element;
        }
    }
    if (sp) {
        sp.visible = YES;
        if (sp._type==harvest) {
            [sp._delegate UnAbleUpdate];
        }
    }
}

- (BOOL)isAdd:(NeedType)type
{
    for (CallForSth *element in self._sprites) {
        if (element._type==type) {
            return NO;
        }
    }
    return YES;
}

- (void)callForHarvest:(id)delegate
{
    if ([self isAdd:food] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:harvest delegate:delegate];
    sp.visible = [self isShow:harvest];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)callForFood:(id)delegate
{
    if ([self isAdd:food] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:food delegate:delegate];
    sp.visible = [self isShow:food];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)callForWater:(id)delegate
{
    if ([self isAdd:water] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:water delegate:delegate];
    sp.visible = [self isShow:water];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)callForLay:(id)delegate
{
    if ([self isAdd:lay] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:lay delegate:delegate];
    sp.visible = [self isShow:lay];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)callForRedMedicine:(id)delegate
{
    if ([self isAdd:medicineRed] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:medicineRed delegate:delegate];
    sp.visible = [self isShow:medicineRed];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)callForBlueMedicine:(id)delegate
{
    if ([self isAdd:medicineBlue] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:medicineBlue delegate:delegate];
    sp.visible = [self isShow:medicineBlue];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)callForGreenMedicine:(id)delegate
{
    if ([self isAdd:medicineGreen] == NO) {
        return;
    }
    CallForSth *sp = [[CallForSth alloc] initWithType:medicineGreen delegate:delegate];
    sp.visible = [self isShow:medicineGreen];
    sp.position = ccp(-20,10);
    [self._sprites addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)eat
{
    for (CallForSth *element in self._sprites) {
        if (element._type==food) {
            [self removeChild:element cleanup:YES];
            [self._sprites removeObject:element];
            [self setShow];
            return;
        }
    }
}

- (void)drink
{
    for (CallForSth *element in self._sprites) {
        if (element._type==water) {
            [self removeChild:element cleanup:YES];
            [self._sprites removeObject:element];
            [self setShow];
            return;
        }
    }
}

- (void)recover
{
    for (CallForSth *element in self._sprites) {
        if (element._type==medicineRed || element._type==medicineBlue || element._type==medicineGreen)
        {
            [self removeChild:element cleanup:YES];
            [self._sprites removeObject:element];
            [self setShow];
            return;
        }
    }
}

- (void)lay
{
    for (CallForSth *element in self._sprites) {
        if (element._type==lay)
        {
            [self removeChild:element cleanup:YES];
            [self._sprites removeObject:element];
            [self setShow];
            return;
        }
    }
}

- (void)harvest
{
    for (CallForSth *element in self._sprites) {
        if (element._type==harvest)
        {
            [self removeChild:element cleanup:YES];
            [self._sprites removeObject:element];
            [self setShow];
            return;
        }
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    for (CallForSth *element in self._sprites) {
        if (element.visible==YES) {
            if (CGRectContainsPoint(element._bubbleSp.boundingBox, location)) {
                [element onTouched];
            }
        }
    }
    
    
}

- (void)dealloc
{
    self._sprites = nil;
    [super dealloc];
}

@end
