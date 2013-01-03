//
//  MyCocos2DClass.h
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ShedsViewServer.h"
#import "EggModel.h"

@class EggModel;

@interface EggView : CCNode {
    
    CCSprite *_egg;
    CCSprite *_shadow;
    EggModel *_model;
    
    id<ShedsViewServer> _delegate;
}

@property(nonatomic, retain)CCSprite *_egg;
@property(nonatomic, retain)CCSprite *_shadow;
@property(nonatomic, retain)EggModel *_model;
@property(nonatomic, assign)id<ShedsViewServer> _delegate;

- (id)initWithEggModel:(EggModel *)egg;

@end
