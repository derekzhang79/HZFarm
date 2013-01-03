//
//  MySprite.h
//  MapTest
//
//  Created by Any on 12-3-22.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Contents.h"
#import "ClockDelegate.h"
#import "PoultryDelegate.h"
#import "ShedsModelServer.h"
#import "PoutryTargetDelegate.h"
#import "DAItemInHenHouse.h"


@class PoultryClock;
@class PoultryTarget;

const static CGFloat SPEED = 1.5f;
const static CGFloat EATBETWEEN = 900.0f;
const static CGFloat SICKPOSSIBLE = 100.0f;
const static CGFloat PAYMEDICINE = 0.2f;

enum Direction{
    back = 1,
    front,
    left,
    leftDown,
    leftUp,
    right,
    rightDown,
    rightUp
};

enum PoultryAction{
    eat = 1,
    stay = 2,
    walk = 4
};

@interface PoultryModel : NSObject<PoultryClockDelegate, PoutryTargetDelegate> {
    
    id<ChickModelDelegate> _delegate;
    
    id<ShedsModelServer> _modelServer;
    
    NSString *_poultryId;
    
    CGFloat _age;
    NSInteger _eggTimes;
    enum PoultryType _type;
    enum PoultryAction _poultryAction;
    enum Direction _direction;
    CGPoint _pos;
    
    PoultryTarget *_target;
    
    BOOL      _isAdult;
    BOOL      _isHarvestAble;
    
    NSString  *_lastLayTime;
    NSString    *_lastEatTime;
    NSString    *_lastDrinkTime;
    BOOL      _isReadyLay;
    BOOL      _isHungry;
    BOOL      _isThirsty;
    BOOL      _isSick;
    BOOL      _hasCalledMedicine;
    
    PoultryClock *_clock;
    
    BOOL _isUpdatePos;
    
    //NSMutableDictionary *_standard;
}

@property (nonatomic, assign)id<ChickModelDelegate> _delegate;
@property (nonatomic, assign)id<ShedsModelServer> _modelServer;

@property (nonatomic, retain)NSString *_poultryId;
@property (nonatomic)CGFloat _age;              //年龄
@property (nonatomic)NSInteger _eggTimes;        //已产蛋数
@property (nonatomic)enum PoultryType _type;    //品种
@property (nonatomic)enum PoultryAction _poultryAction;     //正在执行的动作
@property (nonatomic)enum Direction _direction;             //朝向
@property (nonatomic)CGPoint _pos;                          //位置
//@property (nonatomic, retain)NSMutableDictionary *_standard;
@property (nonatomic, retain)PoultryTarget *_target;

@property (nonatomic)BOOL     _isAdult;
@property (nonatomic)BOOL     _isHarvestAble;

@property (nonatomic, retain)NSString *_lastLayTime;      //上次下蛋时间
@property (nonatomic)BOOL _isReadyLay;
@property (nonatomic, retain)NSString *_lastEatTime;
@property (nonatomic)BOOL _isHungry;
@property (nonatomic, retain)NSString *_lastDrinkTime;
@property (nonatomic)BOOL _isThirsty;
@property (nonatomic)BOOL _isSick;
@property (nonatomic)BOOL _hasCalledMedicine;
@property (nonatomic, retain)PoultryClock *_clock;

@property (nonatomic) BOOL _isUpdatePos;

//- (id)initWithProperty:(NSMutableDictionary *)property poultryId:(NSString *)poultryId position:(CGPoint)pos delegate:(id)delegate;
- (id)initWithProperty:(DAItemInHenHouse *)property poultryId:(NSString *)poultryId position:(CGPoint)pos delegate:(id)delegate;

- (id)initWithPos:(CGPoint)pos  poultryId:(NSString *)poultryId type:(enum PoultryType)type delegate:(id)delegate;

- (void)eat;

- (void)goToEat;

- (void)hasEat;

- (void)goToDrink;

- (void)callForMedicine;

- (BOOL)payForMedicine;

- (void)stay;

- (void)lay;

- (BOOL)goToLay;

- (void)fenceGrabbed:(NSInteger)fenceId;

- (void)recoverFromSick;

- (void)walk:(enum Direction)dir;



- (void)growUp;

- (void)getHarvestable;

- (void)take_a_walk:(ccTime) dt;//散步

- (void)upDatePos:(ccTime) dt;

- (void)updateAge:(ccTime) dt;

- (void)step:(ccTime) dt;

- (void)turnTo:(enum Direction)dir;

- (void)actionChanged;

- (enum Direction)calDirByPos:(CGPoint)pos;

- (void)calcFoodState:(NSString *)date isHungry:(BOOL)isHungry;

- (void)calcWaterState:(NSString *)date isThirsty:(BOOL)isThirsty;



@end
