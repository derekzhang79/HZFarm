//
//  Menu_Help.h
//  MapTest
//
//  Created by mac on 12-4-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SWScrollView.h"

@interface Menu_Help : CCLayer 
{
    SWScrollView    *userItemScrollView;
}

@property (nonatomic, retain) SWScrollView *userItemScrollView;

@end
