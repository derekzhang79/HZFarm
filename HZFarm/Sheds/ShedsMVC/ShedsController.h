//
//  ShedsController.h
//  Sheds
//
//  Created by Any on 12-3-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ShedsDelegate.h"
#import "AdderDelegate.h"



@class ShedsModel;
@class ShedsLayer;
@class AddPoultrys;

@interface ShedsController : CCNode<ShedsViewDelegate, AdderDelegate>{
    ShedsLayer *_shedsView;
    ShedsModel *_shedsModel;
    AddPoultrys *_poultrysAdder;
    
    NSString *_shedsId;
}

@property (nonatomic, retain)NSString *_shedsId;
@property (nonatomic, retain)ShedsLayer *_shedsView;
@property (nonatomic, retain)ShedsModel *_shedsModel;
@property (nonatomic, retain)AddPoultrys *_poultrysAdder;

- (id)initWithID:(NSString *)shedsId;

- (void)signOut;

- (void)buyPoultr:(NSInteger)type position:(CGPoint)pos;

- (void)upGrade:(NSInteger)destGrade;

@end
