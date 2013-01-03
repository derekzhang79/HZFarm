//
//  MySprite.m
//  MapTest
//
//  Created by Any on 12-3-22.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "PoultryModel.h"
#import "PoultryClock.h"
#import "PoultryTarget.h"
#import "ShedsTerrain.h"
#import "EggModel.h"
#import "DAItemService.h"
#import "DAItemPoultryEntity.h"
#import "DAPlayerService.h"
#import "DAHenHousesDataService.h"
#import "DateTool.h"

@implementation PoultryModel

@synthesize _delegate;
@synthesize _poultryId;
@synthesize _modelServer;
@synthesize _age;
@synthesize _eggTimes;
@synthesize _type;
@synthesize _poultryAction;
@synthesize _direction;
@synthesize _pos;
//@synthesize _standard;
@synthesize _isReadyLay;
@synthesize _lastEatTime;
@synthesize _isHungry;
@synthesize _lastDrinkTime;
@synthesize _isThirsty;
@synthesize _lastLayTime;
@synthesize _isAdult;
@synthesize _isHarvestAble;
@synthesize _isSick;
@synthesize _hasCalledMedicine;
@synthesize _clock;
@synthesize _target;
@synthesize _isUpdatePos;

- (id)initWithPos:(CGPoint)pos  poultryId:(NSString *)poultryId  type:(enum PoultryType)type delegate:(id)delegate{
    
    if ((self = [super init])) {
        self._delegate = nil;
        self._modelServer = delegate;
        self._poultryId = poultryId;
        
        _target = [[PoultryTarget alloc] initWithDelegate:self server:delegate];
        
        self._age = 0;
        self._eggTimes = 0;
        self._type = type;
        self._pos = pos;
        self._isAdult = NO;
        self._isHarvestAble = NO;
        self._poultryAction = stay;
        self._direction = getRandomNumber(back, rightUp);
        
        
        
        self._isHarvestAble = NO;
        self._lastLayTime = [DateTool Now];
        self._isReadyLay = NO;
        self._lastEatTime = [DateTool Now];
        self._isHungry = NO;
        self._lastDrinkTime = [DateTool Now];
        self._isThirsty = NO;
        self._isSick = NO;
        
        Contents *m = [Contents getContents];
        DAItemPoultryEntity *entity = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:YES isHarvest:NO]];
        NSInteger layBetween = entity.LayNeedTime;
        
        _clock = [[PoultryClock alloc] init];
        self._clock._delegate = self;
        self._clock._layCycle = layBetween*SECONDS_ONE_HOUR;
        self._clock._eatCycle = EATBETWEEN*SECONDS_ONE_HOUR;
        self._clock._drinkCycle = EATBETWEEN*SECONDS_ONE_HOUR;
        [self._clock resetEatClock:0];
        [self._clock resetDrinkClock:1];
        
        self._isUpdatePos = YES;
    }
    
    return self;
}



