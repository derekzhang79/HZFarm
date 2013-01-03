//
//  ShedsTerrain.m
//  Sheds
//
//  Created by Any on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShedsTerrain.h"
#import "Contents.h"

@implementation ShedsTerrain

static ShedsTerrain *_sharedShedsTerrain = nil;

@synthesize _map;
@synthesize _eatArea;
@synthesize _drinkArea;
@synthesize _layArea;
@synthesize _source;
@synthesize _foodPoint;
@synthesize _waterPoint;
@synthesize _centerPoint;

+ (ShedsTerrain *)getShedsTerrain
{
    if (!_sharedShedsTerrain) {
		_sharedShedsTerrain = [[self alloc] init];
	}
	
	return _sharedShedsTerrain;
}

- (id)init{
    
    if ((self = [super init])) {
        Contents *m = [Contents getContents];
        _map = [[CCTMXTiledMap alloc] initWithTMXFile:m.shedsFile];//加载地图
        
        _eatArea = [[NSMutableDictionary alloc] initWithCapacity:6];
        _drinkArea = [[NSMutableDictionary alloc] initWithCapacity:6];
        _layArea = [[NSMutableDictionary alloc] initWithCapacity:6];
        _source = [[NSMutableDictionary alloc] initWithCapacity:6];
        
        CCTMXObjectGroup *objects = [self._map objectGroupNamed:@"object"];
        
        NSMutableDictionary *rect = [NSMutableDictionary dictionaryWithCapacity:10];
        int counter = 1;
        while ((rect = [objects objectNamed:[NSString stringWithFormat:@"lay%d", counter]]))
        {
            [self._layArea setObject:rect forKey:[NSString stringWithFormat:@"lay%d", counter]];
            counter++;
        }
        
        counter = 1;
        while ((rect = [objects objectNamed:[NSString stringWithFormat:@"drink%d", counter]]))
        {
            [self._drinkArea setObject:rect forKey:[NSString stringWithFormat:@"drink%d", counter]];
            counter++;
        }
        
        counter = 1;
        while ((rect = [objects objectNamed:[NSString stringWithFormat:@"eat%d", counter]]))
        {
            [self._eatArea setObject:rect forKey:[NSString stringWithFormat:@"eat%d", counter]];
            counter++;
        }

        counter = 1;
        while ((rect = [objects objectNamed:[NSString stringWithFormat:@"source%d", counter]]))
        {
            [self._source setObject:rect forKey:[NSString stringWithFormat:@"source%d", counter]];
            counter++;
        }
        
        rect = [objects objectNamed:@"drink"];
        self._waterPoint = ccp([[rect objectForKey:@"x"] intValue], [[rect objectForKey:@"y"] intValue]);
        rect = [objects objectNamed:@"eat"];
        self._foodPoint = ccp([[rect objectForKey:@"x"] intValue], [[rect objectForKey:@"y"] intValue]);
        rect = [objects objectNamed:@"center"];
        self._centerPoint = ccp([[rect objectForKey:@"x"] intValue], [[rect objectForKey:@"y"] intValue]);
    }
    
    return self;
}

-(unsigned int)TiltIDFromPosition:(CGPoint)pos
{
	CGPoint cpt = [self tileCoordinateFromPos:pos];
	CCTMXLayer *ly = [_map layerNamed:@"layer1"];
	
	if (cpt.x < 0)
		return -1;
	
	if (cpt.y < 0)
		return -1;
	
	if (cpt.x >= ly.layerSize.width)
		return -1;
	
	if (cpt.y >= ly.layerSize.height)
		return -1;
	
	return [ly tileGIDAt:cpt];
}

- (BOOL)isInCultivationArea:(CGPoint)pos
{
    BOOL isIn = NO;
    int tid = [self TiltIDFromPosition:pos];
    if (tid!=-1 && tid!=1){
        isIn = YES;
    }
    
    return isIn;
}

-(CGPoint)tileCoordinateFromPos:(CGPoint)pos
{
	int cox, coy;
    
	CCTMXLayer *ly = [_map layerNamed:@"layer1"];
	
	if (ly == nil)
	{
		NSLog(@"ERROR: Layer not found!");
		return ccp(-1, -1);
	}
	
	CGSize szLayer = [ly layerSize];
	CGSize szTile = [_map tileSize];
	
	cox = pos.x / szTile.width;
	coy = szLayer.height - pos.y / szTile.height;
	
	if ((cox >= 0) && (cox < szLayer.width) && (coy >= 0) && (coy < szLayer.height))
	{
		return ccp(cox, coy);
	}
	else {
		return ccp(-1, -1);
	}
	
}

