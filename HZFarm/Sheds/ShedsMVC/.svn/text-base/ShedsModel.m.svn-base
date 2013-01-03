//
//  ShedsModel.m
//  Sheds
//
//  Created by Any on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShedsModel.h"
#import "Contents.h"
#import "PoultryModel.h"
#import "DAHenHousesDataService.h"
#import "DAWorldMapService.h"
#import "DAPlayerService.h"
#import "DAItemInHenHouse.h"
#import "DAItemService.h"
#import "Contents.h"
#import "DateTool.h"
#import "DAMagicInHenHouse.h"
#import "DAMagicForHenHouseEntity.h"

@implementation ShedsModel

@synthesize _delegate;
@synthesize _shedsId;
@synthesize _unlockedStates;
@synthesize _score;   
@synthesize _level;
@synthesize _money;       
@synthesize _diamond;      
@synthesize _maxPoultryNum; 
@synthesize _water;
@synthesize _food;
@synthesize _waterMagic;
@synthesize _foodMagic;
@synthesize _factoryLevel;
@synthesize _poultryModels;
@synthesize _eggs;
@synthesize _fences;
@synthesize _timing;

- (void)initMagic
{
    DAHenHousesDataService *henHousesDataService = [DAHenHousesDataService shareHenHouseDataService];
    DAWorldMapService *worldMapService = [DAWorldMapService shareWorldMapService];
    
    _unlockedStates = [[NSMutableDictionary alloc] initWithCapacity:10];
    [self._unlockedStates setObject:[NSNumber numberWithBool:YES] forKey:@"poultry1"];
    [self._unlockedStates setObject:[NSNumber numberWithBool:YES] forKey:@"poultry2"];
    
    NSString *accessStr = @"";
    NSArray *magic = [henHousesDataService getMagicItemsFromHenHouseID:self._shedsId];
    for (DAMagicInHenHouse *element in magic) {
        DAMagicBuildingEntity *build = [worldMapService getBuildingByID:element.magicID];
        DAMagicForHenHouseEntity *entity = build.HenHouseParam;
        self._waterMagic += entity.kWater;
        self._foodMagic += entity.kFood;
        if (entity.kFeedItems && ![entity.kFeedItems isEqualToString:@""]) {
            if ([entity.kFeedItems hasPrefix:accessStr]) {
                accessStr = entity.kFeedItems;
            }
        }
    }
    if ([accessStr isEqualToString:@""]==NO) {
        NSArray *access = [accessStr componentsSeparatedByString:@"#"];
        NSInteger count = [access count];
        for (int i=3; i<=2+[access count]; i++) {
            [self._unlockedStates setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"poultry%d", i]];
        }
    }
    
}

- (void)initFactory
{
    DAHenHousesDataService *henHousesDataService = [DAHenHousesDataService shareHenHouseDataService];
    DAFactoryInHenHouse *factory = nil;
    factory = [henHousesDataService getFactoryInHenHouse:self._shedsId];
    if (factory) {
        self._factoryLevel = factory.nProductLevel;
    }
    else {
        self._factoryLevel = 0;
    }
}

