//
//  ShedsTerrain.h
//  Sheds
//
//  Created by Any on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



@interface ShedsTerrain : NSObject{
    CCTMXTiledMap *_map;
    NSMutableDictionary *_eatArea;
    NSMutableDictionary *_drinkArea;
    NSMutableDictionary *_layArea;
    NSMutableDictionary *_source;
    
    CGPoint _foodPoint;
    CGPoint _waterPoint;
    CGPoint _centerPoint;
}

@property (nonatomic, retain)CCTMXTiledMap *_map;
@property (nonatomic, retain)NSMutableDictionary *_eatArea;
@property (nonatomic, retain)NSMutableDictionary *_drinkArea;
@property (nonatomic, retain)NSMutableDictionary *_layArea;
@property (nonatomic, retain)NSMutableDictionary *_source;
@property (nonatomic)CGPoint _foodPoint;
@property (nonatomic)CGPoint _waterPoint;
@property (nonatomic)CGPoint _centerPoint;


+ (ShedsTerrain *)getShedsTerrain;

- (CGPoint)pointCenter:(CGPoint)point;//给定点所在网格中心

- (CGPoint)tileCoordinateFromPos:(CGPoint)pos;

- (BOOL)isInCultivationArea:(CGPoint)pos;

- (unsigned int)TiltIDFromPosition:(CGPoint)pos;

- (CGPoint)getNearestEatPos:(CGPoint)srcPos;
- (CGPoint)getNearestLayPos:(CGPoint)srcPos level:(NSInteger)level;
- (CGPoint)getNearestDrinkPos:(CGPoint)srcPos;
- (CGPoint)getNearestSourcePos:(CGPoint)srcPos;

- (NSInteger)getLayPosIdByPos:(CGPoint)pos;

- (CGPoint)getLayPosById:(NSInteger)fenceId;

- (CGPoint)getSourcePosById:(NSInteger)fenceId;

- (CGPoint)getCenterPoint;

- (NSMutableArray *)calcPath:(CGPoint)srcPos dest:(CGPoint)dest;

@end
