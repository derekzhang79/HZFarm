//
//  StateDialog.m
//  MapTest
//
//  Created by Any on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StateDialog.h"
#import "PoultryModel.h"
#import "Contents.h"
#import "DAItemService.h"
#import "DAItemPoultryEntity.h"
#import "DAItemInHenHouse.h"
#import "DAHenHousesDataService.h"

@implementation StateDialog

- (id)initWithType:(NSInteger)type delegate:(id)delegate  father:(id)father
{
    if ((self = [super init])) {
        Contents *m = [Contents getContents];
        DAItemPoultryEntity *entityYoung = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:type isAdult:NO isHarvest:NO]];
        DAItemPoultryEntity *entityAdult = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:type isAdult:YES isHarvest:NO]];
        NSInteger lifeLong = (entityYoung.TransNeedTime+entityAdult.TransNeedTime)/3600;
        NSInteger maxTime = entityAdult.nLaySum;
        
        _father = father;
        _delegate = delegate;
        _frame = [[CCSprite alloc] initWithFile:@"circle_1.png"];
        _frame.position = ccp(0,0);
        _frame.anchorPoint = ccp(0,0);
        [self addChild:_frame];
        
        _lifeLong = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%dh", lifeLong] fontName:@"Helvetica-Bold" fontSize:32];
        _lifeLong.position = ccp(35,75);
        [_frame addChild:_lifeLong];
        
        _eggFrames = [[NSMutableArray alloc] initWithCapacity:7];
        for (int i=0; i<maxTime; i++) {
            CCSprite *eggFrame = [[CCSprite alloc] initWithFile:@"eggFrame.png"];
            eggFrame.position = ccp(30+(eggFrame.contentSize.width+10)*i,40);
            [_frame addChild:eggFrame z:1];
            [_eggFrames addObject:eggFrame];
            [eggFrame release];
        }
        
        _eggs = [[NSMutableArray alloc] initWithCapacity:7];
        for (int i=0; i<maxTime; i++) {
            CCSprite *egg = [[CCSprite alloc] initWithFile:[NSString stringWithFormat:@"egg%d.png",type]];
            egg.position = ccp(30+(egg.contentSize.width+10)*i,40);
            [_frame addChild:egg z:2];
            [_eggFrames addObject:egg];
            [egg release];
        }
        
        _bar = [[ProgressBar alloc] initWithTimeLong:2 delegate:self];
        [self addChild:_bar];
        _bar.visible = NO;
    }
    
    return self;
}

- (id)initWithPoutry:(PoultryModel*)pty  henHouseId:(NSString*)henHouseId delegate:(id)delegate  father:(id)father
{
    if ((self = [super init])) {
        Contents *m = [Contents getContents];
        DAItemPoultryEntity *entityAdult = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:pty._type isAdult:YES isHarvest:NO]];
        DAItemInHenHouse *item = [[DAHenHousesDataService shareHenHouseDataService] GetItemFromHenHouse:henHouseId TableID:pty._poultryId];
        NSInteger age = item.ActiveGrowTime/3600;
        NSInteger maxTime = entityAdult.nLaySum;
        NSInteger currTimes = item.layEggs;
        
        _father = father;
        _delegate = delegate;
        _frame = [[CCSprite alloc] initWithFile:@"circle_1.png"];
        _frame.position = ccp(0,0);
        _frame.anchorPoint = ccp(0,0);
        [self addChild:_frame];
        
        _lifeLong = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%dh", age] fontName:@"Helvetica-Bold" fontSize:32];
        _lifeLong.position = ccp(20,75);
        [_frame addChild:_lifeLong];
        
        _eggFrames = [[NSMutableArray alloc] initWithCapacity:7];
        for (int i=0; i<maxTime; i++) {
            CCSprite *eggFrame = [[CCSprite alloc] initWithFile:@"eggFrame.png"];
            eggFrame.position = ccp(20+(eggFrame.contentSize.width+5)*i,40);
            [_frame addChild:eggFrame z:1];
            [_eggFrames addObject:eggFrame];
            [eggFrame release];
        }
        
        _eggs = [[NSMutableArray alloc] initWithCapacity:7];
        for (int i=0; i<currTimes; i++) {
            CCSprite *egg = [[CCSprite alloc] initWithFile:[NSString stringWithFormat:@"egg%d.png",pty._type]];
            egg.position = ccp(20+(egg.contentSize.width+5)*i,40);
            [_frame addChild:egg z:2];
            [_eggFrames addObject:egg];
            [egg release];
        }
        
        _bar = [[ProgressBar alloc] initWithTimeLong:2 delegate:self];
        [self addChild:_bar];
        _bar.visible = NO;
    }
    
    return self;
}

- (void)progressEnd
{
    [_delegate stateTimeOver:_father];
}

- (void)dealloc
{
    _frame = nil;
    _eggFrames = nil;
    _eggs = nil;
    _bar = nil;
    [super dealloc];
}

@end
