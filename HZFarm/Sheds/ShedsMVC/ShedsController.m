 //
//  ShedsController.m
//  Sheds
//
//  Created by Any on 12-3-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShedsController.h"
#import "ShedsLayer.h"
#import "ShedsModel.h"
#import "FirstWriteFile.h"
#import "AddPoultrys.h"
#import "WarningDialog.h"
#import "Contents.h"


@implementation ShedsController

@synthesize _shedsId;
@synthesize _shedsView;
@synthesize _shedsModel;
@synthesize _poultrysAdder;

- (id)init{
    
    if ((self = [super init])) {
        
        self._shedsId = @"sheds1";
        
        //FirstWriteFile *writer = [[FirstWriteFile alloc] init];
        
        Contents *m = [Contents getContents];
        
        _shedsModel = [[ShedsModel alloc] initWithFile:m.filename_states];
        
        _shedsView = [[ShedsLayer alloc] initWithModel:self._shedsModel delegate:self];
        [self addChild:self._shedsView z:0];
        
        _poultrysAdder = [[AddPoultrys alloc] init];
        self._poultrysAdder._delegate = self;
        [self addChild:self._poultrysAdder z:2];
        
        [self scheduleUpdate];
    }
    
    return self;
}

- (void)initView
{
    _shedsView = [[ShedsLayer alloc] initWithModel:self._shedsModel delegate:self];
    [self addChild:self._shedsView z:0];
    
    _poultrysAdder = [[AddPoultrys alloc] init];
    self._poultrysAdder._delegate = self;
    [self addChild:self._poultrysAdder z:2];
}

- (id)initWithID:(NSString *)shedsId
{
    self._shedsId = shedsId;
    if ((self = [super init])) {
        self._shedsId = shedsId;
        
        //FirstWriteFile *writer = [[FirstWriteFile alloc] init];
        
        //Contents *m = [Contents getContents];
        
        _shedsModel = [[ShedsModel alloc] initWithShedsId:shedsId];
        
        _shedsView = nil;
        
        _poultrysAdder = nil;
        
        [self initView];
        
        [self scheduleUpdate];
    }
    
    return self;
    
}


- (void) update:(ccTime) dt
{
    [self._shedsModel step:dt];
}

- (void)buyPoultr:(NSInteger)type position:(CGPoint)pos
{
    BOOL isAble = [self._shedsModel addPoultry:type position:pos];
    if (isAble == NO && self._shedsView!=nil) {
        NSString *tip = @"您的金币/空间不足，无法添加新成员";
        [self._shedsView showWarning:tip];
    }
}

//一级界面调用
- (void)dataChange
{
    ShedsModel *model = [[ShedsModel alloc] initWithShedsId:self._shedsId];
    self._shedsModel = model;
    [model release];
}

#pragma mark ShedsViewDelegate
//override
- (void)ReadyToAddPoultry:(NSString *)name position:(CGPoint)pos
{
    [self._poultrysAdder readyToAdd:name pos:pos unlockState:self._shedsModel._unlockedStates];
}

#pragma mark AdderDelegate
- (void)addPoultry:(NSInteger)type position:(CGPoint)pos
{
    NSLog(@"add a poultry");
    [self buyPoultr:type position:pos];
    
}

#pragma signOut 
- (void)signOut
{
    [self._shedsModel signOut];

}

- (void) dealloc
{
    self._shedsId = nil;
    self._shedsView = nil;
    self._shedsModel = nil;
    self._poultrysAdder = nil;
	[super dealloc];
}

@end
