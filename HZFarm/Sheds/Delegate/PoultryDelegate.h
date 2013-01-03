//
//  ChickDelegate.h
//  Sheds
//
//  Created by Any on 12-3-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contents.h"

enum PoultryAction;

@protocol ChickModelDelegate <NSObject>

- (void)animChange;

- (void)updatePos;

- (void)growUp;

- (void)callForHarvest;

- (void)callForFood;

- (void)callForWater;

- (void)callForMedicine:(NSInteger)medKind;

- (void)callForLay;

- (void)hasAte;

- (void)hasDrinked;

- (void)laying:(NSInteger)timeLong;

@end

