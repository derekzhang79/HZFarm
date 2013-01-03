//
//  PoultryTarget.h
//  Sheds
//
//  Created by Any on 12-4-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PoutryTargetDelegate.h"
#import "ShedsModelServer.h"

#define DELTA 1

typedef enum{
    eatTarget = 1,
    drinkTarget,
    layTarget,
    sourceTarget
}Target;

@interface PoultryTarget : NSObject{
    id<ShedsModelServer> _server;
    id<PoutryTargetDelegate> _delegate;
    NSMutableArray *_target;
}

@property (nonatomic, assign)id<PoutryTargetDelegate> _delegate;
@property (nonatomic, assign)id<ShedsModelServer> _server;
@property (nonatomic, retain)NSMutableArray *_target;

- (id)initWithDelegate:(id)delegate server:(id)server;

- (void)createTarget:(NSInteger)act;

- (void)createTargetAt:(NSInteger)act index:(NSInteger)index;

- (BOOL)isAnyTarget;

- (BOOL)fenceGrabbedDeal:(NSInteger)fenceId;

- (void)targetDone;

- (CGPoint)destOfCurrTarget;

- (void)step;

@end