- (id)initWithProperty:(DAItemInHenHouse *)property  poultryId:(NSString *)poultryId position:(CGPoint)pos delegate:(id)delegate{
    if ((self = [super init])) {
        self._delegate = nil;
        self._modelServer = delegate;
        self._poultryId = poultryId;
        
        
        
        _target = [[PoultryTarget alloc] initWithDelegate:self server:delegate];
        
        Contents *m = [Contents getContents];
        DAItemInHenHouse *item = [[DAHenHousesDataService shareHenHouseDataService] GetItemFromHenHouse:[self._modelServer reportShedsID] TableID:poultryId];
        
        self._age = property.ActiveGrowTime;
        self._eggTimes = item.layEggs;
        self._type = [m getTypeBySysName:property.sysName];
        self._pos = pos;
        self._poultryAction = stay;
        self._direction = getRandomNumber(back, rightUp);
        
        
        long interval_sign = [DateTool GetTimeSpanFromEarly:[DAPlayerService sharePlayerService].playerEntity.lastLeave];
        
        DAItemPoultryEntity *entityYoung = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:NO isHarvest:NO]];
        DAItemPoultryEntity *entityAdult = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:YES isHarvest:NO]];
        NSInteger layBetween = entityAdult.LayNeedTime;
        
        //判断下线时候的状态
        int lifeHour = entityYoung.TransNeedTime + entityAdult.TransNeedTime;
        int youngHour = entityYoung.TransNeedTime;
        if (self._age >= youngHour*SECONDS_ONE_HOUR) {
            self._isAdult = YES;
        }
        else{
            self._isAdult = NO;
        }
        
        if (self._age >= lifeHour*SECONDS_ONE_HOUR) {
            self._isHarvestAble = YES;
        }
        else{
            self._isHarvestAble = NO;
        }
        
        //判断上线时候的状态
        self._age += interval_sign;
        self._age = MIN(self._age, lifeHour*SECONDS_ONE_HOUR);
        NSString *sysName = [m getSysNameByType:self._type isAdult:self._isAdult isHarvest:self._isHarvestAble];
        DAItemPoultryEntity *selfEntity = [[DAItemService shareService] GetPoultryItemByName:sysName];
        NSString *transDest = selfEntity.TransDestName;
        if (self._age >= youngHour*SECONDS_ONE_HOUR) {
            if (self._isAdult == NO) {
                [[DAPlayerService sharePlayerService] PoultryGrowInhenHouse:[self._modelServer reportShedsID] TID:self._poultryId TransDest:transDest];
            }
            self._isAdult = YES;
        }
        else{
            self._isAdult = NO;
        }
        
        if (self._age >= lifeHour*SECONDS_ONE_HOUR) {
            if (self._isHarvestAble == NO) {
                [[DAPlayerService sharePlayerService] PoultryGrowInhenHouse:[self._modelServer reportShedsID] TID:self._poultryId TransDest:transDest];
            }
            self._isHarvestAble = YES;
        }
        else{
            self._isHarvestAble = NO;
        }
        
        self._lastEatTime = property.lastFoodTime;
        long interval_eat = [DateTool GetTimeSpanFromEarly:self._lastEatTime];
        if (interval_eat >= EATBETWEEN*SECONDS_ONE_HOUR) {
            self._isHungry = YES;
        }
        else{
            self._isHungry = NO;
        }
        
        self._lastDrinkTime = property.lastWaterTime;
        NSTimeInterval interval_drink = [DateTool GetTimeSpanFromEarly:self._lastDrinkTime];
        if (interval_drink >= EATBETWEEN*SECONDS_ONE_HOUR) {
            self._isThirsty = YES;
        }
        else{
            self._isThirsty = NO;
        }
        
        self._isSick = NO;
        //        if (self._isSick == NO) {
        //            NSInteger hours = interval_sign/SECONDS_ONE_HOUR;
        //            NSInteger rand = RANDOM(0, 100);
        //            if (rand <= hours*SICKPOSSIBLE) {
        //                self._isSick = YES;
        //            }
        //            else{
        //                self._isSick = NO;
        //            }
        //        }
        self._hasCalledMedicine = YES;
        
        self._lastLayTime = property.lastLayTime;
        NSTimeInterval interval_lay = [DateTool GetTimeSpanFromEarly:self._lastLayTime];
        NSTimeInterval interval_least = MIN(MIN(interval_lay, interval_drink), interval_eat);
        //CGFloat layBetween = [[self._standard objectForKey:@"timeBetween"] floatValue];
        NSInteger maxEggs = 3;
        if (interval_least >=  layBetween*SECONDS_ONE_HOUR && self._eggTimes<maxEggs) {
            self._isReadyLay = YES;
        }
        else {
            self._isReadyLay = NO;
        }
        _clock = [[PoultryClock alloc] init];
        self._clock._delegate = self;
        self._clock._layCycle = layBetween*SECONDS_ONE_HOUR;
        self._clock._eatCycle = EATBETWEEN*SECONDS_ONE_HOUR;
        self._clock._drinkCycle = EATBETWEEN*SECONDS_ONE_HOUR;
        
        if (self._isHungry == YES) {
            [self._clock resetEatClock:self._clock._eatCycle];
        }
        else{
            [self._clock resetEatClock:[DateTool GetTimeSpanFromEarly:self._lastEatTime]];
        }
        if (self._isThirsty == YES) {
            [self._clock resetDrinkClock:self._clock._drinkCycle];
        }
        else{
            [self._clock resetDrinkClock:[DateTool GetTimeSpanFromEarly:self._lastDrinkTime]];
        }
        
        if (self._isAdult == YES) {
            [self._clock resetLayClock:[DateTool GetTimeSpanFromEarly:self._lastLayTime]];
            if (self._isThirsty || self._isHungry) {
                [self._clock pauseLayClock];
            }
        }
        
        self._isUpdatePos = YES;
        
    }
    return self;
}

