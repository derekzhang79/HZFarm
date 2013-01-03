//
//  ShedsViewServer.h
//  MapTest
//
//  Created by Any on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PoultryModel;
@class ChickView;
@class EggModel;
@class Product;
@class EggView;

@protocol ShedsViewServer <NSObject>

- (void)addPoultry:(PoultryModel *)model;

- (void)setFood:(NSInteger)food;

- (void)setWater:(NSInteger)water;

- (void)showWarning:(NSString *)tip;

- (void)colliTest;

- (void)addEgg:(EggModel *)egg;

- (void)upGrade:(NSInteger)destGrade;

- (void)harvest:(ChickView*)chick;

- (void)harvestEnd:(ChickView*)chick;

- (void)eggHarvestEnd:(EggView*)eggView;

- (void)getProductData:(Product*)product;


@end
