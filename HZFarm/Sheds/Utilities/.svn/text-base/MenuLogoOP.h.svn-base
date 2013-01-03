//
//  MenuLogoScale.h
//  Sheds
//
//  Created by Any on 12-4-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

enum Operates{
    none = 0,
    selected = 1
    
};

@interface MenuLogoOP : NSObject{
    CCSprite *_logoSprite;
    enum Operates _op;
}

+ (MenuLogoOP *)getSharedMenuLogoOp;

- (void)setSpriteSelected:(CCSprite *)sp;

- (void)recoverSprite;

@end