- (void)calcFoodState:(NSString *)date isHungry:(BOOL)isHungry
{
    self._lastEatTime = date;
    self._isHungry = isHungry;
}

- (void)calcWaterState:(NSString *)date isThirsty:(BOOL)isThirsty
{
    self._lastDrinkTime = date;
    self._isThirsty = isThirsty;
}

- (void)turnTo:(enum Direction)dir{
    if (self._direction != dir) {
        self._direction = dir;
        [self actionChanged];
    }
}

- (void)eat{
    NSLog(@"eat***********************");
    if (self._poultryAction != eat) {
        self._poultryAction = eat;
        [self actionChanged];
    }
}

- (void)goToEat
{
    NSLog(@"goToEat*****************");
    Contents *m = [Contents getContents];
    DAItemPoultryEntity *entity = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:self._isAdult isHarvest:self._isHarvestAble]];
    CGFloat cost = entity.NeedFood*0.25;
    CGFloat food = [self._modelServer reportFood];
    if (cost > food) {
        if (self._delegate != nil) {
            [self._delegate callForFood];
        }
        else {
            
        }
        
        self._isHungry = YES;
        [self._clock pauseLayClock];
    }
    else{
        [self._target createTarget:eatTarget];
    }
}

- (void)goToDrink
{
    NSLog(@"goToDrink*****************");
    Contents *m = [Contents getContents];
    NSString *sysName = [m getSysNameByType:self._type isAdult:self._isAdult isHarvest:self._isHarvestAble];
    DAItemPoultryEntity *entity = [[DAItemService shareService] GetPoultryItemByName:sysName];
    CGFloat cost = entity.NeedWater*0.25;
    CGFloat water = [self._modelServer reportWater];
    if (cost > water) {
        if (self._delegate != nil) {
            [self._delegate callForWater];
        }
        else {
            
        }
        
        self._isThirsty = YES;
        [self._clock pauseLayClock];
    }
    else{
        [self._target createTarget:drinkTarget];
    }
    
}

- (void)hasEat
{
    NSLog(@"has ate");
    NSMutableDictionary *currTarget = [self._target._target objectAtIndex:0];
    Target act = [[currTarget objectForKey:@"act"] intValue];
    Contents *m = [Contents getContents];
    DAItemPoultryEntity *entity = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:self._isAdult isHarvest:self._isHarvestAble]];
    CGFloat cost = entity.NeedWater*0.25;
    if (act == eatTarget) {//吃东西
        [self._modelServer foodCost:cost chick:self];
        [self._clock resetEatClock:0];
        if (self._delegate != nil) {
            [self._delegate hasAte];
        }
        self._isHungry = NO;
        self._lastEatTime = [DateTool Now];
        [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:self._poultryId BEat:YES HenHouseID:[self._modelServer reportShedsID] Cost:cost Time:[DateTool Now]];
    }
    else if(act == drinkTarget){//喝水
        [self._modelServer waterCost:cost chick:self];
        [self._clock resetDrinkClock:0];
        if (self._delegate != nil) {
            [self._delegate hasDrinked];
        }
        [[DAPlayerService sharePlayerService] EatOrWaterPoultryByTID:self._poultryId BEat:NO HenHouseID:[self._modelServer reportShedsID] Cost:cost Time:[DateTool Now]];
        self._isThirsty = NO;
        self._lastDrinkTime = [DateTool Now];
    }
    if (self._isHungry==NO && self._isThirsty==NO) {
        
        [self._clock recoverLayClock];
    }
    [self._target targetDone];
    [self stay];
}

