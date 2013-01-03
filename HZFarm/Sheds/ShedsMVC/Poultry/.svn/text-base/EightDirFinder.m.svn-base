//
//  EightDirFinder.m
//  MapTest
//
//  Created by Any on 12-4-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EightDirFinder.h"
#import "Contents.h"
#import "ShedsTerrain.h"

@implementation EightDirFinder

@synthesize _pos;
@synthesize _dirs;
@synthesize _affactDir;

- (id)initWithPos:(CGPoint)pos
{
    if ((self = [super init])) {
        _pos = pos;
        _dirs = [[NSMutableDictionary alloc] initWithCapacity:8];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(0,1), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:1]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(0,-1), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:2]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(-1,0), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:3]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(-1,-1), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:4]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(-1,1), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:5]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(1,0), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:6]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(1,-1), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:7]];
        [_dirs setObject:[NSValue valueWithCGPoint:ccpMult(ccp(1,1), FINDER_LENGTH)] forKey:[NSNumber numberWithInt:8]];
        
        _affactDir = [[NSMutableArray alloc] initWithCapacity:8];
    }
    
    return self;
}

- (BOOL)collWithScreen
{
    ShedsTerrain *m = [ShedsTerrain getShedsTerrain];
    NSEnumerator *enumeratorOb = [self._dirs objectEnumerator];
    for (NSValue *element in enumeratorOb) {
        CGPoint point = [element CGPointValue];
        if (![m isInCultivationArea:ccpAdd(point, self._pos)]) {
            [self._affactDir addObject:element];
        }
    }
    return YES;
}
- (BOOL)collWithFence:(CCSprite *)fence
{
    NSEnumerator *enumeratorOb = [self._dirs objectEnumerator];
    for (NSValue *element in enumeratorOb) {
        CGPoint point = [element CGPointValue];
        if (CGRectContainsPoint(fence.boundingBox, ccpAdd(point, self._pos))) {
            [self._affactDir addObject:element];
        }
    }
    return YES;
}

- (NSInteger)getIntByDir:(NSValue*)currDir
{
    NSInteger dir = 1;
    NSEnumerator *enumeratorOb = [self._dirs keyEnumerator];
    for (NSNumber *key in enumeratorOb) {
        NSValue *element = [self._dirs objectForKey:key];
        if (CGPointEqualToPoint([element CGPointValue], [currDir CGPointValue])) {
            dir = [key intValue];
        }
    }
    return dir;
}

- (NSValue*)getDirByInt:(NSInteger)currDir
{
    return [self._dirs objectForKey:[NSNumber numberWithInt:currDir]];
}

- (NSValue*)getBackDir:(NSInteger)currDir
{
    NSValue *dir;
    switch (currDir) {
        case 1:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:2]];
            break;
        case 2:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:1]];
            break;
        case 3:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:6]];
            break;
        case 4:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:8]];
            break;
        case 5:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:7]];
            break;
        case 6:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:3]];
            break;
        case 7:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:5]];
            break;
        case 8:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:4]];
            break;
            
        default:
            break;
    }
    return dir;
}

- (NSValue*)leftDir:(NSInteger)currDir
{
    NSValue *dir;
    switch (currDir) {
        case 1:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:5]];
            break;
        case 2:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:7]];
            break;
        case 3:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:4]];
            break;
        case 4:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:2]];
            break;
        case 5:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:3]];
            break;
        case 6:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:8]];
            break;
        case 7:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:6]];
            break;
        case 8:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:1]];
            break;
            
        default:
            break;
    }
    return dir;
}

- (NSValue*)RightDir:(NSInteger)currDir
{
    NSValue *dir;
    switch (currDir) {
        case 1:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:8]];
            break;
        case 2:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:4]];
            break;
        case 3:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:5]];
            break;
        case 4:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:3]];
            break;
        case 5:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:1]];
            break;
        case 6:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:7]];
            break;
        case 7:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:2]];
            break;
        case 8:
            dir = [self._dirs objectForKey:[NSNumber numberWithInt:6]];
            break;
            
        default:
            break;
    }
    return dir;
}

- (NSMutableArray*)getFrontDirs:(NSInteger)currDir
{
    NSMutableArray *dirs = [NSMutableArray arrayWithCapacity:3];
    [dirs addObject:[self getDirByInt:currDir]];
    [dirs addObject:[self leftDir:currDir]];
    [dirs addObject:[self RightDir:currDir]];
    return dirs;
}

- (NSMutableArray*)getBackDirs:(NSInteger)currDir
{
    NSMutableArray *dirs = [NSMutableArray arrayWithCapacity:3];
    NSValue *backDir = [self getBackDir:currDir];
    NSInteger currDir_int = [self getIntByDir:backDir];
    [dirs addObject:backDir];
    [dirs addObject:[self leftDir:currDir_int]];
    [dirs addObject:[self RightDir:currDir_int]];
    return dirs;
}

- (NSInteger)dealWithColl:(NSMutableArray*)fences currDir:(NSInteger)currDir
{
    NSInteger dir = -1;
    for (CCSprite *element in fences) {
        [self collWithFence:element];
    }
    [self collWithScreen];
    NSEnumerator *enumeratorOb = [self._dirs keyEnumerator];
    if ([self._affactDir count] == 0) {
        dir = -1;
    }
    else {
        BOOL isNeedDeal = NO;
        for (NSValue *element in self._affactDir) {
            if ([[self getFrontDirs:currDir] containsObject:element] == YES) {
                isNeedDeal = YES;
                break;
            }
        }
        if (isNeedDeal == NO) {
            dir = -1;
        }
        else {
            for (NSNumber *key in enumeratorOb) {
                NSValue *element = [self._dirs objectForKey:key];
                if ([self._affactDir containsObject:element] == YES) {
                    NSValue *backDir = [self getBackDir:[self getIntByDir:element]];
                    dir = [self getIntByDir:backDir];
                    break;
                }
            }
        }
        [self._affactDir removeAllObjects];
    }
    return dir;
}

- (void)dealloc
{
    self._affactDir = nil;
    self._dirs = nil;
    [super dealloc];
}

@end
