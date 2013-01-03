//
//  chick.h
//  MapTest
//
//  Created by Any on 12-3-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CallForSthDelegate.h"
#import "PoultryDelegate.h"
#import "ProgressBarDelegate.h"
#import "ShedsViewServer.h"

@class PoultryModel;
@class CallForSthLayer;
@class EightDirFinder;

@interface ChickView : CCSprite<ChickModelDelegate, CallForSthDelegate, ProgressBarDelegate> {
    
    id<ShedsViewServer> _viewServer; 

    NSMutableDictionary *_chickActions;
    
    PoultryModel *_model;
    
    CCSprite *_shadow;
    
    CallForSthLayer *_callLayer;
    
    EightDirFinder *_finder;
    
    CGPoint _foot_young;
    CGPoint _foot_adult;
    
    
}

@property (nonatomic, assign)id<ShedsViewServer> _viewServer; 
@property (nonatomic, retain)PoultryModel *_model;
@property (nonatomic, retain)NSMutableDictionary *_chickActions;
@property (nonatomic, retain)CCSprite *_shadow;
@property (nonatomic, retain)CallForSthLayer *_callLayer;
@property (nonatomic, retain)EightDirFinder *_finder;
@property (nonatomic)CGPoint _foot_young;
@property (nonatomic)CGPoint _foot_adult;

- (id)initWithModel:(PoultryModel *)model;

- (void)dealCollision:(NSMutableArray*)fences;

- (void)flipProcess;

- (CGPoint)calcPosByFoot;

@end