- (void)lay{
    NSLog(@"lay***********************");
    self._eggTimes++;
    Contents *m = [Contents getContents];
    DAItemPoultryEntity *entityAdult = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:YES isHarvest:NO]];
    NSInteger maxEggsNum = entityAdult.nLaySum;
    if (self._eggTimes < maxEggsNum) {
        [self._clock resetLayClock:0];
    }
    ShedsTerrain *t = [ShedsTerrain getShedsTerrain];
    NSInteger fenceId = [t getLayPosIdByPos:self._pos];
    if (fenceId != -1) {
        [self._modelServer releaseFence:fenceId];
    }
    self._lastLayTime  = [DateTool Now];
    [[DAPlayerService sharePlayerService] PoultryLayInHenHouse:[self._modelServer reportShedsID] TID:self._poultryId];
    for (int i=1; i<=entityAdult.nLayNum; i++) {
        EggModel *egg = [[EggModel alloc] initWithType:self._type pos:ccpAdd(self._pos, ccp(5*i,0))];
        [self._modelServer addEgg:egg];
        [egg release];
    }
    [self._target targetDone];
    [self stay];
}

- (BOOL)goToLay
{
    BOOL isSuccessed = NO;
    if (self._isHungry==NO && self._isThirsty==NO && self._isSick==NO) {
        BOOL isFree = [self._modelServer isAnyFenceFree];
        if (self._isReadyLay==YES && isFree==YES) {
            [self._target createTarget:layTarget];
            [self._target createTarget:sourceTarget];
            self._isReadyLay = NO;
            isSuccessed = YES;
        }
    }
    return isSuccessed;
}

- (void)fenceGrabbed:(NSInteger)fenceId
{
    if ([self._target fenceGrabbedDeal:fenceId] == NO) {
        self._isReadyLay = YES;
    }
    
}

- (void)stay{
    NSLog(@"stay***********************");
    if (self._poultryAction != stay) {
        self._poultryAction = stay;
        [self actionChanged];
    }
}

- (void)walk:(enum Direction)dir{
    NSLog(@"walk***********************");
    if (self._poultryAction != walk) {
        self._poultryAction = walk;
        [self actionChanged];
    }
    [self turnTo:dir];
    
}

- (void)getHarvestable
{
    [self._clock stopLayClock];
    self._isHarvestAble = YES;
    Contents *m = [Contents getContents];
    NSString *sysName = [m getSysNameByType:self._type isAdult:YES isHarvest:NO];
    DAItemPoultryEntity *selfEntity = [[DAItemService shareService] GetPoultryItemByName:sysName];
    NSString *transDest = selfEntity.TransDestName;
    self._poultryId = [[DAPlayerService sharePlayerService] PoultryGrowInhenHouse:[self._modelServer reportShedsID] TID:self._poultryId TransDest:transDest].ID;
    [self._delegate callForHarvest];
}

