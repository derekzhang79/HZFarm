//
//  Firstlayermenu.h
//  MapTest
//
//  Created by hzbc on 12-4-9.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Worldlayerprotocol.h"
#import "Speakermenu.h"
@interface Firstlayermenu : CCLayer {
    CCSprite  *menubarright;
    CCMenuItemImage *Arrowleft;
    BOOL ARROWLEFT;
    CCMenu *menusmenu;
    NSTimer *connectionTimer;
    CCSprite *menubarup;
    CCMenu *menutool; 
    CCMenuItemImage *menutools;
  
    

    
}

@end