- (id)initWithShedsId:(NSString *)shedsId
{
    if ((self = [super init])) {
        self._delegate = nil;
        
        self._shedsId = shedsId;
        
        DAHenHousesDataService *henHousesDataService = [DAHenHousesDataService shareHenHouseDataService];
        DAHenHouseDataEntity *entity = [[henHousesDataService getHenHouseData:shedsId] retain];
        DAWorldMapService *worldMapService = [DAWorldMapService shareWorldMapService];
        DABreedingBuildingEntity *build =  (DABreedingBuildingEntity *)[worldMapService getBuildingByID:shedsId];
        DAPlayerService *playerService = [DAPlayerService sharePlayerService];
        DAPlayerEntity *playerEntity = playerService.playerEntity;
        
        self._score = playerEntity.nExp;
        self._level = build.nLevel;
        self._money = playerEntity.nMoney;
        self._diamond = playerEntity.nDiamond;
        self._maxPoultryNum = build.nFeedMax;
        self._water = entity.restWater;
        self._food = entity.restFood;
        
        [self initMagic];
        
        _eggs = [[NSMutableArray alloc] initWithCapacity:10];
        
        _poultryModels = [[NSMutableArray alloc] initWithCapacity:20];
        NSMutableArray *poultrysProperty = entity.itemArr;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CGPoint pos = ccp(size.width/3, size.height/2);
        for (DAItemInHenHouse *element in poultrysProperty) {
            PoultryModel *pty = [[PoultryModel alloc] initWithProperty:element poultryId:element.tID position:pos delegate:self];
            [self._poultryModels addObject:pty];
            [pty release];
        }
        [self calcFoodAndWater:poultrysProperty];
        
        _fences = [[NSMutableDictionary alloc] initWithCapacity:6];
        for (int i=1; i<=self._level; i++) {
            if (i <= 6) {
                [self._fences setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"fence%d", i]];
            }
        }
        
        
        
        _timing = [[Timing alloc] initWithTimeLong:10 delegate:self];
        
        [entity release];
    }
    
    return self;
}

- (NSInteger)foodNeedOneTime:(NSMutableArray *) poultrysProperty
{
    NSInteger need = 0;
    if ([poultrysProperty count] == 0) {
        return 0;
    }
    for (DAItemInHenHouse *element in poultrysProperty) {
        DAItemPoultryEntity *poultryEntity = [[DAItemService shareService] GetPoultryItemByName:element.sysName];
        NSInteger needOne = poultryEntity.NeedFood;
        need += needOne;
    }
    return need;
}


- (void)calcFoodAndWater:(NSMutableArray *) poultrysProperty
{
    NSInteger need = [self foodNeedOneTime:poultrysProperty];
    if (need == 0) {
        return;
    }
    NSString *lastSignOut = [DAPlayerService sharePlayerService].playerEntity.lastLeave;
    NSTimeInterval interval_sign = [DateTool GetTimeSpanFromEarly:lastSignOut];
    NSInteger needTimes = interval_sign/(EATBETWEEN*SECONDS_ONE_HOUR);
    NSString *needDate = [DateTool GetTimeFromSpanAndEarly:needTimes*EATBETWEEN*SECONDS_ONE_HOUR EarlyDate:lastSignOut];
    NSString *lastEat = needDate;
    NSString *lastDrink = needDate;
    
    for (PoultryModel *element in self._poultryModels) {
        [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:element._poultryId BEat:YES HenHouseID:self._shedsId Cost:need/[self._poultryModels count] Time:lastEat];
        [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:element._poultryId BEat:NO HenHouseID:self._shedsId Cost:need/[self._poultryModels count] Time:lastDrink];
    }
}

- (BOOL)addPoultry:(NSInteger)type  position:(CGPoint)pos{
    BOOL isAble = NO;
    Contents *m = [Contents getContents];
    NSString *sysName = [m getSysNameByType:type isAdult:NO isHarvest:NO];
    DAItemPoultryEntity *poultryEntity = [[DAItemService shareService] GetPoultryItemByName:sysName];
    NSInteger price = poultryEntity.BuyPrice;
    
    if (price<=self._money && [self._poultryModels count]<self._maxPoultryNum) {
        DAState *state = [[DAPlayerService sharePlayerService] AddPoultryToHenHouse:self._shedsId PoultryName:sysName];
        if (state.bErr == YES) {
            isAble = NO;
        }
        else
        {
            PoultryModel *pty = [[PoultryModel alloc] initWithPos:pos poultryId:state.ID type:type delegate:self];
            self._money -= price;
            [self._poultryModels addObject:pty];
            if (self._delegate != nil) {
                [self._delegate addPoultry:pty];
            }
            isAble = YES;
            [pty release];
        }
    }
    return isAble;
}

- (void)step:(ccTime) dt{
    if (self._delegate != nil) {
        [self._delegate colliTest];
    }
    for (id element in self._poultryModels) {
        [element step:dt];
    }
    [self._timing step:dt];
}