- (void)growUp{
    //[self stay];
    self._isAdult = YES;
    [self._clock resetLayClock:self._clock._layCycle-1];
    if (self._isThirsty || self._isHungry) {
        [self._clock pauseLayClock];
    }
    if (self._delegate != nil) {
        [self._delegate growUp];
    }
    Contents *m = [Contents getContents];
    NSString *sysName = [m getSysNameByType:self._type isAdult:NO isHarvest:NO];
    DAItemPoultryEntity *selfEntity = [[DAItemService shareService] GetPoultryItemByName:sysName];
    NSString *transDest = selfEntity.TransDestName;
    self._poultryId = [[DAPlayerService sharePlayerService] PoultryGrowInhenHouse:[self._modelServer reportShedsID] TID:self._poultryId TransDest:transDest].ID;
}

- (void)recoverFromSick
{
    self._isSick = NO;
}

- (void)actionChanged{
    if (self._delegate != nil) {
        [self._delegate animChange];
    }
    
}

- (void)take_a_walk:(ccTime) dt
{
    static CGFloat timeCal = 0;
    if (timeCal >= 3) {
        timeCal = RANDOM(0, 1);
        NSInteger dir = RANDOM(back, rightUp);
        if (self._poultryAction != walk) {
            [self walk:dir];
        }
        else{
            [self stay];
        }
    }
    timeCal += dt;
}

- (void)upDatePos:(ccTime) dt
{
    CGPoint vel = CGPointZero;
    if (self._poultryAction == walk) {
        switch (self._direction) {
            case back:
                vel = ccp(0, 1);
                break;
            case front:
                vel = ccp(0, -1);
                break;
            case left:
                vel = ccp(-1, 0);
                break;
            case leftDown:
                vel = ccp(-1, -1);
                break;
            case leftUp:
                vel = ccp(-1, 1);
                break;
            case right:
                vel = ccp(1, 0);
                break;
            case rightDown:
                vel = ccp(1, -1);
                break;
            case rightUp:
                vel = ccp(1, 1);
                break;
                
            default:
                break;
        }
    }
    vel = normalize(vel);
    vel = ccp(vel.x*SPEED, vel.y*SPEED);
    self._pos = ccpAdd(self._pos, vel);
    if (self._delegate != nil) {
        [self._delegate updatePos];
    }
    
}

- (void)updateAge:(ccTime) dt
{
    Contents *m = [Contents getContents];
    DAItemPoultryEntity *entityYoung = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:NO isHarvest:NO]];
    DAItemPoultryEntity *entityAdult = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:YES isHarvest:NO]];
    
    int lifeHour = entityYoung.TransNeedTime + entityAdult.TransNeedTime;
    int youngHour = entityYoung.TransNeedTime;
    if (self._age <= lifeHour*SECONDS_ONE_HOUR &&
        self._isHungry == NO &&
        self._isThirsty == NO) 
    {
        self._age += dt;
        if (self._age >= youngHour*SECONDS_ONE_HOUR &&
            self._isAdult == NO) 
        {
            [self growUp];
        }
    }
    else if (self._age>=lifeHour*SECONDS_ONE_HOUR &&
             self._isHungry == NO &&
             self._isThirsty == NO) 
    {
        if (self._isHarvestAble == NO) {
            [self getHarvestable];
        }
    }
}

- (void)step:(ccTime) dt
{
    if (self._isUpdatePos==NO) {
        [self stay];
        return;
    }
    if ([self._target isAnyTarget] == NO) {
        [self take_a_walk:dt];
    }
    else{
        [self._target step];
    }
    [self callForMedicine];
    [self upDatePos:dt];
    [self updateAge:dt];
    [self._clock step:dt];
}

- (void)callForMedicine
{
    if (self._isSick==YES && self._hasCalledMedicine==NO) {
        NSLog(@"call for medicine");
        NSInteger medKind = RANDOM(3, 5);//3-red 4-blue 5-green
        if (self._delegate != nil) {
            [self._delegate callForMedicine:medKind];
        }
        
        self._hasCalledMedicine = YES;
    }
}