- (CGPoint)pointCenter:(CGPoint)point
{
    int x = point.x/_map.tileSize.width;
    int y = point.y/_map.tileSize.width;
    CGPoint p = CGPointMake(x * _map.tileSize.width + 0.5 * _map.tileSize.width, 
                            y * _map.tileSize.width + 0.5 * _map.tileSize.width);
    return p;
}

- (NSMutableArray *)calcPath:(CGPoint)srcPos dest:(CGPoint)dest
{
    NSMutableArray *path = [[[NSMutableArray alloc] initWithCapacity:10] autorelease];
    CGPoint dis = ccpSub(dest, srcPos);
    NSInteger dir_x = dis.x/abs(dis.x);
    NSInteger dir_y = dis.y/abs(dis.y);
    CGPoint mid;
    if (abs(dis.x) > abs(dis.y)) {
        mid = ccpAdd(srcPos, ccp(dir_x*(abs(dis.x)-abs(dis.y)), 0));
    }
    else {
        mid = ccpAdd(srcPos, ccp(0, dir_y*(abs(dis.y)-abs(dis.x))));
    }
    
    [path addObject:[NSValue valueWithCGPoint:srcPos]];
    [path addObject:[NSValue valueWithCGPoint:mid]];
    [path addObject:[NSValue valueWithCGPoint:dest]];
    return path;
}

- (CGPoint)getNearestEatPos:(CGPoint)srcPos
{
    NSInteger length = 2000;
    CGPoint point = CGPointZero;
    NSEnumerator *enumeratorOb = [self._eatArea objectEnumerator];
    for (NSMutableDictionary *element in enumeratorOb) {
        CGPoint pos = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
        NSInteger len = ccpLength(ccpSub(pos, srcPos));
        if (len<length) {
            length = len;
            point = pos;
        }
    }
    return point;
}

- (CGPoint)getNearestLayPos:(CGPoint)srcPos level:(NSInteger)level
{
    NSInteger length = 2000;
    CGPoint point = CGPointZero;
    for (int i=1; i<=level; i++) {
        
        NSMutableDictionary *element = [self._layArea objectForKey:[NSString stringWithFormat:@"lay%d", i]];
        CGPoint pos = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
        NSInteger len = ccpLength(ccpSub(pos, srcPos));
        if (len<length) {
            length = len;
            point = pos;
        }
    }
    return point;
}

- (NSInteger)getLayPosIdByPos:(CGPoint)pos
{
    for (int i=1; i<=6; i++) {
        NSMutableDictionary *element = [self._layArea objectForKey:[NSString stringWithFormat:@"lay%d", i]];
        CGPoint point = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
        CGPoint dis = ccpSub(point, pos);
        if (ccpLength(dis)  <= 1) {
            return i;
        }
    }
    return -1;
}

- (CGPoint)getLayPosById:(NSInteger)fenceId
{
    NSMutableDictionary *element = [self._layArea objectForKey:[NSString stringWithFormat:@"lay%d", fenceId]];
    CGPoint point = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
    return point;
}

- (CGPoint)getSourcePosById:(NSInteger)fenceId
{
    NSMutableDictionary *element = [self._source objectForKey:[NSString stringWithFormat:@"source%d", fenceId]];
    CGPoint point = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
    return point;
}

- (CGPoint)getNearestDrinkPos:(CGPoint)srcPos
{
    NSInteger length = 2000;
    CGPoint point = CGPointZero;
    NSEnumerator *enumeratorOb = [self._drinkArea objectEnumerator];
    for (NSMutableDictionary *element in enumeratorOb) {
        CGPoint pos = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
        NSInteger len = ccpLength(ccpSub(pos, srcPos));
        if (len<length) {
            length = len;
            point = pos;
        }
    }
    return point;
}

- (CGPoint)getNearestSourcePos:(CGPoint)srcPos
{
    NSInteger length = 2000;
    CGPoint point = CGPointZero;
    NSEnumerator *enumeratorOb = [self._source objectEnumerator];
    for (NSMutableDictionary *element in enumeratorOb) {
        CGPoint pos = ccp([[element objectForKey:@"x"] intValue], [[element objectForKey:@"y"] intValue]);
        NSInteger len = ccpLength(ccpSub(pos, srcPos));
        if (len<length) {
            length = len;
            point = pos;
        }
    }
    return point;
}

- (CGPoint)getCenterPoint
{
    return self._centerPoint;
}

- (void) dealloc
{
    self._map = nil;
    self._eatArea  = nil;
    self._drinkArea  = nil;
    self._layArea = nil;
	[super dealloc];
    
}


@end
