//
//  MySprite.m
//  MapTest
//
//  Created by Any on 12-3-22.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MySprite.h"


@implementation MySprite


- (id)init{

    if((self=[super init])) {
        
    }
    
    return self;
}

- (void)opacity{
    [self setOpacity:128];
}

- (void)recoverFromOpacity
{
    [self setOpacity:255];
}

@end