- (BOOL)payForMedicine
{
    //    Contents *m = [Contents getContents];
    //    DAItemPoultryEntity *entityYoung = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:NO isHarvest:NO]];
    //    NSInteger price = entityYoung.BuyPrice;
    //    NSInteger pay = price*PAYMEDICINE;
    return YES;
}

- (enum Direction)calDirByPos:(CGPoint)pos
{
    CGFloat x = pos.x - self._pos.x;
    CGFloat y = pos.y - self._pos.y;
    enum Direction dir = right;
    if (x > DELTA) {
        if (y > DELTA) {
            dir = rightUp;
        }
        else if (y <-DELTA){
            dir = rightDown;
        }
        else{
            dir = right;
        }
        
    }
    
    else if (x < -DELTA){
        if (y > DELTA) {
            dir = leftUp;
        }
        else if (y <-DELTA){
            dir = leftDown;
        }
        else{
            dir = left;
        }
    }
    else {
        if (y > DELTA) {
            dir = back;
        }
        else if (y <-DELTA){
            dir = front;
        }
        else{
            dir = self._direction;
        }
        
    }
    return dir;
}

#pragma PoultryClockDelegate mark
- (void)timeToLay
{
    NSLog(@"timeToLay********************");
    //[self._clock resetLayClock:0];
    Contents *m = [Contents getContents];
    DAItemPoultryEntity *entity = [[DAItemService shareService] GetPoultryItemByName:[m getSysNameByType:self._type isAdult:YES isHarvest:NO]];
    NSInteger maxEggsNum = entity.nLaySum;
    if (self._eggTimes < maxEggsNum) {
        self._isReadyLay = YES;
        if (self._delegate != nil) {
            [self._delegate callForLay];
        }
        else {
            
        }
    }
    
}

- (void)timeToEat
{
    NSLog(@"timeToEat********************");
    //[self._clock resetEatClock:0];
    [self goToEat];
    
}

- (void)timeToDrink
{
    NSLog(@"timeToDrink******************");
    //[self._clock resetDrinkClock:0];
    
    [self goToDrink];
    
    
}

#pragma PoutryTargetDelegate mark
- (CGPoint)reportPos
{
    return self._pos;
}

- (void)setPos:(CGPoint)pos
{
    self._pos = pos;
}

- (void)moveTo:(CGPoint)dest
{
    enum Direction dir = [self calDirByPos:dest];
    [self walk:dir];
}

- (void)arriveAndDo:(NSInteger)act
{
    ShedsTerrain *t = [ShedsTerrain getShedsTerrain];
    if (act == eatTarget) {
        CGPoint foodPos = t._foodPoint;
        enum Direction dir = [self calDirByPos:foodPos];
        [self turnTo:dir];
        if (self._delegate != nil) {
            [self eat];
        }
        else {
            [self hasEat];
            [self._target targetDone];
        }
    }
    else if (act == drinkTarget) {
        
        CGPoint waterPoint = t._waterPoint;
        enum Direction dir = [self calDirByPos:waterPoint];
        [self turnTo:dir];
        if (self._delegate != nil) {
            [self eat];
        }
        else {
            [self hasEat];
            [self._target targetDone];
        }
    }
    else if (act == layTarget) {
        CGPoint dest = [self._target destOfCurrTarget];
        NSInteger fenceId = [t getLayPosIdByPos:dest];
        if (fenceId != -1) {
            [self._modelServer occupyFence:fenceId];
        }
        CGPoint lookAt = [t getNearestSourcePos:dest];
        enum Direction dir = [self calDirByPos:lookAt];
        [self turnTo:dir];
        [self stay];
        if (self._delegate != nil) {
            [self._delegate laying:10];
        }
    }
    else{
        [self._target targetDone];
    }
}

- (void) dealloc
{
    //self._standard = nil;
    self._lastLayTime = nil;
    self._lastEatTime = nil;
    self._lastDrinkTime = nil;
    self._clock = nil;
    self._target = nil;
	[super dealloc];
}

@end
