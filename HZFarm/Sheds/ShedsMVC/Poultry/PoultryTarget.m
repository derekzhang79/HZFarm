//
//  PoultryTarget.m
//  Sheds
//
//  Created by Any on 12-4-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PoultryTarget.h"
#import "ShedsTerrain.h"

@implementation PoultryTarget

@synthesize _server;
@synthesize _target;
@synthesize _delegate;

- (id)initWithDelegate:(id)delegate server:(id)server
{
    if ((self = [super init])) {
        self._server = server;
        self._delegate = delegate;
        _target = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    return self;
}

- (NSMutableArray *)createPath:(NSInteger)act
{
    ShedsTerrain *t = [ShedsTerrain getShedsTerrain];
    CGPoint pos = [self._delegate reportPos];
    NSMutableArray *path;
    
    CGPoint dest;
    switch (act) {
        case eatTarget:
            dest = [t getNearestEatPos:pos];
            break;
        case drinkTarget:
            dest = [t getNearestDrinkPos:pos];
            break;
        case layTarget:
            dest = [t getNearestLayPos:pos level:[self._server reportLevel]];
            if ([self._server isFreed:[t getLayPosIdByPos:dest]] == NO) {
                for (int i=1; i<=[self._server reportLevel]; i++) {
                    if ([self._server isFreed:i] == YES) {
                        dest = [t getLayPosById:i];
                        break;
                    }
                }
            }
            break;
        case sourceTarget:
            dest = [t getNearestSourcePos:pos];
            break;
            
        default:
            break;
    }
    if (act == layTarget) {
        CGPoint center = [t getCenterPoint];
        NSInteger FenceId = [t getLayPosIdByPos:dest];
        CGPoint source = [t getSourcePosById:FenceId];
        
        if ((pos.x>dest.x && pos.x>center.x) ||
            (pos.x<dest.x && pos.x<center.x)) 
        {
            path = [t calcPath:pos dest:center];
            NSMutableArray *path2 = [t calcPath:center dest:source];
            NSMutableArray *path3 = [t calcPath:source dest:dest];
            [path addObjectsFromArray:path2];
            [path addObjectsFromArray:path3];
        }
        else {
            path = [t calcPath:pos dest:source];
            NSMutableArray *path2 = [t calcPath:source dest:dest];
            [path addObjectsFromArray:path2];
        }
    }
    else {
        path = [t calcPath:pos dest:dest];
    }
    return path;
}

- (void)createTarget:(NSInteger)act
{
    NSMutableDictionary *oneTarget = [[NSMutableDictionary alloc] initWithCapacity:2];
    [oneTarget setObject:[NSNumber numberWithInt:act] forKey:@"act"];
    if ([self._target count] == 0) {
        NSMutableArray *path = [self createPath:act];
        [oneTarget setObject:path forKey:@"path"];
    }
    [self._target addObject:oneTarget];
    [oneTarget release];
    
}

- (void)createTargetAt:(NSInteger)act index:(NSInteger)index
{
    NSMutableDictionary *oneTarget = [[NSMutableDictionary alloc] initWithCapacity:2];
    [oneTarget setObject:[NSNumber numberWithInt:act] forKey:@"act"];
    if ([self._target count] == 0) {
        NSMutableArray *path = [self createPath:act];
        [oneTarget setObject:path forKey:@"path"];
    }
    [self._target insertObject:oneTarget atIndex:index];
    [oneTarget release];
}

- (CGPoint)destOfCurrTarget
{
    CGPoint dest;
    NSMutableDictionary *currTarget = [self._target objectAtIndex:0];
    NSMutableArray *path = [currTarget objectForKey:@"path"];
    if ([path count] != 0) {
        dest = [[path lastObject] CGPointValue];
    }
    else {
        dest = [self._delegate reportPos];
    }
    return dest;
}

- (BOOL)isAnyTarget
{
    if ([self._target count] == 0) {
        return NO;
    }
    return YES;
}

- (void)step
{
    if ([self._target count] == 0) {
        return;
    }
    else
    {
        NSMutableDictionary *currTarget = [self._target objectAtIndex:0];
        NSMutableArray *path = [currTarget objectForKey:@"path"];
        
        if ([path count] == 0) {
            return;
        }
        else
        {
            CGPoint dest = [[path objectAtIndex:0] CGPointValue];
            CGPoint pos = [self._delegate reportPos];
            
            if (ccpLength(ccpSub(pos, dest)) <= DELTA*4) {
                [self._delegate setPos:dest];
                [path removeObjectAtIndex:0];
                if ([path count] == 0) {
                    NSInteger act = [[currTarget objectForKey:@"act"] intValue];
                    [self._delegate arriveAndDo:act];
                }
                else
                {
                    dest = [[path objectAtIndex:0] CGPointValue];
                    [self._delegate moveTo:dest];
                }
            }
        }
    }
}

- (BOOL)fenceGrabbedDeal:(NSInteger)fenceId
{
    ShedsTerrain *t = [ShedsTerrain getShedsTerrain];
    if ([self._target count] != 0) {
        NSMutableDictionary *target = [self._target objectAtIndex:0];
        NSInteger currAct = [[target objectForKey:@"act"] intValue];
        if (currAct != layTarget) {
            return YES;
        }
        NSMutableArray *path = [target objectForKey:@"path"];
        CGPoint dest = [[path lastObject] CGPointValue];
        NSInteger fence =  [t getLayPosIdByPos:dest];
        
        if (fence!=fenceId || [path count]==0) {//仅仅考虑要去同一个栅栏，并且正在路上的精灵
            return YES;
        }
        
        [self targetDone];
        if ([self._server isAnyFenceFree] == YES) {
            [self createTargetAt:layTarget index:1];//0为sourceTarget
            [self createTargetAt:sourceTarget index:2];
            return YES;
        }
        return NO;
    }
    return YES;
}

- (void)targetDone
{
    [self._target removeObjectAtIndex:0];
    if ([self._target count] == 0) {
        return;
    }
    NSMutableDictionary *currTarget = [self._target objectAtIndex:0];
    Target act = [[currTarget objectForKey:@"act"] intValue];
    NSMutableArray *path = [self createPath:act];
    [currTarget setObject:path forKey:@"path"];
    CGPoint curr = [[path objectAtIndex:0] CGPointValue];
    [self._delegate moveTo:curr];
}

- (void)dealloc
{
    self._target = nil;
    [super dealloc];
}

@end
