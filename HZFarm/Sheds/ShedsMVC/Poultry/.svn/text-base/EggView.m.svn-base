//
//  MyCocos2DClass.m
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "EggView.h"
#import "EggModel.h"

@implementation EggView

@synthesize _delegate;
@synthesize _egg;
@synthesize _model;
@synthesize _shadow;

- (id)initWithEggModel:(EggModel *)egg
{
    if ((self = [super init])) {
        
        self._delegate = nil;
        
        self._model = egg;
        
        _egg = [[CCSprite alloc] initWithFile:[NSString stringWithFormat:@"egg%d.png",egg._type]];
        self._egg.position = egg._pos;
        [self addChild:self._egg z:2];
        _shadow = [[CCSprite alloc] initWithFile:@"shadow1.png"];
        self._shadow.position = egg._pos;
        self._shadow.anchorPoint = ccp(0.5, 1);
        self._shadow.scale = 0.33;
        [self addChild:self._shadow z:1];
    }
    
    
    return self;
}

- (void)eggHarvest:(id)sender
{
    [self._delegate eggHarvestEnd:self];
}

- (void)dealloc
{
    self._model = nil;
    self._egg = nil;
    self._shadow = nil;
    [super dealloc];
}

@end
