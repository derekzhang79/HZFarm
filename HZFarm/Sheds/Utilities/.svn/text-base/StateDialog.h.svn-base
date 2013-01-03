//
//  StateDialog.h
//  MapTest
//
//  Created by Any on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ProgressBar.h"
#import "StateDialogDelegate.h"

@class PoultryModel;

@interface StateDialog : CCNode<ProgressBarDelegate>
{
    id<StateDialogDelegate> _delegate;
    CCSprite *_frame;
    
    NSMutableArray *_eggFrames;
    NSMutableArray *_eggs;
    
    CCLabelTTF *_lifeLong;
    
    ProgressBar *_bar;
    
    id _father;
}

- (id)initWithType:(NSInteger)type delegate:(id)delegate father:(id)father;

- (id)initWithPoutry:(PoultryModel*)pty henHouseId:(NSString*)henHouseId delegate:(id)delegate father:(id)father;

@end
