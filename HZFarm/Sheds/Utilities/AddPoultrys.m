//
//  AddPoultrys.m
//  Sheds
//
//  Created by Any on 12-3-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "AddPoultrys.h"
#import "MenuLogoOP.h"
#import "ShedsTerrain.h"

@implementation AddPoultrys

@synthesize _delegate;

- (id)init {
    
    if ((self = [super init])) {  
        _delegate = nil;
        _sp = nil;
        _spType = -1;
        _isAblePut = NO;
        
        self.isTouchEnabled = YES;
    }
    
    return self;
}

- (void)removeSprite{
    if (_sp == nil) {
        return;
    }
    [self removeChild:_sp cleanup:YES];
    [_sp release];
    _sp = nil;
    NSLog(@"removeChild:sp cleanup");
}

- (void)setSprite:(NSString *)name pos:(CGPoint)pos{
    NSLog(@"adder ready to add a %@", name);
    _sp = [[CCSprite alloc] initWithFile:[NSString stringWithFormat:@"%@.png", name]];
    _sp.position = pos;
    [self addChild:_sp];
}

- (void)updateSprite:(CGPoint)pos{
    _sp.position = pos;
    ShedsTerrain *terrain = [ShedsTerrain getShedsTerrain];
    if ([terrain isInCultivationArea:pos] == YES) {
        _isAblePut = YES;
        _sp.color = ccc3(255,255,255);
    }
    else {
        _isAblePut = NO;
        _sp.color = ccc3(255,150,150);
    }
}

- (void)readyToAdd:(NSString *)name pos:(CGPoint)pos unlockState:(NSMutableDictionary *)unlockState{
    for (NSInteger type=1; type<=8; type++) {
        NSString *key = [NSString stringWithFormat:@"poultry%d",type];
        if ([key isEqualToString:name] == YES) {
            if ([[unlockState objectForKey:key] boolValue] == YES) {
                [self setSprite:name pos:pos];
                _spType = type;
                return;
            }
            else{
                NSLog(@"adder can't add unlocked poultry");
                _spType =  -1;
            }
        }
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    
    MenuLogoOP *op = [MenuLogoOP getSharedMenuLogoOp];
    [op recoverSprite];
    [self updateSprite:location];
    if (_sp != nil && _isAblePut == YES) {
        [self._delegate addPoultry:_spType position:_sp.position]; 
    }
    [self removeSprite];
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    [self updateSprite:location];
}

- (void) dealloc
{
	[super dealloc];
    
}

@end
