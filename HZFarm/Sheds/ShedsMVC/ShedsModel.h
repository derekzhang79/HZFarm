//
//  ShedsModel.h
//  Sheds
//
//  Created by Any on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShedsDelegate.h"
#import "ShedsModelServer.h"
#import "ShedsViewServer.h"
#import "cocos2d.h"
#import "Timing.h"
#import "TimingDelegate.h"

@class ChickModel;

@interface ShedsModel : NSObject<ShedsModelServer,TimingDelegate>{
    id<ShedsViewServer> _delegate;
    
    NSString *_shedsId;
    
    NSMutableDictionary *_unlockedStates;
    NSMutableArray *_poultryModels;
    NSMutableArray *_eggs;
    
    NSMutableDictionary *_fences;
    
    NSInteger _score; 
    NSInteger _level;
    NSInteger _money;       
    NSInteger _diamond;     
    NSInteger _maxPoultryNum; 
    CGFloat _water;
    CGFloat _food;
    
    CGFloat _waterMagic;
    CGFloat _foodMagic;
    NSInteger _factoryLevel;
    
    Timing *_timing;
}

@property (nonatomic, assign)id<ShedsViewServer> _delegate;
@property (nonatomic, retain)NSString *_shedsId;
@property (nonatomic, retain)NSMutableArray *_poultryModels;
@property (nonatomic, retain)NSMutableArray *_eggs;
@property (nonatomic, retain)NSMutableDictionary *_unlockedStates;//鸡的种类的解锁状态
@property (nonatomic, retain)NSMutableDictionary *_fences;
@property (nonatomic)NSInteger _score;       //当前得分
@property (nonatomic)NSInteger _level;       //当前等级
@property (nonatomic)NSInteger _money;       //当前金钱
@property (nonatomic)NSInteger _diamond;     //当前宝石数量
@property (nonatomic)NSInteger _maxPoultryNum; //可放养的最大数量
@property (nonatomic)CGFloat _water;
@property (nonatomic)CGFloat _food;
@property (nonatomic)CGFloat _waterMagic;
@property (nonatomic)CGFloat _foodMagic;
@property (nonatomic)NSInteger _factoryLevel;
@property (nonatomic, retain)Timing *_timing;

- (id)initWithShedsId:(NSString *)shedsId;

- (BOOL)addPoultry:(NSInteger)type position:(CGPoint)pos;

- (NSMutableDictionary *)getGameStates;

- (NSInteger)foodNeedOneTime:(NSMutableArray *) poultrysProperty;

- (void)calcFoodAndWater:(NSMutableArray *) poultrysProperty;

- (void)pleaseGoToEat;

- (void)pleaseGoToDrink;

- (void)step:(ccTime)dt;

- (void)upGrade:(NSInteger)destGrade;

@end
