//
//  Egg.m
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "EggModel.h"


@implementation EggModel

@synthesize _type;
@synthesize _sellPrice;
@synthesize _exp; 
@synthesize _birthDate;
@synthesize _pos;

- (id)initWithType:(NSInteger)type  pos:(CGPoint)pos
{
    if ((self = [super init])) {
        self._type = type;
        
        self._pos = pos;
        
        Contents *m = [Contents getContents];
        
        NSMutableDictionary *standard = [NSMutableDictionary dictionaryWithDictionary:[m._poultryStandard objectForKey:[NSString stringWithFormat:@"poultry%dStandard", self._type]]];
        
        self._exp = [[standard objectForKey:@"score"] intValue];
        self._sellPrice = [[standard objectForKey:@"eggPrice"] intValue];
        _birthDate = [[NSDate alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    self._birthDate = nil;
    [super dealloc];
}

@end