- (void)upGrade:(NSInteger)destGrade
{
    if (self._level < destGrade) {
        self._level = destGrade;
        self._maxPoultryNum = self._level*2;
        [self._delegate upGrade:destGrade];
    }
    
}

- (void)pleaseGoToEat
{
    for (PoultryModel *element in self._poultryModels) {
        if (element._isHungry) {
            [element goToEat];
        }
    }
}

- (void)pleaseGoToDrink
{
    for (PoultryModel *element in self._poultryModels) {
        if (element._isThirsty == YES) {
            [element goToDrink];
        }
    }
}

#pragma TimingDelegate mark
- (void)onTimeOver
{
    for (PoultryModel *element in self._poultryModels) {
        [[DAPlayerService sharePlayerService] ChgPoultryActiveByTID:element._poultryId ActiveTime:element._age];
    }
    [self._timing reset];
}

#pragma ShedsModelServer mark
- (void)addFood
{
    [[DAPlayerService sharePlayerService] AddWaterAndFoodByHenHouseID:self._shedsId BWater:NO BFood:YES];
    self._food = 100;
    [self pleaseGoToEat];
}

- (void)addWater
{
    [[DAPlayerService sharePlayerService] AddWaterAndFoodByHenHouseID:self._shedsId BWater:YES BFood:NO];
    self._water = 100;
    [self pleaseGoToDrink];
}

- (void)addEgg:(EggModel *)egg
{
    [self._eggs addObject:egg];
    if (self._delegate != nil) {
        [self._delegate addEgg:egg];
    }
}

- (NSInteger)reportFood
{
    return self._food;
}

- (NSInteger)reportWater
{
    return self._water;
}

- (NSInteger)reportLevel
{
    return self._level;
}

- (NSString*)reportShedsID
{
    return self._shedsId;
}

- (void)foodCost:(NSInteger)cost chick:(PoultryModel *)poultry
{
    CGFloat realCost = MAX(0, cost-self._foodMagic);
    self._food -= realCost;
    if (self._delegate != nil) {
        [self._delegate setFood:self._food];
    }
    [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:poultry._poultryId BEat:YES HenHouseID:self._shedsId Cost:cost Time:[DateTool Now]];
}

- (void)waterCost:(NSInteger)cost chick:(PoultryModel *)poultry
{
    CGFloat realCost = MAX(0, cost-self._waterMagic);
    self._water -= realCost;
    if (self._delegate != nil) {
        [self._delegate setWater:self._water];
    }
    [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:poultry._poultryId BEat:NO HenHouseID:self._shedsId Cost:cost Time:[DateTool Now]];
}

- (void)occupyFence:(NSInteger)fenceId
{
    [self._fences setObject:[NSNumber numberWithBool:NO] forKey:[NSString stringWithFormat:@"fence%d", fenceId]];
    for (PoultryModel *element in self._poultryModels) {
        [element fenceGrabbed:fenceId];
    }
}

- (BOOL)isFreed:(NSInteger)fenceId
{
    return ([[self._fences objectForKey:[NSString stringWithFormat:@"fence%d", fenceId]] boolValue]);
}

- (BOOL)isAnyFenceFree
{
    BOOL isFree = NO;
    NSEnumerator *enumeratorOb = [self._fences objectEnumerator];
    for (NSNumber *element in enumeratorOb) {
        if ([element boolValue] == YES) {
            isFree = YES;
        }
    }
    return isFree;
}

- (void)releaseFence:(NSInteger)fenceId
{
    [self._fences setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"fence%d", fenceId]];
}

//一级界面接口
- (void)addMagic
{
    [self initMagic];
}

- (void)buildFactory
{
    [self initFactory];
}

- (void) dealloc
{
    self._timing = nil;
    self._eggs = nil;
    self._poultryModels = nil;
    self._fences = nil;
    self._unlockedStates = nil;
	[super dealloc];
    
}

@end
