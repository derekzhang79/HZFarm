//
//  MenuLogoScale.m
//  Sheds
//
//  Created by Any on 12-4-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MenuLogoOP.h"

@implementation MenuLogoOP

static MenuLogoOP *_sharedMenuLogoOP = nil;

+ (MenuLogoOP *)getSharedMenuLogoOp {
    if (!_sharedMenuLogoOP) {
		_sharedMenuLogoOP = [[self alloc] init];
	}
	
	return _sharedMenuLogoOP;
}

- (id)init {
    
    if ((self = [super init])) {
        _logoSprite = nil;
        _op = none;
    }
    
    return self;
}

- (void)setSpriteSelected:(CCSprite *)sp {
    _logoSprite = sp;
    _op = selected;
    NSLog(@"logo selected");
    [_logoSprite runAction:[CCScaleTo actionWithDuration:0.05 scale:1.2]];
}

- (void)recoverSprite{
    if (_op == none) {
        return;
    }
    
    NSLog(@"logo recovered");
    switch (_op) {
        case selected:
            [_logoSprite runAction:[CCScaleTo actionWithDuration:0.05 scale:1]];
            break;
            
        default:
            break;
    }
    
    _logoSprite = nil;
    _op = none;
}


@end
