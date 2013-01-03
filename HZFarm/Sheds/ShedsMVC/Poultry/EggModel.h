//
//  Egg.h
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Contents.h"

@interface EggModel : NSObject {
    
    NSInteger _type;
    NSInteger _sellPrice;
    NSInteger _exp; 
    NSDate *_birthDate;
    
    CGPoint _pos;
}

@property (nonatomic)NSInteger _type;
@property (nonatomic)NSInteger _sellPrice;
@property (nonatomic)NSInteger _exp;
@property (nonatomic, retain)NSDate *_birthDate;
@property (nonatomic)CGPoint _pos;

- (id)initWithType:(NSInteger)type pos:(CGPoint)pos;

@end
