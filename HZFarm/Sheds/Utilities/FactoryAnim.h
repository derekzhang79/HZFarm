//
//  MyCocos2DClass.h
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ProgressBar.h"
#import "ProgressBarDelegate.h"
#import "FactoryAnimDelegate.h"

@interface FactoryAnim : CCNode<ProgressBarDelegate> {
    
    id<FactoryAnimDelegate> _delegate;
    
    CCSprite *_base;
    CCSprite *_light;
    
    CCAction *_loop;
    CCAction *_erupt;
    
    ProgressBar *_bar;
}


- (id)initWithTimeLong:(NSInteger)timeLong delegate:(id)delegate;

@end
